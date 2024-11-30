local codegen = require "codegen"
local idl = codegen.idl "bgfx.idl"

local odin_template = [[
//
// AUTO GENERATED - DO NOT EDIT!
//

package bgfx

import c "core:c/libc"
import "core:math/bits"

when ODIN_OS == .Windows {
	// TODO(lachsinc): DLL support?
	foreign import bgfx {
		"lib/win64/bgfx.lib",
		"lib/win64/bimg.lib",
		"lib/win64/bimg_decode.lib",
		"lib/win64/bx.lib",
		"system:user32.lib",
		"system:gdi32.lib",
		"system:shell32.lib",
	}
} else when ODIN_OS == .Linux {
	// TODO(lachsinc): Linux
} else when ODIN_OS == .Darwin {
	// TODO(lachsinc): Mac
}

$version

ViewId :: distinct u16

INVALID_HANDLE :: bits.U16_MAX

$types

$funcs_wrapper

@(default_calling_convention="c")
foreign bgfx {
$funcs_bindings
}
]]

local function isempty(s)
	return s == nil or s == ''
end

local function hasPrefix(str, prefix)
	return prefix == "" or str:sub(1, #prefix) == prefix
end

local function hasSuffix(str, suffix)
	return suffix == "" or str:sub(-#suffix) == suffix
end

local function to_underscorecase(name)
	local tmp = {}
	for v in name:gmatch "[_%u][%l%d]*" do
		if v:byte() == 95 then	-- '_'
			v = v:sub(2)	-- remove _
		end
		tmp[#tmp+1] = v
	end
	return table.concat(tmp, "_")
end

local function underscorecase_to_camelcase(name)
	local tmp = {}
	for v in name:gmatch "[^_]+" do
		tmp[#tmp+1] = v:sub(1,1):upper() .. v:sub(2)
	end
	return table.concat(tmp)
end

local enum = {}

local function convert_array(member)
	-- if string.find(member.array, "::") then
	-- 	return string.format("[%s]", enum[member.array])
	-- else
	-- TODO(lachsinc): Can we omit .COUNT?
	return member.array:gsub("::Count", ".COUNT")
	-- end
end

local function gisub(s, pat, repl, n)
	pat = string.gsub(pat, '(%a)', function(v)
		return '[' .. string.upper(v) .. string.lower(v) .. ']'
	end)
	if n then
		return string.gsub(s, pat, repl, n)
	else
		return string.gsub(s, pat, repl)
	end
end

-- local function dumptable(o)
-- 	if type(o) == 'table' then
-- 	   local s = '{ '
-- 	   for k,v in pairs(o) do
-- 		  if type(k) ~= 'number' then k = '"'..k..'"' end
-- 		  s = s .. '['..k..'] = ' .. dumptable(v) .. ','
-- 	   end
-- 	   return s .. '} '
-- 	else
-- 	   return tostring(o)
-- 	end
-- end

local function convert_struct_name(arg)
	return underscorecase_to_camelcase(arg.cname:sub(5, -2))
end

local function convert_type_0(arg)
	if hasPrefix(arg.ctype, "uint64_t") then
		return arg.ctype:gsub("uint64_t", "u64")
	elseif hasPrefix(arg.ctype, "int64_t") then
		return arg.ctype:gsub("int64_t", "i64")
	elseif hasPrefix(arg.ctype, "uint32_t") then
		return arg.ctype:gsub("uint32_t", "u32")
	elseif hasPrefix(arg.ctype, "int32_t") then
		return arg.ctype:gsub("int32_t", "i32")
	elseif hasPrefix(arg.ctype, "uint16_t") then
		return arg.ctype:gsub("uint16_t", "u16")
	elseif hasPrefix(arg.ctype, "uint8_t") then
		return arg.ctype:gsub("uint8_t", "u8")
	elseif hasPrefix(arg.ctype, "uintptr_t") then
		return arg.ctype:gsub("uintptr_t", "uintptr")
	elseif arg.ctype == "va_list" then
		return "c.va_list"
	elseif arg.ctype == "..." then
		return "..any"
	elseif arg.ctype == "const char*" then
		return "cstring"
	elseif arg.ctype == "void*" then
		return "rawptr" -- TODO(lachsinc):
	-- TODO(lachsinc):
	elseif hasPrefix(arg.ctype, "char") then
		return arg.ctype:gsub("char", "u8") 
	-- TODO(lachsinc):
	elseif hasSuffix(arg.fulltype, "Handle") then
		return arg.fulltype
	elseif arg.fulltype == "bx::AllocatorI*"
		or arg.fulltype == "CallbackI*" then
		return "rawptr"
	elseif hasPrefix(arg.ctype, "bgfx_") then
		local result = arg.ctype:sub(6, -1)
		if hasSuffix(result, "_t") then
			result = result:sub(1, -3)
		else
			result = result:gsub("_t[ ]?[*]", "*")
		end
		result = underscorecase_to_camelcase(result)
		return result
	end

	return arg.fulltype
end

local function convert_type(arg)
	local ctype = convert_type_0(arg)

	ctype = ctype:gsub("::Enum", "")
	-- ctype = ctype:gsub("char", "u8")
	ctype = ctype:gsub("float", "f32")
	ctype = ctype:gsub("const void%*", "const rawptr")
	ctype = ctype:gsub("Encoder%*", "^Encoder")

	-- TODO(lachsinc):
	if hasSuffix(ctype, "void*") then
		ctype = ctype:gsub("void%*", "rawptr");
	elseif hasSuffix(ctype, "&") then
		ctype = "^" .. ctype:gsub("&", "")
	elseif hasSuffix(ctype, " &") then
		ctype = "^" .. ctype:gsub("&", "")
	elseif hasSuffix(ctype, "*") then
		ctype = "^" .. ctype:gsub("*", "")
	end

	-- TODO(lachsinc):
	if arg.array ~= nil then
		ctype = convert_array(arg) .. ctype
	end

	ctype = ctype:gsub("const ", "/*const*/") -- TODO(lachsinc):

	return ctype
end

local function convert_return_type(arg)
	local result = convert_type(arg)
	-- Note: This assumes convert_type() has converted void* to rawptr already.
	result = result:gsub("void", "")
	return result
end

local function gen_version()
	return "API_VERSION :: " .. (idl._version or 0)
end

local converter = {}
local yield = coroutine.yield
local gen = {}

local indent = ""

function gen.gen()
	local r = odin_template:gsub("$([a-zA-Z_]+)", function(what)
		local tmp = {}

		local what_idl = what:gsub("funcs_wrapper", "funcs"):gsub("funcs_bindings", "funcs")

		if (what == "version") then
			return gen_version()
		end

		for _, object in ipairs(idl[what_idl]) do
			local co = coroutine.create(converter[what])
			local any
			while true do
				local ok, v = coroutine.resume(co, {
					obj = object,
					funcs = funcs
				})
				assert(ok, debug.traceback(co, v))
				if not v then
					break
				end
				table.insert(tmp, v)
				any = true
			end
			if any and tmp[#tmp] ~= "" then
				table.insert(tmp, "")
			end
		end
		return table.concat(tmp, "\n")
	end)
	return r
end

-- Names of structs that should be translated to a block  eg. StateFlags :: enum <type> {
local combined = { "State", "Stencil", "Buffer", "Texture", "Sampler", "Reset" }
for _, v in ipairs(combined) do
	combined[v] = {}
end

local lastCombinedFlag

local function FlagBlock(typ)
	local format = "0x%08x"
	local enumType = "u32"
	if typ.bits == 64 then
		format = "0x%016x"
		enumType = "u64"
	elseif typ.bits == 16 then
		format = "0x%04x"
		enumType = "u16"
	end

	yield(typ.name .. "Flags :: enum " .. enumType .. " {")

	local flagNames = {}
	local flagNameHighwater = 0
	for idx, flag in ipairs(typ.flag) do
		-- Capitalize
		local flagName = to_underscorecase(flag.name):upper()
		-- make 2d/3d upper case 2D/3D
		flagName = flagName:gsub("%dd", flagName.upper);
		if #(flagName) > flagNameHighwater then
			flagNameHighwater = #(flagName)
		end
		flagNames[idx] = flagName
	end
	for idx, flag in ipairs(typ.flag) do
		local deferredComment = ""
		if flag.comment ~= nil then
			-- TODO(lachsinc): Add spacing upon change of name eg.  WRITE_MASK\nDEPTH_TEST_LESS  ->  WRITE_MASK\n\nDEPTH_TEST_LESS
			-- if idx ~= 1 then
			-- 	yield("")
			-- end

			if #flag.comment == 1 then
				deferredComment = " //!< " .. flag.comment[1];
			else
				for _, comment in ipairs(flag.comment) do
					yield("\t/// " .. comment)
				end
			end
		end
	
		yield("\t" .. flagNames[idx] .. string.rep(" ", flagNameHighwater - #(flagNames[idx])) .. " = " .. 
			string.format(flag.format or format, flag.value) .. "," .. deferredComment)
	end

	-- Add spacing between last flag and shift/mask.
	-- if typ.shift or typ.mask then
	-- 	yield()
	-- end

	-- if typ.shift then
	-- 	yield("\t" .. "Shift" .. string.rep(" ", 22 - #("Shift")) .. " = " .. flag.shift)
	-- end

	-- -- generate Mask
	-- if typ.mask then
	-- 	yield("\t" .. "Mask" .. string.rep(" ", 22 - #("Mask")) .. " = " .. string.format(format, flag.mask))
	-- end

	yield("}")

	if typ.shift ~= nil then
		yield("")
	end
end

local function lastCombinedFlagBlock()
	if lastCombinedFlag then
		local typ = combined[lastCombinedFlag]
		if typ then
			FlagBlock(combined[lastCombinedFlag])
			yield("")
		end
		lastCombinedFlag = nil
	end
end

local function yield_comments(typ)
	if typ.comments ~= nil then
		for _, comment in ipairs(typ.comments) do
			yield("/// " .. comment)
		end
	end
end

local namespace = ""

function converter.types(params)
	local typ = params.obj
	local funcs = params.funcs
	
	if typ.handle then
		lastCombinedFlagBlock()
		yield_comments(typ)
		yield(typ.name .. " :: distinct u16")
	elseif hasSuffix(typ.name, "::Enum") then -- TODO(lachsinc):  elseif typ.enum ~= nil then 
		lastCombinedFlagBlock()

		yield_comments(typ)
		yield(typ.typename .. " :: enum c.int {")

		-- Format names and calc length highwater.
		local enumNames = {}
		local enumNameHighwater = 0
		for idx, enum in ipairs(typ.enum) do
			-- Capitalize
			local enumName = to_underscorecase(enum.name):upper()
			-- make 2d/3d upper case 2D/3D
			enumName = enumName:gsub("%dd", enumName.upper);
			if #(enumName) > enumNameHighwater then
				enumNameHighwater = #(enumName)
			end
			enumNames[idx] = enumName
		end
		for idx, enum in ipairs(typ.enum) do
			local deferredComment = ""
			if enum.comment ~= nil then
				if #enum.comment == 1 then
					deferredComment = string.rep(" ", enumNameHighwater - #(enumNames[idx])) .. " //!< " .. enum.comment[1];
				else
					for _, comment in ipairs(enum.comment) do
						yield("\t/// " .. comment)
					end
				end
			end
			yield("\t" .. enumNames[idx] .. "," .. deferredComment)
		end
		yield("\tCOUNT")
		yield("}")

		enum["[" .. typ.typename .. "::Count]"] = #typ.enum

	elseif typ.bits ~= nil then
		local prefix, name = typ.name:match("(%u%l+)(.*)")
		if prefix ~= lastCombinedFlag then
			lastCombinedFlagBlock()
			lastCombinedFlag = prefix
		end
		yield_comments(typ) -- TODO(lachsinc): Block?
		local combinedFlag = combined[prefix]
		if combinedFlag then
			combinedFlag.bits = typ.bits
			combinedFlag.name = prefix
			local flags = combinedFlag.flag or {}
			combinedFlag.flag = flags
			local lookup = combinedFlag.lookup or {}
			combinedFlag.lookup = lookup
			for _, flag in ipairs(typ.flag) do
				local flagName = name .. flag.name:gsub("_", "")
				local value = flag.value
				if value == nil then
					-- It's a combined flag
					value = 0
					for _, v in ipairs(flag) do
						value = value | assert(lookup[name .. v], v .. " is not defined for " .. flagName)
					end
				end
				lookup[flagName] = value
				table.insert(flags, {
					name = flagName,
					value = value,
					comment = flag.comment
				})
			end

			if typ.shift then
				table.insert(flags, {
					name = name .. "Shift",
					value = typ.shift,
					format = "%d",
					comment = typ.comment
				})
			end

			if typ.mask then
				-- generate Mask
				table.insert(flags, {
					name = name .. "Mask",
					value = typ.mask,
					comment = typ.comment
				})
				lookup[name .. "Mask"] = typ.mask
			end
		else
			FlagBlock(typ)
		end
	elseif typ.struct ~= nil then
		local closeBrace = true
		
		yield_comments(typ)

		if typ.name == "Encoder" then
			yield("Encoder :: struct { /*opaque*/ }") -- TODO(lachsinc):
			closeBrace = false
		else
			yield(convert_struct_name(typ) .. " :: struct {") -- TODO(lachsinc):
		end

		local memberNames = {}
		local memberTypes = {}
		local memberNameHighwater = 0
		local memberTypeHighwater = 0
		for idx, member in ipairs(typ.struct) do
			local memberName = member.name
			if memberName == "context" then
				memberName = "context_"
			end			
			memberNames[idx] = memberName
			if #memberName > memberNameHighwater then
				memberNameHighwater = #memberName
			end

			local memberType = convert_type(member)

			-- -- TODO(lachsinc): Gross, should just construct namespace lookup eg. "Limits" -> { .namespace = "Init", .namespace = "Caps" }
			-- if hasPrefix(member.fulltype, "Limits") or hasPrefix(member.fulltype, "GPU") then
			-- 	print(dumptable(member))
			-- 	memberType = typ.name .. memberType
			-- end

			memberTypes[idx] = memberType
			if #memberType > memberTypeHighwater then
				memberTypeHighwater = #memberType
			end
		end
		for idx, member in ipairs(typ.struct) do
			local memberComment = ""
			if #(member.comment) == 1 then
				memberComment = string.rep(" ", memberTypeHighwater - #memberTypes[idx]) .. " //<! " .. member.comment[1]
			end
			yield("\t" .. memberNames[idx] .. ": " .. string.rep(" ", memberNameHighwater - #memberNames[idx]) .. memberTypes[idx] .. "," .. memberComment)
		end

		-- if funcs ~= nil then
		-- 	for _, func in ipairs(funcs) do
		-- 		converter.funcs({
		-- 			obj = func,
		-- 			asMethod = true
		-- 		})
		-- 	end
		-- end

		if closeBrace then
			yield("}")
		end
	elseif typ.name == "ReleaseFn" then -- TODO(lachsinc): What field indicates typedef/funcpt
		local args = {}
		if typ.this ~= nil then
			local ptr = "^" -- TODO(lachsinc):
			if typ.const ~= nil then
				ptr = "/*const*/" .. ptr -- TODO(lachsinc):
			end
			args[1] = "_this: " .. ptr .. typ.this_type.type
		end
		for _, arg in ipairs(typ.args) do
			local argName = arg.name
			if not isempty(argName) then
				table.insert(args, argName .. ": " .. convert_type(arg))
			else
				table.insert(args, convert_type(arg))
			end
		end

		yield("ReleaseFn :: #type proc \"c\" (" .. table.concat(args, ", ") .. ")")
	else
		yield("// TODO(lachsinc): " .. typ.name)
	end
end

function converter.funcs_wrapper(params)
	local func = params.obj

	if func.cpponly then
		return
	end

	-- TODO(lachsinc): Odin can handle these I'm pretty sure.
	if func.cname == "dbg_text_printf" or func.cname == "dbg_text_vprintf" then
		return
	end

	-- TODO(lachsinc): Cleanup
	if func.comments ~= nil then
		for _, line in ipairs(func.comments) do
			yield("/// " .. line)
		end

		local first = true
		for _, arg in ipairs(func.args) do
			if arg.comment ~= nil then

				if first then
					if #func.comments > 0 then
						yield("///")
					end
					first = false
				end

				local inout
				if arg.out then
					inout = "out"
				elseif arg.inout then
					inout = "inout"
				else
					inout = "in"
				end

				yield(string.format("/// @param[%s] %s %s", inout, arg.name, arg.comment[1]))
				for i, comment in ipairs(arg.comment) do
					if (i > 1) then
						yield("///    " .. comment)
					end
				end
			end
		end
	end

	-- TODO(lachsinc): Make this a local function?
	local args = {}
	local argNames = {}

	if func.this ~= nil then
		local ptr = "^" -- TODO(lachsinc):
		if func.const ~= nil then
			ptr = "/*const*/" .. ptr -- TODO(lachsinc):
		end
		args[1] = "_this: " .. ptr .. func.this_type.type
		argNames[1] = "_this"
	end
	for _, arg in ipairs(func.args) do
		local argName = arg.name
		-- Odin requires argument name? I think? TODO(lachsinc):
		if isempty(argName) then
			argName = "arg" .. idx
		end
		local prefix = ""
		if arg.ctype == "..." then
			prefix = "#c_vararg "
		end	
		table.insert(argNames, argName)
		table.insert(args, prefix .. argName .. ": " .. convert_type(arg))
	end

	local returnPart = convert_return_type(func.ret)
	if #returnPart > 0 then
		returnPart = " -> " .. returnPart
	end
	-- TODO(lachsinc): Contextless?
	yield(func.cname .. " :: #force_inline proc(" .. table.concat(args, ", ") .. ")" .. returnPart .. " {")
	if #returnPart > 0 then
		yield("\t" .. "return bgfx_" .. func.cname .. "(" .. table.concat(argNames, ", ") .. ")")
	else
		yield("\t" .. "bgfx_" .. func.cname .. "(" .. table.concat(argNames, ", ") .. ")")
	end
	yield("}")
end

function converter.funcs_bindings(params)
	local func = params.obj

	if func.cpponly then
		return
	end

	local func_indent = "\t"
	if wrapper then
		func_indent = ""
	end	

	local args = {}
	local argNames = {}
	
	if func.this ~= nil then
		local ptr = "^"
		if func.const ~= nil then
			ptr = "/*const*/" .. ptr
		end
		args[1] = "_this: " .. ptr .. func.this_type.type
		argNames[1] = "_this"
	end
	for idx, arg in ipairs(func.args) do
		local argName = arg.name
		-- Odin requires argument name? I think? TODO(lachsinc):
		if isempty(argName) then
			argName = "arg" .. idx
		end
		local prefix = ""
		if arg.ctype == "..." then
			prefix = "#c_vararg "
		end	
		table.insert(argNames, argName)
		table.insert(args, prefix .. argName .. ": " .. convert_type(arg))
	end

	local returnPart = convert_return_type(func.ret)
	if #returnPart > 0 then
		returnPart = " -> " .. returnPart
	end
	yield(func_indent .. "bgfx_" .. func.cname .. " :: proc(" .. table.concat(args, ", ") .. ")" .. returnPart .. " ---")
end

function gen.write(codes, outputfile)
	local out = assert(io.open(outputfile, "wb"))
	out:write(codes)
	out:close()
	print("Generating: " .. outputfile)
end

if (...) == nil then
	-- run `lua bindings-odin.lua` in command line
	print(gen.gen())
end

return gen
