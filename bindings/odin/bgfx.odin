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

API_VERSION :: 129

ViewId :: distinct u16

INVALID_HANDLE :: bits.U16_MAX

// TODO(lachsinc): bool

// TODO(lachsinc): char

// TODO(lachsinc): float

// TODO(lachsinc): int8_t

// TODO(lachsinc): int32_t

// TODO(lachsinc): int64_t

// TODO(lachsinc): uint8_t

// TODO(lachsinc): uint16_t

// TODO(lachsinc): uint32_t

// TODO(lachsinc): uint64_t

// TODO(lachsinc): uintptr_t

// TODO(lachsinc): va_list

// TODO(lachsinc): void

// TODO(lachsinc): ViewId

// TODO(lachsinc): CallbackI

// TODO(lachsinc): bx::AllocatorI

ReleaseFn :: #type proc "c" (_ptr: rawptr, _userData: rawptr)

/// Color RGB/alpha/depth write. When it's not specified write will be disabled.

/// Depth test state. When `BGFX_STATE_DEPTH_` is not specified depth test will be disabled.

/// Use BGFX_STATE_BLEND_FUNC(_src, _dst) or BGFX_STATE_BLEND_FUNC_SEPARATE(_srcRGB, _dstRGB, _srcA, _dstA)
/// helper macros.

/// Use BGFX_STATE_BLEND_EQUATION(_equation) or BGFX_STATE_BLEND_EQUATION_SEPARATE(_equationRGB, _equationA)
/// helper macros.

/// Cull state. When `BGFX_STATE_CULL_*` is not specified culling will be disabled.

/// Alpha reference value.

/// Point size value.

/// Enable MSAA write when writing into MSAA frame buffer.
/// This flag is ignored when not writing into MSAA frame buffer.

/// Do not use!

StateFlags :: enum u64 {
	WRITE_R                 = 0x0000000000000001, //!< Enable R write.
	WRITE_G                 = 0x0000000000000002, //!< Enable G write.
	WRITE_B                 = 0x0000000000000004, //!< Enable B write.
	WRITE_A                 = 0x0000000000000008, //!< Enable alpha write.
	WRITE_Z                 = 0x0000004000000000, //!< Enable depth write.
	WRITE_RGB               = 0x0000000000000007, //!< Enable RGB write.
	WRITE_MASK              = 0x000000400000000f, //!< Write all channels mask.
	DEPTH_TEST_LESS         = 0x0000000000000010, //!< Enable depth test, less.
	DEPTH_TEST_LEQUAL       = 0x0000000000000020, //!< Enable depth test, less or equal.
	DEPTH_TEST_EQUAL        = 0x0000000000000030, //!< Enable depth test, equal.
	DEPTH_TEST_GEQUAL       = 0x0000000000000040, //!< Enable depth test, greater or equal.
	DEPTH_TEST_GREATER      = 0x0000000000000050, //!< Enable depth test, greater.
	DEPTH_TEST_NOTEQUAL     = 0x0000000000000060, //!< Enable depth test, not equal.
	DEPTH_TEST_NEVER        = 0x0000000000000070, //!< Enable depth test, never.
	DEPTH_TEST_ALWAYS       = 0x0000000000000080, //!< Enable depth test, always.
	DEPTH_TEST_SHIFT        = 4,
	DEPTH_TEST_MASK         = 0x00000000000000f0,
	BLEND_ZERO              = 0x0000000000001000, //!< 0, 0, 0, 0
	BLEND_ONE               = 0x0000000000002000, //!< 1, 1, 1, 1
	BLEND_SRC_COLOR         = 0x0000000000003000, //!< Rs, Gs, Bs, As
	BLEND_INV_SRC_COLOR     = 0x0000000000004000, //!< 1-Rs, 1-Gs, 1-Bs, 1-As
	BLEND_SRC_ALPHA         = 0x0000000000005000, //!< As, As, As, As
	BLEND_INV_SRC_ALPHA     = 0x0000000000006000, //!< 1-As, 1-As, 1-As, 1-As
	BLEND_DST_ALPHA         = 0x0000000000007000, //!< Ad, Ad, Ad, Ad
	BLEND_INV_DST_ALPHA     = 0x0000000000008000, //!< 1-Ad, 1-Ad, 1-Ad ,1-Ad
	BLEND_DST_COLOR         = 0x0000000000009000, //!< Rd, Gd, Bd, Ad
	BLEND_INV_DST_COLOR     = 0x000000000000a000, //!< 1-Rd, 1-Gd, 1-Bd, 1-Ad
	BLEND_SRC_ALPHA_SAT     = 0x000000000000b000, //!< f, f, f, 1; f = min(As, 1-Ad)
	BLEND_FACTOR            = 0x000000000000c000, //!< Blend factor
	BLEND_INV_FACTOR        = 0x000000000000d000, //!< 1-Blend factor
	BLEND_SHIFT             = 12,
	BLEND_MASK              = 0x000000000ffff000,
	BLEND_EQUATION_ADD      = 0x0000000000000000, //!< Blend add: src + dst.
	BLEND_EQUATION_SUB      = 0x0000000010000000, //!< Blend subtract: src - dst.
	BLEND_EQUATION_REVSUB   = 0x0000000020000000, //!< Blend reverse subtract: dst - src.
	BLEND_EQUATION_MIN      = 0x0000000030000000, //!< Blend min: min(src, dst).
	BLEND_EQUATION_MAX      = 0x0000000040000000, //!< Blend max: max(src, dst).
	BLEND_EQUATION_SHIFT    = 28,
	BLEND_EQUATION_MASK     = 0x00000003f0000000,
	CULL_CW                 = 0x0000001000000000, //!< Cull clockwise triangles.
	CULL_CCW                = 0x0000002000000000, //!< Cull counter-clockwise triangles.
	CULL_SHIFT              = 36,
	CULL_MASK               = 0x0000003000000000,
	ALPHA_REF_SHIFT         = 40,
	ALPHA_REF_MASK          = 0x0000ff0000000000,
	PT_TRISTRIP             = 0x0001000000000000, //!< Tristrip.
	PT_LINES                = 0x0002000000000000, //!< Lines.
	PT_LINESTRIP            = 0x0003000000000000, //!< Line strip.
	PT_POINTS               = 0x0004000000000000, //!< Points.
	PT_SHIFT                = 48,
	PT_MASK                 = 0x0007000000000000,
	POINT_SIZE_SHIFT        = 52,
	POINT_SIZE_MASK         = 0x00f0000000000000,
	MSAA                    = 0x0100000000000000, //!< Enable MSAA rasterization.
	LINEAA                  = 0x0200000000000000, //!< Enable line AA rasterization.
	CONSERVATIVE_RASTER     = 0x0400000000000000, //!< Enable conservative rasterization.
	NONE                    = 0x0000000000000000, //!< No state.
	FRONT_CCW               = 0x0000008000000000, //!< Front counter-clockwise (default is clockwise).
	BLEND_INDEPENDENT       = 0x0000000400000000, //!< Enable blend independent.
	BLEND_ALPHA_TO_COVERAGE = 0x0000000800000000, //!< Enable alpha to coverage.
	/// Default state is write to RGB, alpha, and depth with depth test less enabled, with clockwise
	/// culling and MSAA (when writing into MSAA frame buffer, otherwise this flag is ignored).
	DEFAULT                 = 0x010000500000001f,
	MASK                    = 0xffffffffffffffff,
	RESERVED_SHIFT          = 61,
	RESERVED_MASK           = 0xe000000000000000,
}

/// Set stencil ref value.

/// Set stencil rmask value.

StencilFlags :: enum u32 {
	FUNC_REF_SHIFT    = 0,
	FUNC_REF_MASK     = 0x000000ff,
	FUNC_RMASK_SHIFT  = 8,
	FUNC_RMASK_MASK   = 0x0000ff00,
	NONE              = 0x00000000,
	MASK              = 0xffffffff,
	DEFAULT           = 0x00000000,
	TEST_LESS         = 0x00010000, //!< Enable stencil test, less.
	TEST_LEQUAL       = 0x00020000, //!< Enable stencil test, less or equal.
	TEST_EQUAL        = 0x00030000, //!< Enable stencil test, equal.
	TEST_GEQUAL       = 0x00040000, //!< Enable stencil test, greater or equal.
	TEST_GREATER      = 0x00050000, //!< Enable stencil test, greater.
	TEST_NOTEQUAL     = 0x00060000, //!< Enable stencil test, not equal.
	TEST_NEVER        = 0x00070000, //!< Enable stencil test, never.
	TEST_ALWAYS       = 0x00080000, //!< Enable stencil test, always.
	TEST_SHIFT        = 16,
	TEST_MASK         = 0x000f0000,
	OP_FAIL_S_ZERO    = 0x00000000, //!< Zero.
	OP_FAIL_S_KEEP    = 0x00100000, //!< Keep.
	OP_FAIL_S_REPLACE = 0x00200000, //!< Replace.
	OP_FAIL_S_INCR    = 0x00300000, //!< Increment and wrap.
	OP_FAIL_S_INCRSAT = 0x00400000, //!< Increment and clamp.
	OP_FAIL_S_DECR    = 0x00500000, //!< Decrement and wrap.
	OP_FAIL_S_DECRSAT = 0x00600000, //!< Decrement and clamp.
	OP_FAIL_S_INVERT  = 0x00700000, //!< Invert.
	OP_FAIL_S_SHIFT   = 20,
	OP_FAIL_S_MASK    = 0x00f00000,
	OP_FAIL_Z_ZERO    = 0x00000000, //!< Zero.
	OP_FAIL_Z_KEEP    = 0x01000000, //!< Keep.
	OP_FAIL_Z_REPLACE = 0x02000000, //!< Replace.
	OP_FAIL_Z_INCR    = 0x03000000, //!< Increment and wrap.
	OP_FAIL_Z_INCRSAT = 0x04000000, //!< Increment and clamp.
	OP_FAIL_Z_DECR    = 0x05000000, //!< Decrement and wrap.
	OP_FAIL_Z_DECRSAT = 0x06000000, //!< Decrement and clamp.
	OP_FAIL_Z_INVERT  = 0x07000000, //!< Invert.
	OP_FAIL_Z_SHIFT   = 24,
	OP_FAIL_Z_MASK    = 0x0f000000,
	OP_PASS_Z_ZERO    = 0x00000000, //!< Zero.
	OP_PASS_Z_KEEP    = 0x10000000, //!< Keep.
	OP_PASS_Z_REPLACE = 0x20000000, //!< Replace.
	OP_PASS_Z_INCR    = 0x30000000, //!< Increment and wrap.
	OP_PASS_Z_INCRSAT = 0x40000000, //!< Increment and clamp.
	OP_PASS_Z_DECR    = 0x50000000, //!< Decrement and wrap.
	OP_PASS_Z_DECRSAT = 0x60000000, //!< Decrement and clamp.
	OP_PASS_Z_INVERT  = 0x70000000, //!< Invert.
	OP_PASS_Z_SHIFT   = 28,
	OP_PASS_Z_MASK    = 0xf0000000,
}

ClearFlags :: enum u16 {
	NONE               = 0x0000, //!< No clear flags.
	COLOR              = 0x0001, //!< Clear color.
	DEPTH              = 0x0002, //!< Clear depth.
	STENCIL            = 0x0004, //!< Clear stencil.
	DISCARD_COLOR_0    = 0x0008, //!< Discard frame buffer attachment 0.
	DISCARD_COLOR_1    = 0x0010, //!< Discard frame buffer attachment 1.
	DISCARD_COLOR_2    = 0x0020, //!< Discard frame buffer attachment 2.
	DISCARD_COLOR_3    = 0x0040, //!< Discard frame buffer attachment 3.
	DISCARD_COLOR_4    = 0x0080, //!< Discard frame buffer attachment 4.
	DISCARD_COLOR_5    = 0x0100, //!< Discard frame buffer attachment 5.
	DISCARD_COLOR_6    = 0x0200, //!< Discard frame buffer attachment 6.
	DISCARD_COLOR_7    = 0x0400, //!< Discard frame buffer attachment 7.
	DISCARD_DEPTH      = 0x0800, //!< Discard frame buffer depth attachment.
	DISCARD_STENCIL    = 0x1000, //!< Discard frame buffer stencil attachment.
	DISCARD_COLOR_MASK = 0x07f8,
	DISCARD_MASK       = 0x1ff8,
}

/// Rendering state discard. When state is preserved in submit, rendering states can be discarded
/// on a finer grain.
DiscardFlags :: enum u32 {
	NONE           = 0x00000000, //!< Preserve everything.
	BINDINGS       = 0x00000001, //!< Discard texture sampler and buffer bindings.
	INDEX_BUFFER   = 0x00000002, //!< Discard index buffer.
	INSTANCE_DATA  = 0x00000004, //!< Discard instance data.
	STATE          = 0x00000008, //!< Discard state and uniform bindings.
	TRANSFORM      = 0x00000010, //!< Discard transform.
	VERTEX_STREAMS = 0x00000020, //!< Discard vertex streams.
	ALL            = 0x000000ff, //!< Discard all states.
}

DebugFlags :: enum u32 {
	NONE      = 0x00000000, //!< No debug.
	WIREFRAME = 0x00000001, //!< Enable wireframe for all primitives.
	/// Enable infinitely fast hardware test. No draw calls will be submitted to driver.
	/// It's useful when profiling to quickly assess bottleneck between CPU and GPU.
	IFH       = 0x00000002,
	STATS     = 0x00000004, //!< Enable statistics display.
	TEXT      = 0x00000008, //!< Enable debug text display.
	PROFILER  = 0x00000010, //!< Enable profiler. This causes per-view statistics to be collected, available through `bgfx::Stats::ViewStats`. This is unrelated to the profiler functions in `bgfx::CallbackI`.
}

BufferFlags :: enum u16 {
	COMPUTE_FORMAT8X1    = 0x0001, //!< 1 8-bit value
	COMPUTE_FORMAT8X2    = 0x0002, //!< 2 8-bit values
	COMPUTE_FORMAT8X4    = 0x0003, //!< 4 8-bit values
	COMPUTE_FORMAT16X1   = 0x0004, //!< 1 16-bit value
	COMPUTE_FORMAT16X2   = 0x0005, //!< 2 16-bit values
	COMPUTE_FORMAT16X4   = 0x0006, //!< 4 16-bit values
	COMPUTE_FORMAT32X1   = 0x0007, //!< 1 32-bit value
	COMPUTE_FORMAT32X2   = 0x0008, //!< 2 32-bit values
	COMPUTE_FORMAT32X4   = 0x0009, //!< 4 32-bit values
	COMPUTE_FORMAT_SHIFT = 0,
	COMPUTE_FORMAT_MASK  = 0x000f,
	COMPUTE_TYPE_INT     = 0x0010, //!< Type `int`.
	COMPUTE_TYPE_UINT    = 0x0020, //!< Type `uint`.
	COMPUTE_TYPE_FLOAT   = 0x0030, //!< Type `float`.
	COMPUTE_TYPE_SHIFT   = 4,
	COMPUTE_TYPE_MASK    = 0x0030,
	NONE                 = 0x0000,
	COMPUTE_READ         = 0x0100, //!< Buffer will be read by shader.
	COMPUTE_WRITE        = 0x0200, //!< Buffer will be used for writing.
	DRAW_INDIRECT        = 0x0400, //!< Buffer will be used for storing draw indirect commands.
	ALLOW_RESIZE         = 0x0800, //!< Allow dynamic index/vertex buffer resize during update.
	INDEX32              = 0x1000, //!< Index buffer contains 32-bit indices.
	COMPUTE_READ_WRITE   = 0x0300,
}

TextureFlags :: enum u64 {
	NONE          = 0x0000000000000000,
	MSAA_SAMPLE   = 0x0000000800000000, //!< Texture will be used for MSAA sampling.
	RT            = 0x0000001000000000, //!< Render target no MSAA.
	COMPUTE_WRITE = 0x0000100000000000, //!< Texture will be used for compute write.
	SRGB          = 0x0000200000000000, //!< Sample texture as sRGB.
	BLIT_DST      = 0x0000400000000000, //!< Texture will be used as blit destination.
	READ_BACK     = 0x0000800000000000, //!< Texture will be used for read back from GPU.
	RT_MSAA_X2    = 0x0000002000000000, //!< Render target MSAAx2 mode.
	RT_MSAA_X4    = 0x0000003000000000, //!< Render target MSAAx4 mode.
	RT_MSAA_X8    = 0x0000004000000000, //!< Render target MSAAx8 mode.
	RT_MSAA_X16   = 0x0000005000000000, //!< Render target MSAAx16 mode.
	RT_MSAA_SHIFT = 36,
	RT_MSAA_MASK  = 0x0000007000000000,
	RT_WRITE_ONLY = 0x0000008000000000, //!< Render target will be used for writing
	RT_SHIFT      = 36,
	RT_MASK       = 0x000000f000000000,
}

/// Sampler flags.

SamplerFlags :: enum u32 {
	U_MIRROR           = 0x00000001, //!< Wrap U mode: Mirror
	U_CLAMP            = 0x00000002, //!< Wrap U mode: Clamp
	U_BORDER           = 0x00000003, //!< Wrap U mode: Border
	U_SHIFT            = 0,
	U_MASK             = 0x00000003,
	V_MIRROR           = 0x00000004, //!< Wrap V mode: Mirror
	V_CLAMP            = 0x00000008, //!< Wrap V mode: Clamp
	V_BORDER           = 0x0000000c, //!< Wrap V mode: Border
	V_SHIFT            = 2,
	V_MASK             = 0x0000000c,
	W_MIRROR           = 0x00000010, //!< Wrap W mode: Mirror
	W_CLAMP            = 0x00000020, //!< Wrap W mode: Clamp
	W_BORDER           = 0x00000030, //!< Wrap W mode: Border
	W_SHIFT            = 4,
	W_MASK             = 0x00000030,
	MIN_POINT          = 0x00000040, //!< Min sampling mode: Point
	MIN_ANISOTROPIC    = 0x00000080, //!< Min sampling mode: Anisotropic
	MIN_SHIFT          = 6,
	MIN_MASK           = 0x000000c0,
	MAG_POINT          = 0x00000100, //!< Mag sampling mode: Point
	MAG_ANISOTROPIC    = 0x00000200, //!< Mag sampling mode: Anisotropic
	MAG_SHIFT          = 8,
	MAG_MASK           = 0x00000300,
	MIP_POINT          = 0x00000400, //!< Mip sampling mode: Point
	MIP_SHIFT          = 10,
	MIP_MASK           = 0x00000400,
	COMPARE_LESS       = 0x00010000, //!< Compare when sampling depth texture: less.
	COMPARE_LEQUAL     = 0x00020000, //!< Compare when sampling depth texture: less or equal.
	COMPARE_EQUAL      = 0x00030000, //!< Compare when sampling depth texture: equal.
	COMPARE_GEQUAL     = 0x00040000, //!< Compare when sampling depth texture: greater or equal.
	COMPARE_GREATER    = 0x00050000, //!< Compare when sampling depth texture: greater.
	COMPARE_NOTEQUAL   = 0x00060000, //!< Compare when sampling depth texture: not equal.
	COMPARE_NEVER      = 0x00070000, //!< Compare when sampling depth texture: never.
	COMPARE_ALWAYS     = 0x00080000, //!< Compare when sampling depth texture: always.
	COMPARE_SHIFT      = 16,
	COMPARE_MASK       = 0x000f0000,
	BORDER_COLOR_SHIFT = 24,
	BORDER_COLOR_MASK  = 0x0f000000,
	RESERVED_SHIFT     = 28,
	RESERVED_MASK      = 0xf0000000,
	NONE               = 0x00000000,
	SAMPLE_STENCIL     = 0x00100000, //!< Sample stencil instead of depth.
	POINT              = 0x00000540,
	UVW_MIRROR         = 0x00000015,
	UVW_CLAMP          = 0x0000002a,
	UVW_BORDER         = 0x0000003f,
	BITS_MASK          = 0x000f07ff,
}

ResetFlags :: enum u32 {
	MSAA_X2                = 0x00000010, //!< Enable 2x MSAA.
	MSAA_X4                = 0x00000020, //!< Enable 4x MSAA.
	MSAA_X8                = 0x00000030, //!< Enable 8x MSAA.
	MSAA_X16               = 0x00000040, //!< Enable 16x MSAA.
	MSAA_SHIFT             = 4,
	MSAA_MASK              = 0x00000070,
	NONE                   = 0x00000000, //!< No reset flags.
	FULLSCREEN             = 0x00000001, //!< Not supported yet.
	VSYNC                  = 0x00000080, //!< Enable V-Sync.
	MAXANISOTROPY          = 0x00000100, //!< Turn on/off max anisotropy.
	CAPTURE                = 0x00000200, //!< Begin screen capture.
	FLUSH_AFTER_RENDER     = 0x00002000, //!< Flush rendering after submitting to GPU.
	/// This flag specifies where flip occurs. Default behaviour is that flip occurs
	/// before rendering new frame. This flag only has effect when `BGFX_CONFIG_MULTITHREADED=0`.
	FLIP_AFTER_RENDER      = 0x00004000,
	SRGB_BACKBUFFER        = 0x00008000, //!< Enable sRGB backbuffer.
	HDR10                  = 0x00010000, //!< Enable HDR10 rendering.
	HIDPI                  = 0x00020000, //!< Enable HiDPI rendering.
	DEPTH_CLAMP            = 0x00040000, //!< Enable depth clamp.
	SUSPEND                = 0x00080000, //!< Suspend rendering.
	TRANSPARENT_BACKBUFFER = 0x00100000, //!< Transparent backbuffer. Availability depends on: `BGFX_CAPS_TRANSPARENT_BACKBUFFER`.
	FULLSCREEN_SHIFT       = 0,
	FULLSCREEN_MASK        = 0x00000001,
	RESERVED_SHIFT         = 31,
	RESERVED_MASK          = 0x80000000,
}

CapsFlags :: enum u64 {
	ALPHA_TO_COVERAGE        = 0x0000000000000001, //!< Alpha to coverage is supported.
	BLEND_INDEPENDENT        = 0x0000000000000002, //!< Blend independent is supported.
	COMPUTE                  = 0x0000000000000004, //!< Compute shaders are supported.
	CONSERVATIVE_RASTER      = 0x0000000000000008, //!< Conservative rasterization is supported.
	DRAW_INDIRECT            = 0x0000000000000010, //!< Draw indirect is supported.
	DRAW_INDIRECT_COUNT      = 0x0000000000000020, //!< Draw indirect with indirect count is supported.
	FRAGMENT_DEPTH           = 0x0000000000000040, //!< Fragment depth is available in fragment shader.
	FRAGMENT_ORDERING        = 0x0000000000000080, //!< Fragment ordering is available in fragment shader.
	GRAPHICS_DEBUGGER        = 0x0000000000000100, //!< Graphics debugger is present.
	HDR10                    = 0x0000000000000200, //!< HDR10 rendering is supported.
	HIDPI                    = 0x0000000000000400, //!< HiDPI rendering is supported.
	IMAGE_RW                 = 0x0000000000000800, //!< Image Read/Write is supported.
	INDEX32                  = 0x0000000000001000, //!< 32-bit indices are supported.
	INSTANCING               = 0x0000000000002000, //!< Instancing is supported.
	OCCLUSION_QUERY          = 0x0000000000004000, //!< Occlusion query is supported.
	PRIMITIVE_ID             = 0x0000000000008000, //!< PrimitiveID is available in fragment shader.
	RENDERER_MULTITHREADED   = 0x0000000000010000, //!< Renderer is on separate thread.
	SWAP_CHAIN               = 0x0000000000020000, //!< Multiple windows are supported.
	TEXTURE_BLIT             = 0x0000000000040000, //!< Texture blit is supported.
	TEXTURE_COMPARE_LEQUAL   = 0x0000000000080000, //!< Texture compare less equal mode is supported.
	TEXTURE_COMPARE_RESERVED = 0x0000000000100000,
	TEXTURE_CUBE_ARRAY       = 0x0000000000200000, //!< Cubemap texture array is supported.
	TEXTURE_DIRECT_ACCESS    = 0x0000000000400000, //!< CPU direct access to GPU texture memory.
	TEXTURE_READ_BACK        = 0x0000000000800000, //!< Read-back texture is supported.
	TEXTURE_2D_ARRAY         = 0x0000000001000000, //!< 2D texture array is supported.
	TEXTURE_3D               = 0x0000000002000000, //!< 3D textures are supported.
	TRANSPARENT_BACKBUFFER   = 0x0000000004000000, //!< Transparent back buffer supported.
	VERTEX_ATTRIB_HALF       = 0x0000000008000000, //!< Vertex attribute half-float is supported.
	VERTEX_ATTRIB_UINT10     = 0x0000000010000000, //!< Vertex attribute 10_10_10_2 is supported.
	VERTEX_ID                = 0x0000000020000000, //!< Rendering with VertexID only is supported.
	VIEWPORT_LAYER_ARRAY     = 0x0000000040000000, //!< Viewport layer is available in vertex shader.
	TEXTURE_COMPARE_ALL      = 0x0000000000180000, //!< All texture compare modes are supported.
}

CapsFormatFlags :: enum u32 {
	TEXTURE_NONE             = 0x00000000, //!< Texture format is not supported.
	TEXTURE_2D               = 0x00000001, //!< Texture format is supported.
	TEXTURE_2D_SRGB          = 0x00000002, //!< Texture as sRGB format is supported.
	TEXTURE_2D_EMULATED      = 0x00000004, //!< Texture format is emulated.
	TEXTURE_3D               = 0x00000008, //!< Texture format is supported.
	TEXTURE_3D_SRGB          = 0x00000010, //!< Texture as sRGB format is supported.
	TEXTURE_3D_EMULATED      = 0x00000020, //!< Texture format is emulated.
	TEXTURE_CUBE             = 0x00000040, //!< Texture format is supported.
	TEXTURE_CUBE_SRGB        = 0x00000080, //!< Texture as sRGB format is supported.
	TEXTURE_CUBE_EMULATED    = 0x00000100, //!< Texture format is emulated.
	TEXTURE_VERTEX           = 0x00000200, //!< Texture format can be used from vertex shader.
	TEXTURE_IMAGE_READ       = 0x00000400, //!< Texture format can be used as image and read from.
	TEXTURE_IMAGE_WRITE      = 0x00000800, //!< Texture format can be used as image and written to.
	TEXTURE_FRAMEBUFFER      = 0x00001000, //!< Texture format can be used as frame buffer.
	TEXTURE_FRAMEBUFFER_MSAA = 0x00002000, //!< Texture format can be used as MSAA frame buffer.
	TEXTURE_MSAA             = 0x00004000, //!< Texture can be sampled as MSAA.
	TEXTURE_MIP_AUTOGEN      = 0x00008000, //!< Texture format supports auto-generated mips.
}

ResolveFlags :: enum u32 {
	NONE          = 0x00000000, //!< No resolve flags.
	AUTO_GEN_MIPS = 0x00000001, //!< Auto-generate mip maps on resolve.
}

PciIdFlags :: enum u16 {
	NONE                = 0x0000, //!< Autoselect adapter.
	SOFTWARE_RASTERIZER = 0x0001, //!< Software rasterizer.
	AMD                 = 0x1002, //!< AMD adapter.
	APPLE               = 0x106b, //!< Apple adapter.
	INTEL               = 0x8086, //!< Intel adapter.
	NVIDIA              = 0x10de, //!< nVidia adapter.
	MICROSOFT           = 0x1414, //!< Microsoft adapter.
	ARM                 = 0x13b5, //!< ARM adapter.
}

CubeMapFlags :: enum u32 {
	POSITIVE_X = 0x00000000, //!< Cubemap +x.
	NEGATIVE_X = 0x00000001, //!< Cubemap -x.
	POSITIVE_Y = 0x00000002, //!< Cubemap +y.
	NEGATIVE_Y = 0x00000003, //!< Cubemap -y.
	POSITIVE_Z = 0x00000004, //!< Cubemap +z.
	NEGATIVE_Z = 0x00000005, //!< Cubemap -z.
}

/// Fatal error enum.
Fatal :: enum c.int {
	DEBUG_CHECK,
	INVALID_SHADER,
	UNABLE_TO_INITIALIZE,
	UNABLE_TO_CREATE_TEXTURE,
	DEVICE_LOST,
	COUNT
}

/// Renderer backend type enum.
RendererType :: enum c.int {
	NOOP,         //!< No rendering.
	AGC,          //!< AGC
	DIRECT3_D11,  //!< Direct3D 11.0
	DIRECT3_D12,  //!< Direct3D 12.0
	GNM,          //!< GNM
	METAL,        //!< Metal
	NVN,          //!< NVN
	OPEN_G_L_E_S, //!< OpenGL ES 2.0+
	OPEN_G_L,     //!< OpenGL 2.1+
	VULKAN,       //!< Vulkan
	COUNT
}

/// Access mode enum.
Access :: enum c.int {
	READ,       //!< Read.
	WRITE,      //!< Write.
	READ_WRITE, //!< Read and write.
	COUNT
}

/// Vertex attribute enum.
Attrib :: enum c.int {
	POSITION,   //!< a_position
	NORMAL,     //!< a_normal
	TANGENT,    //!< a_tangent
	BITANGENT,  //!< a_bitangent
	COLOR0,     //!< a_color0
	COLOR1,     //!< a_color1
	COLOR2,     //!< a_color2
	COLOR3,     //!< a_color3
	INDICES,    //!< a_indices
	WEIGHT,     //!< a_weight
	TEX_COORD0, //!< a_texcoord0
	TEX_COORD1, //!< a_texcoord1
	TEX_COORD2, //!< a_texcoord2
	TEX_COORD3, //!< a_texcoord3
	TEX_COORD4, //!< a_texcoord4
	TEX_COORD5, //!< a_texcoord5
	TEX_COORD6, //!< a_texcoord6
	TEX_COORD7, //!< a_texcoord7
	COUNT
}

/// Vertex attribute type enum.
AttribType :: enum c.int {
	UINT8,  //!< Uint8
	UINT10, //!< Uint10, availability depends on: `BGFX_CAPS_VERTEX_ATTRIB_UINT10`.
	INT16,  //!< Int16
	HALF,   //!< Half, availability depends on: `BGFX_CAPS_VERTEX_ATTRIB_HALF`.
	FLOAT,  //!< Float
	COUNT
}

/// Texture format enum.
/// Notation:
///       RGBA16S
///       ^   ^ ^
///       |   | +-- [ ]Unorm
///       |   |     [F]loat
///       |   |     [S]norm
///       |   |     [I]nt
///       |   |     [U]int
///       |   +---- Number of bits per component
///       +-------- Components
/// @attention Availability depends on Caps (see: formats).
TextureFormat :: enum c.int {
	B_C1,          //!< DXT1 R5G6B5A1
	B_C2,          //!< DXT3 R5G6B5A4
	B_C3,          //!< DXT5 R5G6B5A8
	B_C4,          //!< LATC1/ATI1 R8
	B_C5,          //!< LATC2/ATI2 RG8
	B_C6_H,        //!< BC6H RGB16F
	B_C7,          //!< BC7 RGB 4-7 bits per color channel, 0-8 bits alpha
	E_T_C1,        //!< ETC1 RGB8
	E_T_C2,        //!< ETC2 RGB8
	E_T_C2_A,      //!< ETC2 RGBA8
	E_T_C2_A1,     //!< ETC2 RGB8A1
	P_T_C12,       //!< PVRTC1 RGB 2BPP
	P_T_C14,       //!< PVRTC1 RGB 4BPP
	P_T_C12_A,     //!< PVRTC1 RGBA 2BPP
	P_T_C14_A,     //!< PVRTC1 RGBA 4BPP
	P_T_C22,       //!< PVRTC2 RGBA 2BPP
	P_T_C24,       //!< PVRTC2 RGBA 4BPP
	A_T_C,         //!< ATC RGB 4BPP
	A_T_C_E,       //!< ATCE RGBA 8 BPP explicit alpha
	A_T_C_I,       //!< ATCI RGBA 8 BPP interpolated alpha
	A_S_T_C4X4,    //!< ASTC 4x4 8.0 BPP
	A_S_T_C5X4,    //!< ASTC 5x4 6.40 BPP
	A_S_T_C5X5,    //!< ASTC 5x5 5.12 BPP
	A_S_T_C6X5,    //!< ASTC 6x5 4.27 BPP
	A_S_T_C6X6,    //!< ASTC 6x6 3.56 BPP
	A_S_T_C8X5,    //!< ASTC 8x5 3.20 BPP
	A_S_T_C8X6,    //!< ASTC 8x6 2.67 BPP
	A_S_T_C8X8,    //!< ASTC 8x8 2.00 BPP
	A_S_T_C10X5,   //!< ASTC 10x5 2.56 BPP
	A_S_T_C10X6,   //!< ASTC 10x6 2.13 BPP
	A_S_T_C10X8,   //!< ASTC 10x8 1.60 BPP
	A_S_T_C10X10,  //!< ASTC 10x10 1.28 BPP
	A_S_T_C12X10,  //!< ASTC 12x10 1.07 BPP
	A_S_T_C12X12,  //!< ASTC 12x12 0.89 BPP
	UNKNOWN,       //!< Compressed formats above.
	R1,
	A8,
	R8,
	R8_I,
	R8_U,
	R8_S,
	R16,
	R16_I,
	R16_U,
	R16_F,
	R16_S,
	R32_I,
	R32_U,
	R32_F,
	R_G8,
	R_G8_I,
	R_G8_U,
	R_G8_S,
	R_G16,
	R_G16_I,
	R_G16_U,
	R_G16_F,
	R_G16_S,
	R_G32_I,
	R_G32_U,
	R_G32_F,
	R_G_B8,
	R_G_B8_I,
	R_G_B8_U,
	R_G_B8_S,
	R_G_B9_E5_F,
	B_G_R_A8,
	R_G_B_A8,
	R_G_B_A8_I,
	R_G_B_A8_U,
	R_G_B_A8_S,
	R_G_B_A16,
	R_G_B_A16_I,
	R_G_B_A16_U,
	R_G_B_A16_F,
	R_G_B_A16_S,
	R_G_B_A32_I,
	R_G_B_A32_U,
	R_G_B_A32_F,
	B5_G6_R5,
	R5_G6_B5,
	B_G_R_A4,
	R_G_B_A4,
	B_G_R5_A1,
	R_G_B5_A1,
	R_G_B10_A2,
	R_G11_B10_F,
	UNKNOWN_DEPTH, //!< Depth formats below.
	D16,
	D24,
	D24_S8,
	D32,
	D16_F,
	D24_F,
	D32_F,
	D0_S8,
	COUNT
}

/// Uniform type enum.
UniformType :: enum c.int {
	SAMPLER, //!< Sampler.
	END,     //!< Reserved, do not use.
	VEC4,    //!< 4 floats vector.
	MAT3,    //!< 3x3 matrix.
	MAT4,    //!< 4x4 matrix.
	COUNT
}

/// Backbuffer ratio enum.
BackbufferRatio :: enum c.int {
	EQUAL,     //!< Equal to backbuffer.
	HALF,      //!< One half size of backbuffer.
	QUARTER,   //!< One quarter size of backbuffer.
	EIGHTH,    //!< One eighth size of backbuffer.
	SIXTEENTH, //!< One sixteenth size of backbuffer.
	DOUBLE,    //!< Double size of backbuffer.
	COUNT
}

/// Occlusion query result.
OcclusionQueryResult :: enum c.int {
	INVISIBLE, //!< Query failed test.
	VISIBLE,   //!< Query passed test.
	NO_RESULT, //!< Query result is not available yet.
	COUNT
}

/// Primitive topology.
Topology :: enum c.int {
	TRI_LIST,   //!< Triangle list.
	TRI_STRIP,  //!< Triangle strip.
	LINE_LIST,  //!< Line list.
	LINE_STRIP, //!< Line strip.
	POINT_LIST, //!< Point list.
	COUNT
}

/// Topology conversion function.
TopologyConvert :: enum c.int {
	TRI_LIST_FLIP_WINDING,   //!< Flip winding order of triangle list.
	TRI_STRIP_FLIP_WINDING,  //!< Flip winding order of triangle strip.
	TRI_LIST_TO_LINE_LIST,   //!< Convert triangle list to line list.
	TRI_STRIP_TO_TRI_LIST,   //!< Convert triangle strip to triangle list.
	LINE_STRIP_TO_LINE_LIST, //!< Convert line strip to line list.
	COUNT
}

/// Topology sort order.
TopologySort :: enum c.int {
	DIRECTION_FRONT_TO_BACK_MIN,
	DIRECTION_FRONT_TO_BACK_AVG,
	DIRECTION_FRONT_TO_BACK_MAX,
	DIRECTION_BACK_TO_FRONT_MIN,
	DIRECTION_BACK_TO_FRONT_AVG,
	DIRECTION_BACK_TO_FRONT_MAX,
	DISTANCE_FRONT_TO_BACK_MIN,
	DISTANCE_FRONT_TO_BACK_AVG,
	DISTANCE_FRONT_TO_BACK_MAX,
	DISTANCE_BACK_TO_FRONT_MIN,
	DISTANCE_BACK_TO_FRONT_AVG,
	DISTANCE_BACK_TO_FRONT_MAX,
	COUNT
}

/// View mode sets draw call sort order.
ViewMode :: enum c.int {
	DEFAULT,          //!< Default sort order.
	SEQUENTIAL,       //!< Sort in the same order in which submit calls were called.
	DEPTH_ASCENDING,  //!< Sort draw call depth in ascending order.
	DEPTH_DESCENDING, //!< Sort draw call depth in descending order.
	COUNT
}

/// Native window handle type.
NativeWindowHandleType :: enum c.int {
	DEFAULT, //!< Platform default handle type (X11 on Linux).
	WAYLAND, //!< Wayland.
	COUNT
}

/// Render frame enum.
RenderFrame :: enum c.int {
	NO_CONTEXT, //!< Renderer context is not created yet.
	RENDER,     //!< Renderer context is created and rendering.
	TIMEOUT,    //!< Renderer context wait for main thread signal timed out without rendering.
	EXITING,    //!< Renderer context is getting destroyed.
	COUNT
}

/// GPU info.
CapsGpu :: struct {
	vendorId: u16, //<! Vendor PCI id. See `BGFX_PCI_ID_*`.
	deviceId: u16, //<! Device id.
}

/// Renderer runtime limits.
CapsLimits :: struct {
	maxDrawCalls:            u32, //<! Maximum number of draw calls.
	maxBlits:                u32, //<! Maximum number of blit calls.
	maxTextureSize:          u32, //<! Maximum texture size.
	maxTextureLayers:        u32, //<! Maximum texture layers.
	maxViews:                u32, //<! Maximum number of views.
	maxFrameBuffers:         u32, //<! Maximum number of frame buffer handles.
	maxFBAttachments:        u32, //<! Maximum number of frame buffer attachments.
	maxPrograms:             u32, //<! Maximum number of program handles.
	maxShaders:              u32, //<! Maximum number of shader handles.
	maxTextures:             u32, //<! Maximum number of texture handles.
	maxTextureSamplers:      u32, //<! Maximum number of texture samplers.
	maxComputeBindings:      u32, //<! Maximum number of compute bindings.
	maxVertexLayouts:        u32, //<! Maximum number of vertex format layouts.
	maxVertexStreams:        u32, //<! Maximum number of vertex streams.
	maxIndexBuffers:         u32, //<! Maximum number of index buffer handles.
	maxVertexBuffers:        u32, //<! Maximum number of vertex buffer handles.
	maxDynamicIndexBuffers:  u32, //<! Maximum number of dynamic index buffer handles.
	maxDynamicVertexBuffers: u32, //<! Maximum number of dynamic vertex buffer handles.
	maxUniforms:             u32, //<! Maximum number of uniform handles.
	maxOcclusionQueries:     u32, //<! Maximum number of occlusion query handles.
	maxEncoders:             u32, //<! Maximum number of encoder threads.
	minResourceCbSize:       u32, //<! Minimum resource command buffer size.
	transientVbSize:         u32, //<! Maximum transient vertex buffer size.
	transientIbSize:         u32, //<! Maximum transient index buffer size.
}

/// Renderer capabilities.
Caps :: struct {
	rendererType:     RendererType,             //<! Renderer backend type. See: `bgfx::RendererType`
	supported:        u64,
	vendorId:         u16,                      //<! Selected GPU vendor PCI id.
	deviceId:         u16,                      //<! Selected GPU device id.
	homogeneousDepth: bool,                     //<! True when NDC depth is in [-1, 1] range, otherwise its [0, 1].
	originBottomLeft: bool,                     //<! True when NDC origin is at bottom left.
	numGPUs:          u8,                       //<! Number of enumerated GPUs.
	gpu:              [4]CapsGpu,               //<! Enumerated GPUs.
	limits:           CapsLimits,               //<! Renderer runtime limits.
	formats:          [TextureFormat.COUNT]u16,
}

/// Internal data.
InternalData :: struct {
	caps:     ^/*const*/Caps, //<! Renderer capabilities.
	context_: rawptr,         //<! GL context, or D3D device.
}

/// Platform data.
PlatformData :: struct {
	ndt:          rawptr,                 //<! Native display type (*nix specific).
	nwh:          rawptr,
	context_:     rawptr,
	backBuffer:   rawptr,
	backBufferDS: rawptr,
	type:         NativeWindowHandleType, //<! Handle type. Needed for platforms having more than one option.
}

/// Backbuffer resolution and reset parameters.
Resolution :: struct {
	format:          TextureFormat, //<! Backbuffer format.
	width:           u32,           //<! Backbuffer width.
	height:          u32,           //<! Backbuffer height.
	reset:           u32,           //<! Reset parameters.
	numBackBuffers:  u8,            //<! Number of back buffers.
	maxFrameLatency: u8,            //<! Maximum frame latency.
	debugTextScale:  u8,            //<! Scale factor for debug text.
}

/// Configurable runtime limits parameters.
InitLimits :: struct {
	maxEncoders:       u16, //<! Maximum number of encoder threads.
	minResourceCbSize: u32, //<! Minimum resource command buffer size.
	transientVbSize:   u32, //<! Maximum transient vertex buffer size.
	transientIbSize:   u32, //<! Maximum transient index buffer size.
}

/// Initialization parameters used by `bgfx::init`.
Init :: struct {
	type:         RendererType,
	vendorId:     u16,
	deviceId:     u16,
	capabilities: u64,          //<! Capabilities initialization mask (default: UINT64_MAX).
	debug:        bool,         //<! Enable device for debugging.
	profile:      bool,         //<! Enable device for profiling.
	platformData: PlatformData, //<! Platform data.
	resolution:   Resolution,   //<! Backbuffer resolution and reset parameters. See: `bgfx::Resolution`.
	limits:       InitLimits,   //<! Configurable runtime limits parameters.
	callback:     rawptr,
	allocator:    rawptr,
}

/// Memory must be obtained by calling `bgfx::alloc`, `bgfx::copy`, or `bgfx::makeRef`.
/// @attention It is illegal to create this structure on stack and pass it to any bgfx API.
Memory :: struct {
	data: ^u8, //<! Pointer to data.
	size: u32, //<! Data size.
}

/// Transient index buffer.
TransientIndexBuffer :: struct {
	data:       ^u8,               //<! Pointer to data.
	size:       u32,               //<! Data size.
	startIndex: u32,               //<! First index.
	handle:     IndexBufferHandle, //<! Index buffer handle.
	isIndex16:  bool,              //<! Index buffer format is 16-bits if true, otherwise it is 32-bit.
}

/// Transient vertex buffer.
TransientVertexBuffer :: struct {
	data:         ^u8,                //<! Pointer to data.
	size:         u32,                //<! Data size.
	startVertex:  u32,                //<! First vertex.
	stride:       u16,                //<! Vertex stride.
	handle:       VertexBufferHandle, //<! Vertex buffer handle.
	layoutHandle: VertexLayoutHandle, //<! Vertex layout handle.
}

/// Instance data buffer info.
InstanceDataBuffer :: struct {
	data:   ^u8,                //<! Pointer to data.
	size:   u32,                //<! Data size.
	offset: u32,                //<! Offset in vertex buffer.
	num:    u32,                //<! Number of instances.
	stride: u16,                //<! Vertex buffer stride.
	handle: VertexBufferHandle, //<! Vertex buffer object handle.
}

/// Texture info.
TextureInfo :: struct {
	format:       TextureFormat, //<! Texture format.
	storageSize:  u32,           //<! Total amount of bytes required to store texture.
	width:        u16,           //<! Texture width.
	height:       u16,           //<! Texture height.
	depth:        u16,           //<! Texture depth.
	numLayers:    u16,           //<! Number of layers in texture array.
	numMips:      u8,            //<! Number of MIP maps.
	bitsPerPixel: u8,            //<! Format bits per pixel.
	cubeMap:      bool,          //<! Texture is cubemap.
}

/// Uniform info.
UniformInfo :: struct {
	name: [256]u8,     //<! Uniform name.
	type: UniformType, //<! Uniform type.
	num:  u16,         //<! Number of elements in array.
}

/// Frame buffer texture attachment info.
Attachment :: struct {
	access:    Access,        //<! Attachment access. See `Access::Enum`.
	handle:    TextureHandle, //<! Render target texture handle.
	mip:       u16,           //<! Mip level.
	layer:     u16,           //<! Cubemap side or depth layer/slice to use.
	numLayers: u16,           //<! Number of texture layer/slice(s) in array to use.
	resolve:   u8,            //<! Resolve flags. See: `BGFX_RESOLVE_*`
}

/// Transform data.
Transform :: struct {
	data: ^f32, //<! Pointer to first 4x4 matrix.
	num:  u16,  //<! Number of matrices.
}

/// View stats.
ViewStats :: struct {
	name:         [256]u8, //<! View name.
	view:         ViewId,  //<! View id.
	cpuTimeBegin: i64,     //<! CPU (submit) begin time.
	cpuTimeEnd:   i64,     //<! CPU (submit) end time.
	gpuTimeBegin: i64,     //<! GPU begin time.
	gpuTimeEnd:   i64,     //<! GPU end time.
	gpuFrameNum:  u32,     //<! Frame which generated gpuTimeBegin, gpuTimeEnd.
}

/// Encoder stats.
EncoderStats :: struct {
	cpuTimeBegin: i64, //<! Encoder thread CPU submit begin time.
	cpuTimeEnd:   i64, //<! Encoder thread CPU submit end time.
}

/// Renderer statistics data.
/// @remarks All time values are high-resolution timestamps, while
/// time frequencies define timestamps-per-second for that hardware.
Stats :: struct {
	cpuTimeFrame:            i64,                 //<! CPU time between two `bgfx::frame` calls.
	cpuTimeBegin:            i64,                 //<! Render thread CPU submit begin time.
	cpuTimeEnd:              i64,                 //<! Render thread CPU submit end time.
	cpuTimerFreq:            i64,                 //<! CPU timer frequency. Timestamps-per-second
	gpuTimeBegin:            i64,                 //<! GPU frame begin time.
	gpuTimeEnd:              i64,                 //<! GPU frame end time.
	gpuTimerFreq:            i64,                 //<! GPU timer frequency.
	waitRender:              i64,                 //<! Time spent waiting for render backend thread to finish issuing draw commands to underlying graphics API.
	waitSubmit:              i64,                 //<! Time spent waiting for submit thread to advance to next frame.
	numDraw:                 u32,                 //<! Number of draw calls submitted.
	numCompute:              u32,                 //<! Number of compute calls submitted.
	numBlit:                 u32,                 //<! Number of blit calls submitted.
	maxGpuLatency:           u32,                 //<! GPU driver latency.
	gpuFrameNum:             u32,                 //<! Frame which generated gpuTimeBegin, gpuTimeEnd.
	numDynamicIndexBuffers:  u16,                 //<! Number of used dynamic index buffers.
	numDynamicVertexBuffers: u16,                 //<! Number of used dynamic vertex buffers.
	numFrameBuffers:         u16,                 //<! Number of used frame buffers.
	numIndexBuffers:         u16,                 //<! Number of used index buffers.
	numOcclusionQueries:     u16,                 //<! Number of used occlusion queries.
	numPrograms:             u16,                 //<! Number of used programs.
	numShaders:              u16,                 //<! Number of used shaders.
	numTextures:             u16,                 //<! Number of used textures.
	numUniforms:             u16,                 //<! Number of used uniforms.
	numVertexBuffers:        u16,                 //<! Number of used vertex buffers.
	numVertexLayouts:        u16,                 //<! Number of used vertex layouts.
	textureMemoryUsed:       i64,                 //<! Estimate of texture memory used.
	rtMemoryUsed:            i64,                 //<! Estimate of render target memory used.
	transientVbUsed:         i32,                 //<! Amount of transient vertex buffer used.
	transientIbUsed:         i32,                 //<! Amount of transient index buffer used.
	numPrims:                [Topology.COUNT]u32, //<! Number of primitives rendered.
	gpuMemoryMax:            i64,                 //<! Maximum available GPU memory for application.
	gpuMemoryUsed:           i64,                 //<! Amount of GPU memory used by the application.
	width:                   u16,                 //<! Backbuffer width in pixels.
	height:                  u16,                 //<! Backbuffer height in pixels.
	textWidth:               u16,                 //<! Debug text width in characters.
	textHeight:              u16,                 //<! Debug text height in characters.
	numViews:                u16,                 //<! Number of view stats.
	viewStats:               ^ViewStats,          //<! Array of View stats.
	numEncoders:             u8,                  //<! Number of encoders used during frame.
	encoderStats:            ^EncoderStats,       //<! Array of encoder stats.
}

/// Vertex layout.
VertexLayout :: struct {
	hash:       u32,               //<! Hash.
	stride:     u16,               //<! Stride.
	offset:     [Attrib.COUNT]u16, //<! Attribute offsets.
	attributes: [Attrib.COUNT]u16, //<! Used attributes.
}

/// Encoders are used for submitting draw calls from multiple threads. Only one encoder
/// per thread should be used. Use `bgfx::begin()` to obtain an encoder for a thread.
Encoder :: struct { /*opaque*/ }

DynamicIndexBufferHandle :: distinct u16

DynamicVertexBufferHandle :: distinct u16

FrameBufferHandle :: distinct u16

IndexBufferHandle :: distinct u16

IndirectBufferHandle :: distinct u16

OcclusionQueryHandle :: distinct u16

ProgramHandle :: distinct u16

ShaderHandle :: distinct u16

TextureHandle :: distinct u16

UniformHandle :: distinct u16

VertexBufferHandle :: distinct u16

VertexLayoutHandle :: distinct u16


/// Init attachment.
///
/// @param[in] _handle Render target texture handle.
/// @param[in] _access Access. See `Access::Enum`.
/// @param[in] _layer Cubemap side or depth layer/slice to use.
/// @param[in] _numLayers Number of texture layer/slice(s) in array to use.
/// @param[in] _mip Mip level.
/// @param[in] _resolve Resolve flags. See: `BGFX_RESOLVE_*`
attachment_init :: #force_inline proc(_this: ^Attachment, _handle: TextureHandle, _access: Access, _layer: u16, _numLayers: u16, _mip: u16, _resolve: u8) {
	bgfx_attachment_init(_this, _handle, _access, _layer, _numLayers, _mip, _resolve)
}

/// Start VertexLayout.
///
/// @param[in] _rendererType Renderer backend type. See: `bgfx::RendererType`
vertex_layout_begin :: #force_inline proc(_this: ^VertexLayout, _rendererType: RendererType) -> ^VertexLayout {
	return bgfx_vertex_layout_begin(_this, _rendererType)
}

/// Add attribute to VertexLayout.
/// @remarks Must be called between begin/end.
///
/// @param[in] _attrib Attribute semantics. See: `bgfx::Attrib`
/// @param[in] _num Number of elements 1, 2, 3 or 4.
/// @param[in] _type Element type.
/// @param[in] _normalized When using fixed point AttribType (f.e. Uint8)
///    value will be normalized for vertex shader usage. When normalized
///    is set to true, AttribType::Uint8 value in range 0-255 will be
///    in range 0.0-1.0 in vertex shader.
/// @param[in] _asInt Packaging rule for vertexPack, vertexUnpack, and
///    vertexConvert for AttribType::Uint8 and AttribType::Int16.
///    Unpacking code must be implemented inside vertex shader.
vertex_layout_add :: #force_inline proc(_this: ^VertexLayout, _attrib: Attrib, _num: u8, _type: AttribType, _normalized: bool, _asInt: bool) -> ^VertexLayout {
	return bgfx_vertex_layout_add(_this, _attrib, _num, _type, _normalized, _asInt)
}

/// Decode attribute.
///
/// @param[in] _attrib Attribute semantics. See: `bgfx::Attrib`
/// @param[out] _num Number of elements.
/// @param[out] _type Element type.
/// @param[out] _normalized Attribute is normalized.
/// @param[out] _asInt Attribute is packed as int.
vertex_layout_decode :: #force_inline proc(_this: /*const*/^VertexLayout, _attrib: Attrib, _num: ^u8 , _type: ^AttribType, _normalized: ^bool , _asInt: ^bool ) {
	bgfx_vertex_layout_decode(_this, _attrib, _num, _type, _normalized, _asInt)
}

/// Returns `true` if VertexLayout contains attribute.
///
/// @param[in] _attrib Attribute semantics. See: `bgfx::Attrib`
vertex_layout_has :: #force_inline proc(_this: /*const*/^VertexLayout, _attrib: Attrib) -> bool {
	return bgfx_vertex_layout_has(_this, _attrib)
}

/// Skip `_num` bytes in vertex stream.
///
/// @param[in] _num Number of bytes to skip.
vertex_layout_skip :: #force_inline proc(_this: ^VertexLayout, _num: u8) -> ^VertexLayout {
	return bgfx_vertex_layout_skip(_this, _num)
}

/// End VertexLayout.
vertex_layout_end :: #force_inline proc(_this: ^VertexLayout) {
	bgfx_vertex_layout_end(_this)
}

/// Returns relative attribute offset from the vertex.
///
/// @param[in] _attrib Attribute semantics. See: `bgfx::Attrib`
vertex_layout_get_offset :: #force_inline proc(_this: /*const*/^VertexLayout, _attrib: Attrib) -> u16 {
	return bgfx_vertex_layout_get_offset(_this, _attrib)
}

/// Returns vertex stride.
vertex_layout_get_stride :: #force_inline proc(_this: /*const*/^VertexLayout) -> u16 {
	return bgfx_vertex_layout_get_stride(_this)
}

/// Returns size of vertex buffer for number of vertices.
///
/// @param[in] _num Number of vertices.
vertex_layout_get_size :: #force_inline proc(_this: /*const*/^VertexLayout, _num: u32) -> u32 {
	return bgfx_vertex_layout_get_size(_this, _num)
}

/// Pack vertex attribute into vertex stream format.
///
/// @param[in] _input Value to be packed into vertex stream.
/// @param[in] _inputNormalized `true` if input value is already normalized.
/// @param[in] _attr Attribute to pack.
/// @param[in] _layout Vertex stream layout.
/// @param[in] _data Destination vertex stream where data will be packed.
/// @param[in] _index Vertex index that will be modified.
vertex_pack :: #force_inline proc(_input: [4]/*const*/f32, _inputNormalized: bool, _attr: Attrib, _layout: ^/*const*/VertexLayout , _data: rawptr, _index: u32) {
	bgfx_vertex_pack(_input, _inputNormalized, _attr, _layout, _data, _index)
}

/// Unpack vertex attribute from vertex stream format.
///
/// @param[out] _output Result of unpacking.
/// @param[in] _attr Attribute to unpack.
/// @param[in] _layout Vertex stream layout.
/// @param[in] _data Source vertex stream from where data will be unpacked.
/// @param[in] _index Vertex index that will be unpacked.
vertex_unpack :: #force_inline proc(_output: [4]f32, _attr: Attrib, _layout: ^/*const*/VertexLayout , _data: /*const*/rawptr, _index: u32) {
	bgfx_vertex_unpack(_output, _attr, _layout, _data, _index)
}

/// Converts vertex stream data from one vertex stream format to another.
///
/// @param[in] _dstLayout Destination vertex stream layout.
/// @param[in] _dstData Destination vertex stream.
/// @param[in] _srcLayout Source vertex stream layout.
/// @param[in] _srcData Source vertex stream data.
/// @param[in] _num Number of vertices to convert from source to destination.
vertex_convert :: #force_inline proc(_dstLayout: ^/*const*/VertexLayout , _dstData: rawptr, _srcLayout: ^/*const*/VertexLayout , _srcData: /*const*/rawptr, _num: u32) {
	bgfx_vertex_convert(_dstLayout, _dstData, _srcLayout, _srcData, _num)
}

/// Weld vertices.
///
/// @param[in] _output Welded vertices remapping table. The size of buffer
///    must be the same as number of vertices.
/// @param[in] _layout Vertex stream layout.
/// @param[in] _data Vertex stream.
/// @param[in] _num Number of vertices in vertex stream.
/// @param[in] _index32 Set to `true` if input indices are 32-bit.
/// @param[in] _epsilon Error tolerance for vertex position comparison.
weld_vertices :: #force_inline proc(_output: rawptr, _layout: ^/*const*/VertexLayout , _data: /*const*/rawptr, _num: u32, _index32: bool, _epsilon: f32) -> u32 {
	return bgfx_weld_vertices(_output, _layout, _data, _num, _index32, _epsilon)
}

/// Convert index buffer for use with different primitive topologies.
///
/// @param[in] _conversion Conversion type, see `TopologyConvert::Enum`.
/// @param[out] _dst Destination index buffer. If this argument is NULL
///    function will return number of indices after conversion.
/// @param[in] _dstSize Destination index buffer in bytes. It must be
///    large enough to contain output indices. If destination size is
///    insufficient index buffer will be truncated.
/// @param[in] _indices Source indices.
/// @param[in] _numIndices Number of input indices.
/// @param[in] _index32 Set to `true` if input indices are 32-bit.
topology_convert :: #force_inline proc(_conversion: TopologyConvert, _dst: rawptr, _dstSize: u32, _indices: /*const*/rawptr, _numIndices: u32, _index32: bool) -> u32 {
	return bgfx_topology_convert(_conversion, _dst, _dstSize, _indices, _numIndices, _index32)
}

/// Sort indices.
///
/// @param[in] _sort Sort order, see `TopologySort::Enum`.
/// @param[out] _dst Destination index buffer.
/// @param[in] _dstSize Destination index buffer in bytes. It must be
///    large enough to contain output indices. If destination size is
///    insufficient index buffer will be truncated.
/// @param[in] _dir Direction (vector must be normalized).
/// @param[in] _pos Position.
/// @param[in] _vertices Pointer to first vertex represented as
///    float x, y, z. Must contain at least number of vertices
///    referencende by index buffer.
/// @param[in] _stride Vertex stride.
/// @param[in] _indices Source indices.
/// @param[in] _numIndices Number of input indices.
/// @param[in] _index32 Set to `true` if input indices are 32-bit.
topology_sort_tri_list :: #force_inline proc(_sort: TopologySort, _dst: rawptr, _dstSize: u32, _dir: [3]/*const*/f32, _pos: [3]/*const*/f32, _vertices: /*const*/rawptr, _stride: u32, _indices: /*const*/rawptr, _numIndices: u32, _index32: bool) {
	bgfx_topology_sort_tri_list(_sort, _dst, _dstSize, _dir, _pos, _vertices, _stride, _indices, _numIndices, _index32)
}

/// Returns supported backend API renderers.
///
/// @param[in] _max Maximum number of elements in _enum array.
/// @param[inout] _enum Array where supported renderers will be written.
get_supported_renderers :: #force_inline proc(_max: u8, _enum: ^RendererType) -> u8 {
	return bgfx_get_supported_renderers(_max, _enum)
}

/// Returns name of renderer.
///
/// @param[in] _type Renderer backend type. See: `bgfx::RendererType`
get_renderer_name :: #force_inline proc(_type: RendererType) -> cstring {
	return bgfx_get_renderer_name(_type)
}

/// Fill bgfx::Init struct with default values, before using it to initialize the library.
///
/// @param[in] _init Pointer to structure to be initialized. See: `bgfx::Init` for more info.
init_ctor :: #force_inline proc(_init: ^Init) {
	bgfx_init_ctor(_init)
}

/// Initialize the bgfx library.
///
/// @param[in] _init Initialization parameters. See: `bgfx::Init` for more info.
init :: #force_inline proc(_init: ^/*const*/Init ) -> bool {
	return bgfx_init(_init)
}

/// Shutdown bgfx library.
shutdown :: #force_inline proc() {
	bgfx_shutdown()
}

/// Reset graphic settings and back-buffer size.
/// @attention This call doesn’t change the window size, it just resizes
///   the back-buffer. Your windowing code controls the window size.
///
/// @param[in] _width Back-buffer width.
/// @param[in] _height Back-buffer height.
/// @param[in] _flags See: `BGFX_RESET_*` for more info.
///      - `BGFX_RESET_NONE` - No reset flags.
///      - `BGFX_RESET_FULLSCREEN` - Not supported yet.
///      - `BGFX_RESET_MSAA_X[2/4/8/16]` - Enable 2, 4, 8 or 16 x MSAA.
///      - `BGFX_RESET_VSYNC` - Enable V-Sync.
///      - `BGFX_RESET_MAXANISOTROPY` - Turn on/off max anisotropy.
///      - `BGFX_RESET_CAPTURE` - Begin screen capture.
///      - `BGFX_RESET_FLUSH_AFTER_RENDER` - Flush rendering after submitting to GPU.
///      - `BGFX_RESET_FLIP_AFTER_RENDER` - This flag  specifies where flip
///        occurs. Default behaviour is that flip occurs before rendering new
///        frame. This flag only has effect when `BGFX_CONFIG_MULTITHREADED=0`.
///      - `BGFX_RESET_SRGB_BACKBUFFER` - Enable sRGB back-buffer.
/// @param[in] _format Texture format. See: `TextureFormat::Enum`.
reset :: #force_inline proc(_width: u32, _height: u32, _flags: u32, _format: TextureFormat) {
	bgfx_reset(_width, _height, _flags, _format)
}

/// Advance to next frame. When using multithreaded renderer, this call
/// just swaps internal buffers, kicks render thread, and returns. In
/// singlethreaded renderer this call does frame rendering.
///
/// @param[in] _capture Capture frame with graphics debugger.
frame :: #force_inline proc(_capture: bool) -> u32 {
	return bgfx_frame(_capture)
}

/// Returns current renderer backend API type.
/// @remarks
///   Library must be initialized.
get_renderer_type :: #force_inline proc() -> RendererType {
	return bgfx_get_renderer_type()
}

/// Returns renderer capabilities.
/// @remarks
///   Library must be initialized.
get_caps :: #force_inline proc() -> ^/*const*/Caps {
	return bgfx_get_caps()
}

/// Returns performance counters.
/// @attention Pointer returned is valid until `bgfx::frame` is called.
get_stats :: #force_inline proc() -> ^/*const*/Stats {
	return bgfx_get_stats()
}

/// Allocate buffer to pass to bgfx calls. Data will be freed inside bgfx.
///
/// @param[in] _size Size to allocate.
alloc :: #force_inline proc(_size: u32) -> ^/*const*/Memory {
	return bgfx_alloc(_size)
}

/// Allocate buffer and copy data into it. Data will be freed inside bgfx.
///
/// @param[in] _data Pointer to data to be copied.
/// @param[in] _size Size of data to be copied.
copy :: #force_inline proc(_data: /*const*/rawptr, _size: u32) -> ^/*const*/Memory {
	return bgfx_copy(_data, _size)
}

/// Make reference to data to pass to bgfx. Unlike `bgfx::alloc`, this call
/// doesn't allocate memory for data. It just copies the _data pointer. You
/// can pass `ReleaseFn` function pointer to release this memory after it's
/// consumed, otherwise you must make sure _data is available for at least 2
/// `bgfx::frame` calls. `ReleaseFn` function must be able to be called
/// from any thread.
/// @attention Data passed must be available for at least 2 `bgfx::frame` calls.
///
/// @param[in] _data Pointer to data.
/// @param[in] _size Size of data.
make_ref :: #force_inline proc(_data: /*const*/rawptr, _size: u32) -> ^/*const*/Memory {
	return bgfx_make_ref(_data, _size)
}

/// Make reference to data to pass to bgfx. Unlike `bgfx::alloc`, this call
/// doesn't allocate memory for data. It just copies the _data pointer. You
/// can pass `ReleaseFn` function pointer to release this memory after it's
/// consumed, otherwise you must make sure _data is available for at least 2
/// `bgfx::frame` calls. `ReleaseFn` function must be able to be called
/// from any thread.
/// @attention Data passed must be available for at least 2 `bgfx::frame` calls.
///
/// @param[in] _data Pointer to data.
/// @param[in] _size Size of data.
/// @param[in] _releaseFn Callback function to release memory after use.
/// @param[in] _userData User data to be passed to callback function.
make_ref_release :: #force_inline proc(_data: /*const*/rawptr, _size: u32, _releaseFn: ReleaseFn, _userData: rawptr) -> ^/*const*/Memory {
	return bgfx_make_ref_release(_data, _size, _releaseFn, _userData)
}

/// Set debug flags.
///
/// @param[in] _debug Available flags:
///      - `BGFX_DEBUG_IFH` - Infinitely fast hardware. When this flag is set
///        all rendering calls will be skipped. This is useful when profiling
///        to quickly assess potential bottlenecks between CPU and GPU.
///      - `BGFX_DEBUG_PROFILER` - Enable profiler.
///      - `BGFX_DEBUG_STATS` - Display internal statistics.
///      - `BGFX_DEBUG_TEXT` - Display debug text.
///      - `BGFX_DEBUG_WIREFRAME` - Wireframe rendering. All rendering
///        primitives will be rendered as lines.
set_debug :: #force_inline proc(_debug: u32) {
	bgfx_set_debug(_debug)
}

/// Clear internal debug text buffer.
///
/// @param[in] _attr Background color.
/// @param[in] _small Default 8x16 or 8x8 font.
dbg_text_clear :: #force_inline proc(_attr: u8, _small: bool) {
	bgfx_dbg_text_clear(_attr, _small)
}

/// Draw image into internal debug text buffer.
///
/// @param[in] _x Position x from the left corner of the window.
/// @param[in] _y Position y from the top corner of the window.
/// @param[in] _width Image width.
/// @param[in] _height Image height.
/// @param[in] _data Raw image data (character/attribute raw encoding).
/// @param[in] _pitch Image pitch in bytes.
dbg_text_image :: #force_inline proc(_x: u16, _y: u16, _width: u16, _height: u16, _data: /*const*/rawptr, _pitch: u16) {
	bgfx_dbg_text_image(_x, _y, _width, _height, _data, _pitch)
}

/// Create static index buffer.
///
/// @param[in] _mem Index buffer data.
/// @param[in] _flags Buffer creation flags.
///      - `BGFX_BUFFER_NONE` - No flags.
///      - `BGFX_BUFFER_COMPUTE_READ` - Buffer will be read from by compute shader.
///      - `BGFX_BUFFER_COMPUTE_WRITE` - Buffer will be written into by compute shader. When buffer
///          is created with `BGFX_BUFFER_COMPUTE_WRITE` flag it cannot be updated from CPU.
///      - `BGFX_BUFFER_COMPUTE_READ_WRITE` - Buffer will be used for read/write by compute shader.
///      - `BGFX_BUFFER_ALLOW_RESIZE` - Buffer will resize on buffer update if a different amount of
///          data is passed. If this flag is not specified, and more data is passed on update, the buffer
///          will be trimmed to fit the existing buffer size. This flag has effect only on dynamic
///          buffers.
///      - `BGFX_BUFFER_INDEX32` - Buffer is using 32-bit indices. This flag has effect only on
///          index buffers.
create_index_buffer :: #force_inline proc(_mem: ^/*const*/Memory, _flags: u16) -> IndexBufferHandle {
	return bgfx_create_index_buffer(_mem, _flags)
}

/// Set static index buffer debug name.
///
/// @param[in] _handle Static index buffer handle.
/// @param[in] _name Static index buffer name.
/// @param[in] _len Static index buffer name length (if length is INT32_MAX, it's expected
///    that _name is zero terminated string.
set_index_buffer_name :: #force_inline proc(_handle: IndexBufferHandle, _name: cstring, _len: i32) {
	bgfx_set_index_buffer_name(_handle, _name, _len)
}

/// Destroy static index buffer.
///
/// @param[in] _handle Static index buffer handle.
destroy_index_buffer :: #force_inline proc(_handle: IndexBufferHandle) {
	bgfx_destroy_index_buffer(_handle)
}

/// Create vertex layout.
///
/// @param[in] _layout Vertex layout.
create_vertex_layout :: #force_inline proc(_layout: ^/*const*/VertexLayout ) -> VertexLayoutHandle {
	return bgfx_create_vertex_layout(_layout)
}

/// Destroy vertex layout.
///
/// @param[in] _layoutHandle Vertex layout handle.
destroy_vertex_layout :: #force_inline proc(_layoutHandle: VertexLayoutHandle) {
	bgfx_destroy_vertex_layout(_layoutHandle)
}

/// Create static vertex buffer.
///
/// @param[in] _mem Vertex buffer data.
/// @param[in] _layout Vertex layout.
/// @param[in] _flags Buffer creation flags.
///     - `BGFX_BUFFER_NONE` - No flags.
///     - `BGFX_BUFFER_COMPUTE_READ` - Buffer will be read from by compute shader.
///     - `BGFX_BUFFER_COMPUTE_WRITE` - Buffer will be written into by compute shader. When buffer
///         is created with `BGFX_BUFFER_COMPUTE_WRITE` flag it cannot be updated from CPU.
///     - `BGFX_BUFFER_COMPUTE_READ_WRITE` - Buffer will be used for read/write by compute shader.
///     - `BGFX_BUFFER_ALLOW_RESIZE` - Buffer will resize on buffer update if a different amount of
///         data is passed. If this flag is not specified, and more data is passed on update, the buffer
///         will be trimmed to fit the existing buffer size. This flag has effect only on dynamic buffers.
///     - `BGFX_BUFFER_INDEX32` - Buffer is using 32-bit indices. This flag has effect only on index buffers.
create_vertex_buffer :: #force_inline proc(_mem: ^/*const*/Memory, _layout: ^/*const*/VertexLayout , _flags: u16) -> VertexBufferHandle {
	return bgfx_create_vertex_buffer(_mem, _layout, _flags)
}

/// Set static vertex buffer debug name.
///
/// @param[in] _handle Static vertex buffer handle.
/// @param[in] _name Static vertex buffer name.
/// @param[in] _len Static vertex buffer name length (if length is INT32_MAX, it's expected
///    that _name is zero terminated string.
set_vertex_buffer_name :: #force_inline proc(_handle: VertexBufferHandle, _name: cstring, _len: i32) {
	bgfx_set_vertex_buffer_name(_handle, _name, _len)
}

/// Destroy static vertex buffer.
///
/// @param[in] _handle Static vertex buffer handle.
destroy_vertex_buffer :: #force_inline proc(_handle: VertexBufferHandle) {
	bgfx_destroy_vertex_buffer(_handle)
}

/// Create empty dynamic index buffer.
///
/// @param[in] _num Number of indices.
/// @param[in] _flags Buffer creation flags.
///      - `BGFX_BUFFER_NONE` - No flags.
///      - `BGFX_BUFFER_COMPUTE_READ` - Buffer will be read from by compute shader.
///      - `BGFX_BUFFER_COMPUTE_WRITE` - Buffer will be written into by compute shader. When buffer
///          is created with `BGFX_BUFFER_COMPUTE_WRITE` flag it cannot be updated from CPU.
///      - `BGFX_BUFFER_COMPUTE_READ_WRITE` - Buffer will be used for read/write by compute shader.
///      - `BGFX_BUFFER_ALLOW_RESIZE` - Buffer will resize on buffer update if a different amount of
///          data is passed. If this flag is not specified, and more data is passed on update, the buffer
///          will be trimmed to fit the existing buffer size. This flag has effect only on dynamic
///          buffers.
///      - `BGFX_BUFFER_INDEX32` - Buffer is using 32-bit indices. This flag has effect only on
///          index buffers.
create_dynamic_index_buffer :: #force_inline proc(_num: u32, _flags: u16) -> DynamicIndexBufferHandle {
	return bgfx_create_dynamic_index_buffer(_num, _flags)
}

/// Create a dynamic index buffer and initialize it.
///
/// @param[in] _mem Index buffer data.
/// @param[in] _flags Buffer creation flags.
///      - `BGFX_BUFFER_NONE` - No flags.
///      - `BGFX_BUFFER_COMPUTE_READ` - Buffer will be read from by compute shader.
///      - `BGFX_BUFFER_COMPUTE_WRITE` - Buffer will be written into by compute shader. When buffer
///          is created with `BGFX_BUFFER_COMPUTE_WRITE` flag it cannot be updated from CPU.
///      - `BGFX_BUFFER_COMPUTE_READ_WRITE` - Buffer will be used for read/write by compute shader.
///      - `BGFX_BUFFER_ALLOW_RESIZE` - Buffer will resize on buffer update if a different amount of
///          data is passed. If this flag is not specified, and more data is passed on update, the buffer
///          will be trimmed to fit the existing buffer size. This flag has effect only on dynamic
///          buffers.
///      - `BGFX_BUFFER_INDEX32` - Buffer is using 32-bit indices. This flag has effect only on
///          index buffers.
create_dynamic_index_buffer_mem :: #force_inline proc(_mem: ^/*const*/Memory, _flags: u16) -> DynamicIndexBufferHandle {
	return bgfx_create_dynamic_index_buffer_mem(_mem, _flags)
}

/// Update dynamic index buffer.
///
/// @param[in] _handle Dynamic index buffer handle.
/// @param[in] _startIndex Start index.
/// @param[in] _mem Index buffer data.
update_dynamic_index_buffer :: #force_inline proc(_handle: DynamicIndexBufferHandle, _startIndex: u32, _mem: ^/*const*/Memory) {
	bgfx_update_dynamic_index_buffer(_handle, _startIndex, _mem)
}

/// Destroy dynamic index buffer.
///
/// @param[in] _handle Dynamic index buffer handle.
destroy_dynamic_index_buffer :: #force_inline proc(_handle: DynamicIndexBufferHandle) {
	bgfx_destroy_dynamic_index_buffer(_handle)
}

/// Create empty dynamic vertex buffer.
///
/// @param[in] _num Number of vertices.
/// @param[in] _layout Vertex layout.
/// @param[in] _flags Buffer creation flags.
///      - `BGFX_BUFFER_NONE` - No flags.
///      - `BGFX_BUFFER_COMPUTE_READ` - Buffer will be read from by compute shader.
///      - `BGFX_BUFFER_COMPUTE_WRITE` - Buffer will be written into by compute shader. When buffer
///          is created with `BGFX_BUFFER_COMPUTE_WRITE` flag it cannot be updated from CPU.
///      - `BGFX_BUFFER_COMPUTE_READ_WRITE` - Buffer will be used for read/write by compute shader.
///      - `BGFX_BUFFER_ALLOW_RESIZE` - Buffer will resize on buffer update if a different amount of
///          data is passed. If this flag is not specified, and more data is passed on update, the buffer
///          will be trimmed to fit the existing buffer size. This flag has effect only on dynamic
///          buffers.
///      - `BGFX_BUFFER_INDEX32` - Buffer is using 32-bit indices. This flag has effect only on
///          index buffers.
create_dynamic_vertex_buffer :: #force_inline proc(_num: u32, _layout: ^/*const*/VertexLayout, _flags: u16) -> DynamicVertexBufferHandle {
	return bgfx_create_dynamic_vertex_buffer(_num, _layout, _flags)
}

/// Create dynamic vertex buffer and initialize it.
///
/// @param[in] _mem Vertex buffer data.
/// @param[in] _layout Vertex layout.
/// @param[in] _flags Buffer creation flags.
///      - `BGFX_BUFFER_NONE` - No flags.
///      - `BGFX_BUFFER_COMPUTE_READ` - Buffer will be read from by compute shader.
///      - `BGFX_BUFFER_COMPUTE_WRITE` - Buffer will be written into by compute shader. When buffer
///          is created with `BGFX_BUFFER_COMPUTE_WRITE` flag it cannot be updated from CPU.
///      - `BGFX_BUFFER_COMPUTE_READ_WRITE` - Buffer will be used for read/write by compute shader.
///      - `BGFX_BUFFER_ALLOW_RESIZE` - Buffer will resize on buffer update if a different amount of
///          data is passed. If this flag is not specified, and more data is passed on update, the buffer
///          will be trimmed to fit the existing buffer size. This flag has effect only on dynamic
///          buffers.
///      - `BGFX_BUFFER_INDEX32` - Buffer is using 32-bit indices. This flag has effect only on
///          index buffers.
create_dynamic_vertex_buffer_mem :: #force_inline proc(_mem: ^/*const*/Memory, _layout: ^/*const*/VertexLayout, _flags: u16) -> DynamicVertexBufferHandle {
	return bgfx_create_dynamic_vertex_buffer_mem(_mem, _layout, _flags)
}

/// Update dynamic vertex buffer.
///
/// @param[in] _handle Dynamic vertex buffer handle.
/// @param[in] _startVertex Start vertex.
/// @param[in] _mem Vertex buffer data.
update_dynamic_vertex_buffer :: #force_inline proc(_handle: DynamicVertexBufferHandle, _startVertex: u32, _mem: ^/*const*/Memory) {
	bgfx_update_dynamic_vertex_buffer(_handle, _startVertex, _mem)
}

/// Destroy dynamic vertex buffer.
///
/// @param[in] _handle Dynamic vertex buffer handle.
destroy_dynamic_vertex_buffer :: #force_inline proc(_handle: DynamicVertexBufferHandle) {
	bgfx_destroy_dynamic_vertex_buffer(_handle)
}

/// Returns number of requested or maximum available indices.
///
/// @param[in] _num Number of required indices.
/// @param[in] _index32 Set to `true` if input indices will be 32-bit.
get_avail_transient_index_buffer :: #force_inline proc(_num: u32, _index32: bool) -> u32 {
	return bgfx_get_avail_transient_index_buffer(_num, _index32)
}

/// Returns number of requested or maximum available vertices.
///
/// @param[in] _num Number of required vertices.
/// @param[in] _layout Vertex layout.
get_avail_transient_vertex_buffer :: #force_inline proc(_num: u32, _layout: ^/*const*/VertexLayout ) -> u32 {
	return bgfx_get_avail_transient_vertex_buffer(_num, _layout)
}

/// Returns number of requested or maximum available instance buffer slots.
///
/// @param[in] _num Number of required instances.
/// @param[in] _stride Stride per instance.
get_avail_instance_data_buffer :: #force_inline proc(_num: u32, _stride: u16) -> u32 {
	return bgfx_get_avail_instance_data_buffer(_num, _stride)
}

/// Allocate transient index buffer.
///
/// @param[out] _tib TransientIndexBuffer structure will be filled, and will be valid
///    for the duration of frame, and can be reused for multiple draw
///    calls.
/// @param[in] _num Number of indices to allocate.
/// @param[in] _index32 Set to `true` if input indices will be 32-bit.
alloc_transient_index_buffer :: #force_inline proc(_tib: ^TransientIndexBuffer, _num: u32, _index32: bool) {
	bgfx_alloc_transient_index_buffer(_tib, _num, _index32)
}

/// Allocate transient vertex buffer.
///
/// @param[out] _tvb TransientVertexBuffer structure will be filled, and will be valid
///    for the duration of frame, and can be reused for multiple draw
///    calls.
/// @param[in] _num Number of vertices to allocate.
/// @param[in] _layout Vertex layout.
alloc_transient_vertex_buffer :: #force_inline proc(_tvb: ^TransientVertexBuffer, _num: u32, _layout: ^/*const*/VertexLayout ) {
	bgfx_alloc_transient_vertex_buffer(_tvb, _num, _layout)
}

/// Check for required space and allocate transient vertex and index
/// buffers. If both space requirements are satisfied function returns
/// true.
///
/// @param[out] _tvb TransientVertexBuffer structure will be filled, and will be valid
///    for the duration of frame, and can be reused for multiple draw
///    calls.
/// @param[in] _layout Vertex layout.
/// @param[in] _numVertices Number of vertices to allocate.
/// @param[out] _tib TransientIndexBuffer structure will be filled, and will be valid
///    for the duration of frame, and can be reused for multiple draw
///    calls.
/// @param[in] _numIndices Number of indices to allocate.
/// @param[in] _index32 Set to `true` if input indices will be 32-bit.
alloc_transient_buffers :: #force_inline proc(_tvb: ^TransientVertexBuffer, _layout: ^/*const*/VertexLayout , _numVertices: u32, _tib: ^TransientIndexBuffer, _numIndices: u32, _index32: bool) -> bool {
	return bgfx_alloc_transient_buffers(_tvb, _layout, _numVertices, _tib, _numIndices, _index32)
}

/// Allocate instance data buffer.
///
/// @param[out] _idb InstanceDataBuffer structure will be filled, and will be valid
///    for duration of frame, and can be reused for multiple draw
///    calls.
/// @param[in] _num Number of instances.
/// @param[in] _stride Instance stride. Must be multiple of 16.
alloc_instance_data_buffer :: #force_inline proc(_idb: ^InstanceDataBuffer, _num: u32, _stride: u16) {
	bgfx_alloc_instance_data_buffer(_idb, _num, _stride)
}

/// Create draw indirect buffer.
///
/// @param[in] _num Number of indirect calls.
create_indirect_buffer :: #force_inline proc(_num: u32) -> IndirectBufferHandle {
	return bgfx_create_indirect_buffer(_num)
}

/// Destroy draw indirect buffer.
///
/// @param[in] _handle Indirect buffer handle.
destroy_indirect_buffer :: #force_inline proc(_handle: IndirectBufferHandle) {
	bgfx_destroy_indirect_buffer(_handle)
}

/// Create shader from memory buffer.
/// @remarks
///   Shader binary is obtained by compiling shader offline with shaderc command line tool.
///
/// @param[in] _mem Shader binary.
create_shader :: #force_inline proc(_mem: ^/*const*/Memory) -> ShaderHandle {
	return bgfx_create_shader(_mem)
}

/// Returns the number of uniforms and uniform handles used inside a shader.
/// @remarks
///   Only non-predefined uniforms are returned.
///
/// @param[in] _handle Shader handle.
/// @param[out] _uniforms UniformHandle array where data will be stored.
/// @param[in] _max Maximum capacity of array.
get_shader_uniforms :: #force_inline proc(_handle: ShaderHandle, _uniforms: ^UniformHandle, _max: u16) -> u16 {
	return bgfx_get_shader_uniforms(_handle, _uniforms, _max)
}

/// Set shader debug name.
///
/// @param[in] _handle Shader handle.
/// @param[in] _name Shader name.
/// @param[in] _len Shader name length (if length is INT32_MAX, it's expected
///    that _name is zero terminated string).
set_shader_name :: #force_inline proc(_handle: ShaderHandle, _name: cstring, _len: i32) {
	bgfx_set_shader_name(_handle, _name, _len)
}

/// Destroy shader.
/// @remark Once a shader program is created with _handle,
///   it is safe to destroy that shader.
///
/// @param[in] _handle Shader handle.
destroy_shader :: #force_inline proc(_handle: ShaderHandle) {
	bgfx_destroy_shader(_handle)
}

/// Create program with vertex and fragment shaders.
///
/// @param[in] _vsh Vertex shader.
/// @param[in] _fsh Fragment shader.
/// @param[in] _destroyShaders If true, shaders will be destroyed when program is destroyed.
create_program :: #force_inline proc(_vsh: ShaderHandle, _fsh: ShaderHandle, _destroyShaders: bool) -> ProgramHandle {
	return bgfx_create_program(_vsh, _fsh, _destroyShaders)
}

/// Create program with compute shader.
///
/// @param[in] _csh Compute shader.
/// @param[in] _destroyShaders If true, shaders will be destroyed when program is destroyed.
create_compute_program :: #force_inline proc(_csh: ShaderHandle, _destroyShaders: bool) -> ProgramHandle {
	return bgfx_create_compute_program(_csh, _destroyShaders)
}

/// Destroy program.
///
/// @param[in] _handle Program handle.
destroy_program :: #force_inline proc(_handle: ProgramHandle) {
	bgfx_destroy_program(_handle)
}

/// Validate texture parameters.
///
/// @param[in] _depth Depth dimension of volume texture.
/// @param[in] _cubeMap Indicates that texture contains cubemap.
/// @param[in] _numLayers Number of layers in texture array.
/// @param[in] _format Texture format. See: `TextureFormat::Enum`.
/// @param[in] _flags Texture flags. See `BGFX_TEXTURE_*`.
is_texture_valid :: #force_inline proc(_depth: u16, _cubeMap: bool, _numLayers: u16, _format: TextureFormat, _flags: u64) -> bool {
	return bgfx_is_texture_valid(_depth, _cubeMap, _numLayers, _format, _flags)
}

/// Validate frame buffer parameters.
///
/// @param[in] _num Number of attachments.
/// @param[in] _attachment Attachment texture info. See: `bgfx::Attachment`.
is_frame_buffer_valid :: #force_inline proc(_num: u8, _attachment: ^/*const*/Attachment) -> bool {
	return bgfx_is_frame_buffer_valid(_num, _attachment)
}

/// Calculate amount of memory required for texture.
///
/// @param[out] _info Resulting texture info structure. See: `TextureInfo`.
/// @param[in] _width Width.
/// @param[in] _height Height.
/// @param[in] _depth Depth dimension of volume texture.
/// @param[in] _cubeMap Indicates that texture contains cubemap.
/// @param[in] _hasMips Indicates that texture contains full mip-map chain.
/// @param[in] _numLayers Number of layers in texture array.
/// @param[in] _format Texture format. See: `TextureFormat::Enum`.
calc_texture_size :: #force_inline proc(_info: ^TextureInfo, _width: u16, _height: u16, _depth: u16, _cubeMap: bool, _hasMips: bool, _numLayers: u16, _format: TextureFormat) {
	bgfx_calc_texture_size(_info, _width, _height, _depth, _cubeMap, _hasMips, _numLayers, _format)
}

/// Create texture from memory buffer.
///
/// @param[in] _mem DDS, KTX or PVR texture binary data.
/// @param[in] _flags Texture creation (see `BGFX_TEXTURE_*`.), and sampler (see `BGFX_SAMPLER_*`)
///    flags. Default texture sampling mode is linear, and wrap mode is repeat.
///    - `BGFX_SAMPLER_[U/V/W]_[MIRROR/CLAMP]` - Mirror or clamp to edge wrap
///      mode.
///    - `BGFX_SAMPLER_[MIN/MAG/MIP]_[POINT/ANISOTROPIC]` - Point or anisotropic
///      sampling.
/// @param[in] _skip Skip top level mips when parsing texture.
/// @param[out] _info When non-`NULL` is specified it returns parsed texture information.
create_texture :: #force_inline proc(_mem: ^/*const*/Memory, _flags: u64, _skip: u8, _info: ^TextureInfo) -> TextureHandle {
	return bgfx_create_texture(_mem, _flags, _skip, _info)
}

/// Create 2D texture.
///
/// @param[in] _width Width.
/// @param[in] _height Height.
/// @param[in] _hasMips Indicates that texture contains full mip-map chain.
/// @param[in] _numLayers Number of layers in texture array. Must be 1 if caps
///    `BGFX_CAPS_TEXTURE_2D_ARRAY` flag is not set.
/// @param[in] _format Texture format. See: `TextureFormat::Enum`.
/// @param[in] _flags Texture creation (see `BGFX_TEXTURE_*`.), and sampler (see `BGFX_SAMPLER_*`)
///    flags. Default texture sampling mode is linear, and wrap mode is repeat.
///    - `BGFX_SAMPLER_[U/V/W]_[MIRROR/CLAMP]` - Mirror or clamp to edge wrap
///      mode.
///    - `BGFX_SAMPLER_[MIN/MAG/MIP]_[POINT/ANISOTROPIC]` - Point or anisotropic
///      sampling.
/// @param[in] _mem Texture data. If `_mem` is non-NULL, created texture will be immutable. If
///    `_mem` is NULL content of the texture is uninitialized. When `_numLayers` is more than
///    1, expected memory layout is texture and all mips together for each array element.
create_texture_2d :: #force_inline proc(_width: u16, _height: u16, _hasMips: bool, _numLayers: u16, _format: TextureFormat, _flags: u64, _mem: ^/*const*/Memory) -> TextureHandle {
	return bgfx_create_texture_2d(_width, _height, _hasMips, _numLayers, _format, _flags, _mem)
}

/// Create texture with size based on back-buffer ratio. Texture will maintain ratio
/// if back buffer resolution changes.
///
/// @param[in] _ratio Texture size in respect to back-buffer size. See: `BackbufferRatio::Enum`.
/// @param[in] _hasMips Indicates that texture contains full mip-map chain.
/// @param[in] _numLayers Number of layers in texture array. Must be 1 if caps
///    `BGFX_CAPS_TEXTURE_2D_ARRAY` flag is not set.
/// @param[in] _format Texture format. See: `TextureFormat::Enum`.
/// @param[in] _flags Texture creation (see `BGFX_TEXTURE_*`.), and sampler (see `BGFX_SAMPLER_*`)
///    flags. Default texture sampling mode is linear, and wrap mode is repeat.
///    - `BGFX_SAMPLER_[U/V/W]_[MIRROR/CLAMP]` - Mirror or clamp to edge wrap
///      mode.
///    - `BGFX_SAMPLER_[MIN/MAG/MIP]_[POINT/ANISOTROPIC]` - Point or anisotropic
///      sampling.
create_texture_2d_scaled :: #force_inline proc(_ratio: BackbufferRatio, _hasMips: bool, _numLayers: u16, _format: TextureFormat, _flags: u64) -> TextureHandle {
	return bgfx_create_texture_2d_scaled(_ratio, _hasMips, _numLayers, _format, _flags)
}

/// Create 3D texture.
///
/// @param[in] _width Width.
/// @param[in] _height Height.
/// @param[in] _depth Depth.
/// @param[in] _hasMips Indicates that texture contains full mip-map chain.
/// @param[in] _format Texture format. See: `TextureFormat::Enum`.
/// @param[in] _flags Texture creation (see `BGFX_TEXTURE_*`.), and sampler (see `BGFX_SAMPLER_*`)
///    flags. Default texture sampling mode is linear, and wrap mode is repeat.
///    - `BGFX_SAMPLER_[U/V/W]_[MIRROR/CLAMP]` - Mirror or clamp to edge wrap
///      mode.
///    - `BGFX_SAMPLER_[MIN/MAG/MIP]_[POINT/ANISOTROPIC]` - Point or anisotropic
///      sampling.
/// @param[in] _mem Texture data. If `_mem` is non-NULL, created texture will be immutable. If
///    `_mem` is NULL content of the texture is uninitialized. When `_numLayers` is more than
///    1, expected memory layout is texture and all mips together for each array element.
create_texture_3d :: #force_inline proc(_width: u16, _height: u16, _depth: u16, _hasMips: bool, _format: TextureFormat, _flags: u64, _mem: ^/*const*/Memory) -> TextureHandle {
	return bgfx_create_texture_3d(_width, _height, _depth, _hasMips, _format, _flags, _mem)
}

/// Create Cube texture.
///
/// @param[in] _size Cube side size.
/// @param[in] _hasMips Indicates that texture contains full mip-map chain.
/// @param[in] _numLayers Number of layers in texture array. Must be 1 if caps
///    `BGFX_CAPS_TEXTURE_2D_ARRAY` flag is not set.
/// @param[in] _format Texture format. See: `TextureFormat::Enum`.
/// @param[in] _flags Texture creation (see `BGFX_TEXTURE_*`.), and sampler (see `BGFX_SAMPLER_*`)
///    flags. Default texture sampling mode is linear, and wrap mode is repeat.
///    - `BGFX_SAMPLER_[U/V/W]_[MIRROR/CLAMP]` - Mirror or clamp to edge wrap
///      mode.
///    - `BGFX_SAMPLER_[MIN/MAG/MIP]_[POINT/ANISOTROPIC]` - Point or anisotropic
///      sampling.
/// @param[in] _mem Texture data. If `_mem` is non-NULL, created texture will be immutable. If
///    `_mem` is NULL content of the texture is uninitialized. When `_numLayers` is more than
///    1, expected memory layout is texture and all mips together for each array element.
create_texture_cube :: #force_inline proc(_size: u16, _hasMips: bool, _numLayers: u16, _format: TextureFormat, _flags: u64, _mem: ^/*const*/Memory) -> TextureHandle {
	return bgfx_create_texture_cube(_size, _hasMips, _numLayers, _format, _flags, _mem)
}

/// Update 2D texture.
/// @attention It's valid to update only mutable texture. See `bgfx::createTexture2D` for more info.
///
/// @param[in] _handle Texture handle.
/// @param[in] _layer Layer in texture array.
/// @param[in] _mip Mip level.
/// @param[in] _x X offset in texture.
/// @param[in] _y Y offset in texture.
/// @param[in] _width Width of texture block.
/// @param[in] _height Height of texture block.
/// @param[in] _mem Texture update data.
/// @param[in] _pitch Pitch of input image (bytes). When _pitch is set to
///    UINT16_MAX, it will be calculated internally based on _width.
update_texture_2d :: #force_inline proc(_handle: TextureHandle, _layer: u16, _mip: u8, _x: u16, _y: u16, _width: u16, _height: u16, _mem: ^/*const*/Memory, _pitch: u16) {
	bgfx_update_texture_2d(_handle, _layer, _mip, _x, _y, _width, _height, _mem, _pitch)
}

/// Update 3D texture.
/// @attention It's valid to update only mutable texture. See `bgfx::createTexture3D` for more info.
///
/// @param[in] _handle Texture handle.
/// @param[in] _mip Mip level.
/// @param[in] _x X offset in texture.
/// @param[in] _y Y offset in texture.
/// @param[in] _z Z offset in texture.
/// @param[in] _width Width of texture block.
/// @param[in] _height Height of texture block.
/// @param[in] _depth Depth of texture block.
/// @param[in] _mem Texture update data.
update_texture_3d :: #force_inline proc(_handle: TextureHandle, _mip: u8, _x: u16, _y: u16, _z: u16, _width: u16, _height: u16, _depth: u16, _mem: ^/*const*/Memory) {
	bgfx_update_texture_3d(_handle, _mip, _x, _y, _z, _width, _height, _depth, _mem)
}

/// Update Cube texture.
/// @attention It's valid to update only mutable texture. See `bgfx::createTextureCube` for more info.
///
/// @param[in] _handle Texture handle.
/// @param[in] _layer Layer in texture array.
/// @param[in] _side Cubemap side `BGFX_CUBE_MAP_<POSITIVE or NEGATIVE>_<X, Y or Z>`,
///      where 0 is +X, 1 is -X, 2 is +Y, 3 is -Y, 4 is +Z, and 5 is -Z.
///                     +----------+
///                     |-z       2|
///                     | ^  +y    |
///                     | |        |    Unfolded cube:
///                     | +---->+x |
///          +----------+----------+----------+----------+
///          |+y       1|+y       4|+y       0|+y       5|
///          | ^  -x    | ^  +z    | ^  +x    | ^  -z    |
///          | |        | |        | |        | |        |
///          | +---->+z | +---->+x | +---->-z | +---->-x |
///          +----------+----------+----------+----------+
///                     |+z       3|
///                     | ^  -y    |
///                     | |        |
///                     | +---->+x |
///                     +----------+
/// @param[in] _mip Mip level.
/// @param[in] _x X offset in texture.
/// @param[in] _y Y offset in texture.
/// @param[in] _width Width of texture block.
/// @param[in] _height Height of texture block.
/// @param[in] _mem Texture update data.
/// @param[in] _pitch Pitch of input image (bytes). When _pitch is set to
///    UINT16_MAX, it will be calculated internally based on _width.
update_texture_cube :: #force_inline proc(_handle: TextureHandle, _layer: u16, _side: u8, _mip: u8, _x: u16, _y: u16, _width: u16, _height: u16, _mem: ^/*const*/Memory, _pitch: u16) {
	bgfx_update_texture_cube(_handle, _layer, _side, _mip, _x, _y, _width, _height, _mem, _pitch)
}

/// Read back texture content.
/// @attention Texture must be created with `BGFX_TEXTURE_READ_BACK` flag.
/// @attention Availability depends on: `BGFX_CAPS_TEXTURE_READ_BACK`.
///
/// @param[in] _handle Texture handle.
/// @param[in] _data Destination buffer.
/// @param[in] _mip Mip level.
read_texture :: #force_inline proc(_handle: TextureHandle, _data: rawptr, _mip: u8) -> u32 {
	return bgfx_read_texture(_handle, _data, _mip)
}

/// Set texture debug name.
///
/// @param[in] _handle Texture handle.
/// @param[in] _name Texture name.
/// @param[in] _len Texture name length (if length is INT32_MAX, it's expected
///    that _name is zero terminated string.
set_texture_name :: #force_inline proc(_handle: TextureHandle, _name: cstring, _len: i32) {
	bgfx_set_texture_name(_handle, _name, _len)
}

/// Returns texture direct access pointer.
/// @attention Availability depends on: `BGFX_CAPS_TEXTURE_DIRECT_ACCESS`. This feature
///   is available on GPUs that have unified memory architecture (UMA) support.
///
/// @param[in] _handle Texture handle.
get_direct_access_ptr :: #force_inline proc(_handle: TextureHandle) -> rawptr {
	return bgfx_get_direct_access_ptr(_handle)
}

/// Destroy texture.
///
/// @param[in] _handle Texture handle.
destroy_texture :: #force_inline proc(_handle: TextureHandle) {
	bgfx_destroy_texture(_handle)
}

/// Create frame buffer (simple).
///
/// @param[in] _width Texture width.
/// @param[in] _height Texture height.
/// @param[in] _format Texture format. See: `TextureFormat::Enum`.
/// @param[in] _textureFlags Texture creation (see `BGFX_TEXTURE_*`.), and sampler (see `BGFX_SAMPLER_*`)
///    flags. Default texture sampling mode is linear, and wrap mode is repeat.
///    - `BGFX_SAMPLER_[U/V/W]_[MIRROR/CLAMP]` - Mirror or clamp to edge wrap
///      mode.
///    - `BGFX_SAMPLER_[MIN/MAG/MIP]_[POINT/ANISOTROPIC]` - Point or anisotropic
///      sampling.
create_frame_buffer :: #force_inline proc(_width: u16, _height: u16, _format: TextureFormat, _textureFlags: u64) -> FrameBufferHandle {
	return bgfx_create_frame_buffer(_width, _height, _format, _textureFlags)
}

/// Create frame buffer with size based on back-buffer ratio. Frame buffer will maintain ratio
/// if back buffer resolution changes.
///
/// @param[in] _ratio Frame buffer size in respect to back-buffer size. See:
///    `BackbufferRatio::Enum`.
/// @param[in] _format Texture format. See: `TextureFormat::Enum`.
/// @param[in] _textureFlags Texture creation (see `BGFX_TEXTURE_*`.), and sampler (see `BGFX_SAMPLER_*`)
///    flags. Default texture sampling mode is linear, and wrap mode is repeat.
///    - `BGFX_SAMPLER_[U/V/W]_[MIRROR/CLAMP]` - Mirror or clamp to edge wrap
///      mode.
///    - `BGFX_SAMPLER_[MIN/MAG/MIP]_[POINT/ANISOTROPIC]` - Point or anisotropic
///      sampling.
create_frame_buffer_scaled :: #force_inline proc(_ratio: BackbufferRatio, _format: TextureFormat, _textureFlags: u64) -> FrameBufferHandle {
	return bgfx_create_frame_buffer_scaled(_ratio, _format, _textureFlags)
}

/// Create MRT frame buffer from texture handles (simple).
///
/// @param[in] _num Number of texture handles.
/// @param[in] _handles Texture attachments.
/// @param[in] _destroyTexture If true, textures will be destroyed when
///    frame buffer is destroyed.
create_frame_buffer_from_handles :: #force_inline proc(_num: u8, _handles: ^/*const*/TextureHandle, _destroyTexture: bool) -> FrameBufferHandle {
	return bgfx_create_frame_buffer_from_handles(_num, _handles, _destroyTexture)
}

/// Create MRT frame buffer from texture handles with specific layer and
/// mip level.
///
/// @param[in] _num Number of attachments.
/// @param[in] _attachment Attachment texture info. See: `bgfx::Attachment`.
/// @param[in] _destroyTexture If true, textures will be destroyed when
///    frame buffer is destroyed.
create_frame_buffer_from_attachment :: #force_inline proc(_num: u8, _attachment: ^/*const*/Attachment, _destroyTexture: bool) -> FrameBufferHandle {
	return bgfx_create_frame_buffer_from_attachment(_num, _attachment, _destroyTexture)
}

/// Create frame buffer for multiple window rendering.
/// @remarks
///   Frame buffer cannot be used for sampling.
/// @attention Availability depends on: `BGFX_CAPS_SWAP_CHAIN`.
///
/// @param[in] _nwh OS' target native window handle.
/// @param[in] _width Window back buffer width.
/// @param[in] _height Window back buffer height.
/// @param[in] _format Window back buffer color format.
/// @param[in] _depthFormat Window back buffer depth format.
create_frame_buffer_from_nwh :: #force_inline proc(_nwh: rawptr, _width: u16, _height: u16, _format: TextureFormat, _depthFormat: TextureFormat) -> FrameBufferHandle {
	return bgfx_create_frame_buffer_from_nwh(_nwh, _width, _height, _format, _depthFormat)
}

/// Set frame buffer debug name.
///
/// @param[in] _handle Frame buffer handle.
/// @param[in] _name Frame buffer name.
/// @param[in] _len Frame buffer name length (if length is INT32_MAX, it's expected
///    that _name is zero terminated string.
set_frame_buffer_name :: #force_inline proc(_handle: FrameBufferHandle, _name: cstring, _len: i32) {
	bgfx_set_frame_buffer_name(_handle, _name, _len)
}

/// Obtain texture handle of frame buffer attachment.
///
/// @param[in] _handle Frame buffer handle.
get_texture :: #force_inline proc(_handle: FrameBufferHandle, _attachment: u8) -> TextureHandle {
	return bgfx_get_texture(_handle, _attachment)
}

/// Destroy frame buffer.
///
/// @param[in] _handle Frame buffer handle.
destroy_frame_buffer :: #force_inline proc(_handle: FrameBufferHandle) {
	bgfx_destroy_frame_buffer(_handle)
}

/// Create shader uniform parameter.
/// @remarks
///   1. Uniform names are unique. It's valid to call `bgfx::createUniform`
///      multiple times with the same uniform name. The library will always
///      return the same handle, but the handle reference count will be
///      incremented. This means that the same number of `bgfx::destroyUniform`
///      must be called to properly destroy the uniform.
///   2. Predefined uniforms (declared in `bgfx_shader.sh`):
///      - `u_viewRect vec4(x, y, width, height)` - view rectangle for current
///        view, in pixels.
///      - `u_viewTexel vec4(1.0/width, 1.0/height, undef, undef)` - inverse
///        width and height
///      - `u_view mat4` - view matrix
///      - `u_invView mat4` - inverted view matrix
///      - `u_proj mat4` - projection matrix
///      - `u_invProj mat4` - inverted projection matrix
///      - `u_viewProj mat4` - concatenated view projection matrix
///      - `u_invViewProj mat4` - concatenated inverted view projection matrix
///      - `u_model mat4[BGFX_CONFIG_MAX_BONES]` - array of model matrices.
///      - `u_modelView mat4` - concatenated model view matrix, only first
///        model matrix from array is used.
///      - `u_modelViewProj mat4` - concatenated model view projection matrix.
///      - `u_alphaRef float` - alpha reference value for alpha test.
///
/// @param[in] _name Uniform name in shader.
/// @param[in] _type Type of uniform (See: `bgfx::UniformType`).
/// @param[in] _num Number of elements in array.
create_uniform :: #force_inline proc(_name: cstring, _type: UniformType, _num: u16) -> UniformHandle {
	return bgfx_create_uniform(_name, _type, _num)
}

/// Retrieve uniform info.
///
/// @param[in] _handle Handle to uniform object.
/// @param[out] _info Uniform info.
get_uniform_info :: #force_inline proc(_handle: UniformHandle, _info: ^UniformInfo) {
	bgfx_get_uniform_info(_handle, _info)
}

/// Destroy shader uniform parameter.
///
/// @param[in] _handle Handle to uniform object.
destroy_uniform :: #force_inline proc(_handle: UniformHandle) {
	bgfx_destroy_uniform(_handle)
}

/// Create occlusion query.
create_occlusion_query :: #force_inline proc() -> OcclusionQueryHandle {
	return bgfx_create_occlusion_query()
}

/// Retrieve occlusion query result from previous frame.
///
/// @param[in] _handle Handle to occlusion query object.
/// @param[out] _result Number of pixels that passed test. This argument
///    can be `NULL` if result of occlusion query is not needed.
get_result :: #force_inline proc(_handle: OcclusionQueryHandle, _result: ^i32) -> OcclusionQueryResult {
	return bgfx_get_result(_handle, _result)
}

/// Destroy occlusion query.
///
/// @param[in] _handle Handle to occlusion query object.
destroy_occlusion_query :: #force_inline proc(_handle: OcclusionQueryHandle) {
	bgfx_destroy_occlusion_query(_handle)
}

/// Set palette color value.
///
/// @param[in] _index Index into palette.
/// @param[in] _rgba RGBA floating point values.
set_palette_color :: #force_inline proc(_index: u8, _rgba: [4]/*const*/f32) {
	bgfx_set_palette_color(_index, _rgba)
}

/// Set palette color value.
///
/// @param[in] _index Index into palette.
/// @param[in] _r Red value (RGBA floating point values)
/// @param[in] _g Green value (RGBA floating point values)
/// @param[in] _b Blue value (RGBA floating point values)
/// @param[in] _a Alpha value (RGBA floating point values)
set_palette_color_rgba32f :: #force_inline proc(_index: u8, _r: f32, _g: f32, _b: f32, _a: f32) {
	bgfx_set_palette_color_rgba32f(_index, _r, _g, _b, _a)
}

/// Set palette color value.
///
/// @param[in] _index Index into palette.
/// @param[in] _rgba Packed 32-bit RGBA value.
set_palette_color_rgba8 :: #force_inline proc(_index: u8, _rgba: u32) {
	bgfx_set_palette_color_rgba8(_index, _rgba)
}

/// Set view name.
/// @remarks
///   This is debug only feature.
///   In graphics debugger view name will appear as:
///       "nnnc <view name>"
///        ^  ^ ^
///        |  +--- compute (C)
///        +------ view id
///
/// @param[in] _id View id.
/// @param[in] _name View name.
/// @param[in] _len View name length (if length is INT32_MAX, it's expected
///    that _name is zero terminated string.
set_view_name :: #force_inline proc(_id: ViewId, _name: cstring, _len: i32) {
	bgfx_set_view_name(_id, _name, _len)
}

/// Set view rectangle. Draw primitive outside view will be clipped.
///
/// @param[in] _id View id.
/// @param[in] _x Position x from the left corner of the window.
/// @param[in] _y Position y from the top corner of the window.
/// @param[in] _width Width of view port region.
/// @param[in] _height Height of view port region.
set_view_rect :: #force_inline proc(_id: ViewId, _x: u16, _y: u16, _width: u16, _height: u16) {
	bgfx_set_view_rect(_id, _x, _y, _width, _height)
}

/// Set view rectangle. Draw primitive outside view will be clipped.
///
/// @param[in] _id View id.
/// @param[in] _x Position x from the left corner of the window.
/// @param[in] _y Position y from the top corner of the window.
/// @param[in] _ratio Width and height will be set in respect to back-buffer size.
///    See: `BackbufferRatio::Enum`.
set_view_rect_ratio :: #force_inline proc(_id: ViewId, _x: u16, _y: u16, _ratio: BackbufferRatio) {
	bgfx_set_view_rect_ratio(_id, _x, _y, _ratio)
}

/// Set view scissor. Draw primitive outside view will be clipped. When
/// _x, _y, _width and _height are set to 0, scissor will be disabled.
///
/// @param[in] _id View id.
/// @param[in] _x Position x from the left corner of the window.
/// @param[in] _y Position y from the top corner of the window.
/// @param[in] _width Width of view scissor region.
/// @param[in] _height Height of view scissor region.
set_view_scissor :: #force_inline proc(_id: ViewId, _x: u16, _y: u16, _width: u16, _height: u16) {
	bgfx_set_view_scissor(_id, _x, _y, _width, _height)
}

/// Set view clear flags.
///
/// @param[in] _id View id.
/// @param[in] _flags Clear flags. Use `BGFX_CLEAR_NONE` to remove any clear
///    operation. See: `BGFX_CLEAR_*`.
/// @param[in] _rgba Color clear value.
/// @param[in] _depth Depth clear value.
/// @param[in] _stencil Stencil clear value.
set_view_clear :: #force_inline proc(_id: ViewId, _flags: u16, _rgba: u32, _depth: f32, _stencil: u8) {
	bgfx_set_view_clear(_id, _flags, _rgba, _depth, _stencil)
}

/// Set view clear flags with different clear color for each
/// frame buffer texture. `bgfx::setPaletteColor` must be used to set up a
/// clear color palette.
///
/// @param[in] _id View id.
/// @param[in] _flags Clear flags. Use `BGFX_CLEAR_NONE` to remove any clear
///    operation. See: `BGFX_CLEAR_*`.
/// @param[in] _depth Depth clear value.
/// @param[in] _stencil Stencil clear value.
/// @param[in] _c0 Palette index for frame buffer attachment 0.
/// @param[in] _c1 Palette index for frame buffer attachment 1.
/// @param[in] _c2 Palette index for frame buffer attachment 2.
/// @param[in] _c3 Palette index for frame buffer attachment 3.
/// @param[in] _c4 Palette index for frame buffer attachment 4.
/// @param[in] _c5 Palette index for frame buffer attachment 5.
/// @param[in] _c6 Palette index for frame buffer attachment 6.
/// @param[in] _c7 Palette index for frame buffer attachment 7.
set_view_clear_mrt :: #force_inline proc(_id: ViewId, _flags: u16, _depth: f32, _stencil: u8, _c0: u8, _c1: u8, _c2: u8, _c3: u8, _c4: u8, _c5: u8, _c6: u8, _c7: u8) {
	bgfx_set_view_clear_mrt(_id, _flags, _depth, _stencil, _c0, _c1, _c2, _c3, _c4, _c5, _c6, _c7)
}

/// Set view sorting mode.
/// @remarks
///   View mode must be set prior calling `bgfx::submit` for the view.
///
/// @param[in] _id View id.
/// @param[in] _mode View sort mode. See `ViewMode::Enum`.
set_view_mode :: #force_inline proc(_id: ViewId, _mode: ViewMode) {
	bgfx_set_view_mode(_id, _mode)
}

/// Set view frame buffer.
/// @remarks
///   Not persistent after `bgfx::reset` call.
///
/// @param[in] _id View id.
/// @param[in] _handle Frame buffer handle. Passing `BGFX_INVALID_HANDLE` as
///    frame buffer handle will draw primitives from this view into
///    default back buffer.
set_view_frame_buffer :: #force_inline proc(_id: ViewId, _handle: FrameBufferHandle) {
	bgfx_set_view_frame_buffer(_id, _handle)
}

/// Set view's view matrix and projection matrix,
/// all draw primitives in this view will use these two matrices.
///
/// @param[in] _id View id.
/// @param[in] _view View matrix.
/// @param[in] _proj Projection matrix.
set_view_transform :: #force_inline proc(_id: ViewId, _view: /*const*/rawptr, _proj: /*const*/rawptr) {
	bgfx_set_view_transform(_id, _view, _proj)
}

/// Post submit view reordering.
///
/// @param[in] _id First view id.
/// @param[in] _num Number of views to remap.
/// @param[in] _order View remap id table. Passing `NULL` will reset view ids
///    to default state.
set_view_order :: #force_inline proc(_id: ViewId, _num: u16, _order: ^/*const*/ViewId) {
	bgfx_set_view_order(_id, _num, _order)
}

/// Reset all view settings to default.
reset_view :: #force_inline proc(_id: ViewId) {
	bgfx_reset_view(_id)
}

/// Begin submitting draw calls from thread.
///
/// @param[in] _forThread Explicitly request an encoder for a worker thread.
encoder_begin :: #force_inline proc(_forThread: bool) -> ^Encoder {
	return bgfx_encoder_begin(_forThread)
}

/// End submitting draw calls from thread.
///
/// @param[in] _encoder Encoder.
encoder_end :: #force_inline proc(_encoder: ^Encoder) {
	bgfx_encoder_end(_encoder)
}

/// Sets a debug marker. This allows you to group graphics calls together for easy browsing in
/// graphics debugging tools.
///
/// @param[in] _name Marker name.
/// @param[in] _len Marker name length (if length is INT32_MAX, it's expected
///    that _name is zero terminated string.
encoder_set_marker :: #force_inline proc(_this: ^Encoder, _name: cstring, _len: i32) {
	bgfx_encoder_set_marker(_this, _name, _len)
}

/// Set render states for draw primitive.
/// @remarks
///   1. To set up more complex states use:
///      `BGFX_STATE_ALPHA_REF(_ref)`,
///      `BGFX_STATE_POINT_SIZE(_size)`,
///      `BGFX_STATE_BLEND_FUNC(_src, _dst)`,
///      `BGFX_STATE_BLEND_FUNC_SEPARATE(_srcRGB, _dstRGB, _srcA, _dstA)`,
///      `BGFX_STATE_BLEND_EQUATION(_equation)`,
///      `BGFX_STATE_BLEND_EQUATION_SEPARATE(_equationRGB, _equationA)`
///   2. `BGFX_STATE_BLEND_EQUATION_ADD` is set when no other blend
///      equation is specified.
///
/// @param[in] _state State flags. Default state for primitive type is
///      triangles. See: `BGFX_STATE_DEFAULT`.
///      - `BGFX_STATE_DEPTH_TEST_*` - Depth test function.
///      - `BGFX_STATE_BLEND_*` - See remark 1 about BGFX_STATE_BLEND_FUNC.
///      - `BGFX_STATE_BLEND_EQUATION_*` - See remark 2.
///      - `BGFX_STATE_CULL_*` - Backface culling mode.
///      - `BGFX_STATE_WRITE_*` - Enable R, G, B, A or Z write.
///      - `BGFX_STATE_MSAA` - Enable hardware multisample antialiasing.
///      - `BGFX_STATE_PT_[TRISTRIP/LINES/POINTS]` - Primitive type.
/// @param[in] _rgba Sets blend factor used by `BGFX_STATE_BLEND_FACTOR` and
///      `BGFX_STATE_BLEND_INV_FACTOR` blend modes.
encoder_set_state :: #force_inline proc(_this: ^Encoder, _state: u64, _rgba: u32) {
	bgfx_encoder_set_state(_this, _state, _rgba)
}

/// Set condition for rendering.
///
/// @param[in] _handle Occlusion query handle.
/// @param[in] _visible Render if occlusion query is visible.
encoder_set_condition :: #force_inline proc(_this: ^Encoder, _handle: OcclusionQueryHandle, _visible: bool) {
	bgfx_encoder_set_condition(_this, _handle, _visible)
}

/// Set stencil test state.
///
/// @param[in] _fstencil Front stencil state.
/// @param[in] _bstencil Back stencil state. If back is set to `BGFX_STENCIL_NONE`
///    _fstencil is applied to both front and back facing primitives.
encoder_set_stencil :: #force_inline proc(_this: ^Encoder, _fstencil: u32, _bstencil: u32) {
	bgfx_encoder_set_stencil(_this, _fstencil, _bstencil)
}

/// Set scissor for draw primitive.
/// @remark
///   To scissor for all primitives in view see `bgfx::setViewScissor`.
///
/// @param[in] _x Position x from the left corner of the window.
/// @param[in] _y Position y from the top corner of the window.
/// @param[in] _width Width of view scissor region.
/// @param[in] _height Height of view scissor region.
encoder_set_scissor :: #force_inline proc(_this: ^Encoder, _x: u16, _y: u16, _width: u16, _height: u16) -> u16 {
	return bgfx_encoder_set_scissor(_this, _x, _y, _width, _height)
}

/// Set scissor from cache for draw primitive.
/// @remark
///   To scissor for all primitives in view see `bgfx::setViewScissor`.
///
/// @param[in] _cache Index in scissor cache.
encoder_set_scissor_cached :: #force_inline proc(_this: ^Encoder, _cache: u16) {
	bgfx_encoder_set_scissor_cached(_this, _cache)
}

/// Set model matrix for draw primitive. If it is not called,
/// the model will be rendered with an identity model matrix.
///
/// @param[in] _mtx Pointer to first matrix in array.
/// @param[in] _num Number of matrices in array.
encoder_set_transform :: #force_inline proc(_this: ^Encoder, _mtx: /*const*/rawptr, _num: u16) -> u32 {
	return bgfx_encoder_set_transform(_this, _mtx, _num)
}

///  Set model matrix from matrix cache for draw primitive.
///
/// @param[in] _cache Index in matrix cache.
/// @param[in] _num Number of matrices from cache.
encoder_set_transform_cached :: #force_inline proc(_this: ^Encoder, _cache: u32, _num: u16) {
	bgfx_encoder_set_transform_cached(_this, _cache, _num)
}

/// Reserve matrices in internal matrix cache.
/// @attention Pointer returned can be modified until `bgfx::frame` is called.
///
/// @param[out] _transform Pointer to `Transform` structure.
/// @param[in] _num Number of matrices.
encoder_alloc_transform :: #force_inline proc(_this: ^Encoder, _transform: ^Transform, _num: u16) -> u32 {
	return bgfx_encoder_alloc_transform(_this, _transform, _num)
}

/// Set shader uniform parameter for draw primitive.
///
/// @param[in] _handle Uniform.
/// @param[in] _value Pointer to uniform data.
/// @param[in] _num Number of elements. Passing `UINT16_MAX` will
///    use the _num passed on uniform creation.
encoder_set_uniform :: #force_inline proc(_this: ^Encoder, _handle: UniformHandle, _value: /*const*/rawptr, _num: u16) {
	bgfx_encoder_set_uniform(_this, _handle, _value, _num)
}

/// Set index buffer for draw primitive.
///
/// @param[in] _handle Index buffer.
/// @param[in] _firstIndex First index to render.
/// @param[in] _numIndices Number of indices to render.
encoder_set_index_buffer :: #force_inline proc(_this: ^Encoder, _handle: IndexBufferHandle, _firstIndex: u32, _numIndices: u32) {
	bgfx_encoder_set_index_buffer(_this, _handle, _firstIndex, _numIndices)
}

/// Set index buffer for draw primitive.
///
/// @param[in] _handle Dynamic index buffer.
/// @param[in] _firstIndex First index to render.
/// @param[in] _numIndices Number of indices to render.
encoder_set_dynamic_index_buffer :: #force_inline proc(_this: ^Encoder, _handle: DynamicIndexBufferHandle, _firstIndex: u32, _numIndices: u32) {
	bgfx_encoder_set_dynamic_index_buffer(_this, _handle, _firstIndex, _numIndices)
}

/// Set index buffer for draw primitive.
///
/// @param[in] _tib Transient index buffer.
/// @param[in] _firstIndex First index to render.
/// @param[in] _numIndices Number of indices to render.
encoder_set_transient_index_buffer :: #force_inline proc(_this: ^Encoder, _tib: ^/*const*/TransientIndexBuffer, _firstIndex: u32, _numIndices: u32) {
	bgfx_encoder_set_transient_index_buffer(_this, _tib, _firstIndex, _numIndices)
}

/// Set vertex buffer for draw primitive.
///
/// @param[in] _stream Vertex stream.
/// @param[in] _handle Vertex buffer.
/// @param[in] _startVertex First vertex to render.
/// @param[in] _numVertices Number of vertices to render.
encoder_set_vertex_buffer :: #force_inline proc(_this: ^Encoder, _stream: u8, _handle: VertexBufferHandle, _startVertex: u32, _numVertices: u32) {
	bgfx_encoder_set_vertex_buffer(_this, _stream, _handle, _startVertex, _numVertices)
}

/// Set vertex buffer for draw primitive.
///
/// @param[in] _stream Vertex stream.
/// @param[in] _handle Vertex buffer.
/// @param[in] _startVertex First vertex to render.
/// @param[in] _numVertices Number of vertices to render.
/// @param[in] _layoutHandle Vertex layout for aliasing vertex buffer. If invalid
///    handle is used, vertex layout used for creation
///    of vertex buffer will be used.
encoder_set_vertex_buffer_with_layout :: #force_inline proc(_this: ^Encoder, _stream: u8, _handle: VertexBufferHandle, _startVertex: u32, _numVertices: u32, _layoutHandle: VertexLayoutHandle) {
	bgfx_encoder_set_vertex_buffer_with_layout(_this, _stream, _handle, _startVertex, _numVertices, _layoutHandle)
}

/// Set vertex buffer for draw primitive.
///
/// @param[in] _stream Vertex stream.
/// @param[in] _handle Dynamic vertex buffer.
/// @param[in] _startVertex First vertex to render.
/// @param[in] _numVertices Number of vertices to render.
encoder_set_dynamic_vertex_buffer :: #force_inline proc(_this: ^Encoder, _stream: u8, _handle: DynamicVertexBufferHandle, _startVertex: u32, _numVertices: u32) {
	bgfx_encoder_set_dynamic_vertex_buffer(_this, _stream, _handle, _startVertex, _numVertices)
}

encoder_set_dynamic_vertex_buffer_with_layout :: #force_inline proc(_this: ^Encoder, _stream: u8, _handle: DynamicVertexBufferHandle, _startVertex: u32, _numVertices: u32, _layoutHandle: VertexLayoutHandle) {
	bgfx_encoder_set_dynamic_vertex_buffer_with_layout(_this, _stream, _handle, _startVertex, _numVertices, _layoutHandle)
}

/// Set vertex buffer for draw primitive.
///
/// @param[in] _stream Vertex stream.
/// @param[in] _tvb Transient vertex buffer.
/// @param[in] _startVertex First vertex to render.
/// @param[in] _numVertices Number of vertices to render.
encoder_set_transient_vertex_buffer :: #force_inline proc(_this: ^Encoder, _stream: u8, _tvb: ^/*const*/TransientVertexBuffer, _startVertex: u32, _numVertices: u32) {
	bgfx_encoder_set_transient_vertex_buffer(_this, _stream, _tvb, _startVertex, _numVertices)
}

/// Set vertex buffer for draw primitive.
///
/// @param[in] _stream Vertex stream.
/// @param[in] _tvb Transient vertex buffer.
/// @param[in] _startVertex First vertex to render.
/// @param[in] _numVertices Number of vertices to render.
/// @param[in] _layoutHandle Vertex layout for aliasing vertex buffer. If invalid
///    handle is used, vertex layout used for creation
///    of vertex buffer will be used.
encoder_set_transient_vertex_buffer_with_layout :: #force_inline proc(_this: ^Encoder, _stream: u8, _tvb: ^/*const*/TransientVertexBuffer, _startVertex: u32, _numVertices: u32, _layoutHandle: VertexLayoutHandle) {
	bgfx_encoder_set_transient_vertex_buffer_with_layout(_this, _stream, _tvb, _startVertex, _numVertices, _layoutHandle)
}

/// Set number of vertices for auto generated vertices use in conjunction
/// with gl_VertexID.
/// @attention Availability depends on: `BGFX_CAPS_VERTEX_ID`.
///
/// @param[in] _numVertices Number of vertices.
encoder_set_vertex_count :: #force_inline proc(_this: ^Encoder, _numVertices: u32) {
	bgfx_encoder_set_vertex_count(_this, _numVertices)
}

/// Set instance data buffer for draw primitive.
///
/// @param[in] _idb Transient instance data buffer.
/// @param[in] _start First instance data.
/// @param[in] _num Number of data instances.
encoder_set_instance_data_buffer :: #force_inline proc(_this: ^Encoder, _idb: ^/*const*/InstanceDataBuffer, _start: u32, _num: u32) {
	bgfx_encoder_set_instance_data_buffer(_this, _idb, _start, _num)
}

/// Set instance data buffer for draw primitive.
///
/// @param[in] _handle Vertex buffer.
/// @param[in] _startVertex First instance data.
/// @param[in] _num Number of data instances.
encoder_set_instance_data_from_vertex_buffer :: #force_inline proc(_this: ^Encoder, _handle: VertexBufferHandle, _startVertex: u32, _num: u32) {
	bgfx_encoder_set_instance_data_from_vertex_buffer(_this, _handle, _startVertex, _num)
}

/// Set instance data buffer for draw primitive.
///
/// @param[in] _handle Dynamic vertex buffer.
/// @param[in] _startVertex First instance data.
/// @param[in] _num Number of data instances.
encoder_set_instance_data_from_dynamic_vertex_buffer :: #force_inline proc(_this: ^Encoder, _handle: DynamicVertexBufferHandle, _startVertex: u32, _num: u32) {
	bgfx_encoder_set_instance_data_from_dynamic_vertex_buffer(_this, _handle, _startVertex, _num)
}

/// Set number of instances for auto generated instances use in conjunction
/// with gl_InstanceID.
/// @attention Availability depends on: `BGFX_CAPS_VERTEX_ID`.
encoder_set_instance_count :: #force_inline proc(_this: ^Encoder, _numInstances: u32) {
	bgfx_encoder_set_instance_count(_this, _numInstances)
}

/// Set texture stage for draw primitive.
///
/// @param[in] _stage Texture unit.
/// @param[in] _sampler Program sampler.
/// @param[in] _handle Texture handle.
/// @param[in] _flags Texture sampling mode. Default value UINT32_MAX uses
///      texture sampling settings from the texture.
///      - `BGFX_SAMPLER_[U/V/W]_[MIRROR/CLAMP]` - Mirror or clamp to edge wrap
///        mode.
///      - `BGFX_SAMPLER_[MIN/MAG/MIP]_[POINT/ANISOTROPIC]` - Point or anisotropic
///        sampling.
encoder_set_texture :: #force_inline proc(_this: ^Encoder, _stage: u8, _sampler: UniformHandle, _handle: TextureHandle, _flags: u32) {
	bgfx_encoder_set_texture(_this, _stage, _sampler, _handle, _flags)
}

/// Submit an empty primitive for rendering. Uniforms and draw state
/// will be applied but no geometry will be submitted. Useful in cases
/// when no other draw/compute primitive is submitted to view, but it's
/// desired to execute clear view.
/// @remark
///   These empty draw calls will sort before ordinary draw calls.
///
/// @param[in] _id View id.
encoder_touch :: #force_inline proc(_this: ^Encoder, _id: ViewId) {
	bgfx_encoder_touch(_this, _id)
}

/// Submit primitive for rendering.
///
/// @param[in] _id View id.
/// @param[in] _program Program.
/// @param[in] _depth Depth for sorting.
/// @param[in] _flags Discard or preserve states. See `BGFX_DISCARD_*`.
encoder_submit :: #force_inline proc(_this: ^Encoder, _id: ViewId, _program: ProgramHandle, _depth: u32, _flags: u8) {
	bgfx_encoder_submit(_this, _id, _program, _depth, _flags)
}

/// Submit primitive with occlusion query for rendering.
///
/// @param[in] _id View id.
/// @param[in] _program Program.
/// @param[in] _occlusionQuery Occlusion query.
/// @param[in] _depth Depth for sorting.
/// @param[in] _flags Discard or preserve states. See `BGFX_DISCARD_*`.
encoder_submit_occlusion_query :: #force_inline proc(_this: ^Encoder, _id: ViewId, _program: ProgramHandle, _occlusionQuery: OcclusionQueryHandle, _depth: u32, _flags: u8) {
	bgfx_encoder_submit_occlusion_query(_this, _id, _program, _occlusionQuery, _depth, _flags)
}

/// Submit primitive for rendering with index and instance data info from
/// indirect buffer.
/// @attention Availability depends on: `BGFX_CAPS_DRAW_INDIRECT`.
///
/// @param[in] _id View id.
/// @param[in] _program Program.
/// @param[in] _indirectHandle Indirect buffer.
/// @param[in] _start First element in indirect buffer.
/// @param[in] _num Number of draws.
/// @param[in] _depth Depth for sorting.
/// @param[in] _flags Discard or preserve states. See `BGFX_DISCARD_*`.
encoder_submit_indirect :: #force_inline proc(_this: ^Encoder, _id: ViewId, _program: ProgramHandle, _indirectHandle: IndirectBufferHandle, _start: u32, _num: u32, _depth: u32, _flags: u8) {
	bgfx_encoder_submit_indirect(_this, _id, _program, _indirectHandle, _start, _num, _depth, _flags)
}

/// Submit primitive for rendering with index and instance data info and
/// draw count from indirect buffers.
/// @attention Availability depends on: `BGFX_CAPS_DRAW_INDIRECT_COUNT`.
///
/// @param[in] _id View id.
/// @param[in] _program Program.
/// @param[in] _indirectHandle Indirect buffer.
/// @param[in] _start First element in indirect buffer.
/// @param[in] _numHandle Buffer for number of draws. Must be
///      created with `BGFX_BUFFER_INDEX32` and `BGFX_BUFFER_DRAW_INDIRECT`.
/// @param[in] _numIndex Element in number buffer.
/// @param[in] _numMax Max number of draws.
/// @param[in] _depth Depth for sorting.
/// @param[in] _flags Discard or preserve states. See `BGFX_DISCARD_*`.
encoder_submit_indirect_count :: #force_inline proc(_this: ^Encoder, _id: ViewId, _program: ProgramHandle, _indirectHandle: IndirectBufferHandle, _start: u32, _numHandle: IndexBufferHandle, _numIndex: u32, _numMax: u32, _depth: u32, _flags: u8) {
	bgfx_encoder_submit_indirect_count(_this, _id, _program, _indirectHandle, _start, _numHandle, _numIndex, _numMax, _depth, _flags)
}

/// Set compute index buffer.
///
/// @param[in] _stage Compute stage.
/// @param[in] _handle Index buffer handle.
/// @param[in] _access Buffer access. See `Access::Enum`.
encoder_set_compute_index_buffer :: #force_inline proc(_this: ^Encoder, _stage: u8, _handle: IndexBufferHandle, _access: Access) {
	bgfx_encoder_set_compute_index_buffer(_this, _stage, _handle, _access)
}

/// Set compute vertex buffer.
///
/// @param[in] _stage Compute stage.
/// @param[in] _handle Vertex buffer handle.
/// @param[in] _access Buffer access. See `Access::Enum`.
encoder_set_compute_vertex_buffer :: #force_inline proc(_this: ^Encoder, _stage: u8, _handle: VertexBufferHandle, _access: Access) {
	bgfx_encoder_set_compute_vertex_buffer(_this, _stage, _handle, _access)
}

/// Set compute dynamic index buffer.
///
/// @param[in] _stage Compute stage.
/// @param[in] _handle Dynamic index buffer handle.
/// @param[in] _access Buffer access. See `Access::Enum`.
encoder_set_compute_dynamic_index_buffer :: #force_inline proc(_this: ^Encoder, _stage: u8, _handle: DynamicIndexBufferHandle, _access: Access) {
	bgfx_encoder_set_compute_dynamic_index_buffer(_this, _stage, _handle, _access)
}

/// Set compute dynamic vertex buffer.
///
/// @param[in] _stage Compute stage.
/// @param[in] _handle Dynamic vertex buffer handle.
/// @param[in] _access Buffer access. See `Access::Enum`.
encoder_set_compute_dynamic_vertex_buffer :: #force_inline proc(_this: ^Encoder, _stage: u8, _handle: DynamicVertexBufferHandle, _access: Access) {
	bgfx_encoder_set_compute_dynamic_vertex_buffer(_this, _stage, _handle, _access)
}

/// Set compute indirect buffer.
///
/// @param[in] _stage Compute stage.
/// @param[in] _handle Indirect buffer handle.
/// @param[in] _access Buffer access. See `Access::Enum`.
encoder_set_compute_indirect_buffer :: #force_inline proc(_this: ^Encoder, _stage: u8, _handle: IndirectBufferHandle, _access: Access) {
	bgfx_encoder_set_compute_indirect_buffer(_this, _stage, _handle, _access)
}

/// Set compute image from texture.
///
/// @param[in] _stage Compute stage.
/// @param[in] _handle Texture handle.
/// @param[in] _mip Mip level.
/// @param[in] _access Image access. See `Access::Enum`.
/// @param[in] _format Texture format. See: `TextureFormat::Enum`.
encoder_set_image :: #force_inline proc(_this: ^Encoder, _stage: u8, _handle: TextureHandle, _mip: u8, _access: Access, _format: TextureFormat) {
	bgfx_encoder_set_image(_this, _stage, _handle, _mip, _access, _format)
}

/// Dispatch compute.
///
/// @param[in] _id View id.
/// @param[in] _program Compute program.
/// @param[in] _numX Number of groups X.
/// @param[in] _numY Number of groups Y.
/// @param[in] _numZ Number of groups Z.
/// @param[in] _flags Discard or preserve states. See `BGFX_DISCARD_*`.
encoder_dispatch :: #force_inline proc(_this: ^Encoder, _id: ViewId, _program: ProgramHandle, _numX: u32, _numY: u32, _numZ: u32, _flags: u8) {
	bgfx_encoder_dispatch(_this, _id, _program, _numX, _numY, _numZ, _flags)
}

/// Dispatch compute indirect.
///
/// @param[in] _id View id.
/// @param[in] _program Compute program.
/// @param[in] _indirectHandle Indirect buffer.
/// @param[in] _start First element in indirect buffer.
/// @param[in] _num Number of dispatches.
/// @param[in] _flags Discard or preserve states. See `BGFX_DISCARD_*`.
encoder_dispatch_indirect :: #force_inline proc(_this: ^Encoder, _id: ViewId, _program: ProgramHandle, _indirectHandle: IndirectBufferHandle, _start: u32, _num: u32, _flags: u8) {
	bgfx_encoder_dispatch_indirect(_this, _id, _program, _indirectHandle, _start, _num, _flags)
}

/// Discard previously set state for draw or compute call.
///
/// @param[in] _flags Discard or preserve states. See `BGFX_DISCARD_*`.
encoder_discard :: #force_inline proc(_this: ^Encoder, _flags: u8) {
	bgfx_encoder_discard(_this, _flags)
}

/// Blit 2D texture region between two 2D textures.
/// @attention Destination texture must be created with `BGFX_TEXTURE_BLIT_DST` flag.
/// @attention Availability depends on: `BGFX_CAPS_TEXTURE_BLIT`.
///
/// @param[in] _id View id.
/// @param[in] _dst Destination texture handle.
/// @param[in] _dstMip Destination texture mip level.
/// @param[in] _dstX Destination texture X position.
/// @param[in] _dstY Destination texture Y position.
/// @param[in] _dstZ If texture is 2D this argument should be 0. If destination texture is cube
///    this argument represents destination texture cube face. For 3D texture this argument
///    represents destination texture Z position.
/// @param[in] _src Source texture handle.
/// @param[in] _srcMip Source texture mip level.
/// @param[in] _srcX Source texture X position.
/// @param[in] _srcY Source texture Y position.
/// @param[in] _srcZ If texture is 2D this argument should be 0. If source texture is cube
///    this argument represents source texture cube face. For 3D texture this argument
///    represents source texture Z position.
/// @param[in] _width Width of region.
/// @param[in] _height Height of region.
/// @param[in] _depth If texture is 3D this argument represents depth of region, otherwise it's
///    unused.
encoder_blit :: #force_inline proc(_this: ^Encoder, _id: ViewId, _dst: TextureHandle, _dstMip: u8, _dstX: u16, _dstY: u16, _dstZ: u16, _src: TextureHandle, _srcMip: u8, _srcX: u16, _srcY: u16, _srcZ: u16, _width: u16, _height: u16, _depth: u16) {
	bgfx_encoder_blit(_this, _id, _dst, _dstMip, _dstX, _dstY, _dstZ, _src, _srcMip, _srcX, _srcY, _srcZ, _width, _height, _depth)
}

/// Request screen shot of window back buffer.
/// @remarks
///   `bgfx::CallbackI::screenShot` must be implemented.
/// @attention Frame buffer handle must be created with OS' target native window handle.
///
/// @param[in] _handle Frame buffer handle. If handle is `BGFX_INVALID_HANDLE` request will be
///    made for main window back buffer.
/// @param[in] _filePath Will be passed to `bgfx::CallbackI::screenShot` callback.
request_screen_shot :: #force_inline proc(_handle: FrameBufferHandle, _filePath: cstring) {
	bgfx_request_screen_shot(_handle, _filePath)
}

/// Render frame.
/// @attention `bgfx::renderFrame` is blocking call. It waits for
///   `bgfx::frame` to be called from API thread to process frame.
///   If timeout value is passed call will timeout and return even
///   if `bgfx::frame` is not called.
/// @warning This call should be only used on platforms that don't
///   allow creating separate rendering thread. If it is called before
///   to bgfx::init, render thread won't be created by bgfx::init call.
///
/// @param[in] _msecs Timeout in milliseconds.
render_frame :: #force_inline proc(_msecs: i32) -> RenderFrame {
	return bgfx_render_frame(_msecs)
}

/// Set platform data.
/// @warning Must be called before `bgfx::init`.
///
/// @param[in] _data Platform data.
set_platform_data :: #force_inline proc(_data: ^/*const*/PlatformData ) {
	bgfx_set_platform_data(_data)
}

/// Get internal data for interop.
/// @attention It's expected you understand some bgfx internals before you
///   use this call.
/// @warning Must be called only on render thread.
get_internal_data :: #force_inline proc() -> ^/*const*/InternalData {
	return bgfx_get_internal_data()
}

/// Override internal texture with externally created texture. Previously
/// created internal texture will released.
/// @attention It's expected you understand some bgfx internals before you
///   use this call.
/// @warning Must be called only on render thread.
///
/// @param[in] _handle Texture handle.
/// @param[in] _ptr Native API pointer to texture.
override_internal_texture_ptr :: #force_inline proc(_handle: TextureHandle, _ptr: uintptr) -> uintptr {
	return bgfx_override_internal_texture_ptr(_handle, _ptr)
}

/// Override internal texture by creating new texture. Previously created
/// internal texture will released.
/// @attention It's expected you understand some bgfx internals before you
///   use this call.
/// @returns Native API pointer to texture. If result is 0, texture is not created yet from the
///   main thread.
/// @warning Must be called only on render thread.
///
/// @param[in] _handle Texture handle.
/// @param[in] _width Width.
/// @param[in] _height Height.
/// @param[in] _numMips Number of mip-maps.
/// @param[in] _format Texture format. See: `TextureFormat::Enum`.
/// @param[in] _flags Texture creation (see `BGFX_TEXTURE_*`.), and sampler (see `BGFX_SAMPLER_*`)
///    flags. Default texture sampling mode is linear, and wrap mode is repeat.
///    - `BGFX_SAMPLER_[U/V/W]_[MIRROR/CLAMP]` - Mirror or clamp to edge wrap
///      mode.
///    - `BGFX_SAMPLER_[MIN/MAG/MIP]_[POINT/ANISOTROPIC]` - Point or anisotropic
///      sampling.
override_internal_texture :: #force_inline proc(_handle: TextureHandle, _width: u16, _height: u16, _numMips: u8, _format: TextureFormat, _flags: u64) -> uintptr {
	return bgfx_override_internal_texture(_handle, _width, _height, _numMips, _format, _flags)
}

/// Sets a debug marker. This allows you to group graphics calls together for easy browsing in
/// graphics debugging tools.
///
/// @param[in] _name Marker name.
/// @param[in] _len Marker name length (if length is INT32_MAX, it's expected
///    that _name is zero terminated string.
set_marker :: #force_inline proc(_name: cstring, _len: i32) {
	bgfx_set_marker(_name, _len)
}

/// Set render states for draw primitive.
/// @remarks
///   1. To set up more complex states use:
///      `BGFX_STATE_ALPHA_REF(_ref)`,
///      `BGFX_STATE_POINT_SIZE(_size)`,
///      `BGFX_STATE_BLEND_FUNC(_src, _dst)`,
///      `BGFX_STATE_BLEND_FUNC_SEPARATE(_srcRGB, _dstRGB, _srcA, _dstA)`,
///      `BGFX_STATE_BLEND_EQUATION(_equation)`,
///      `BGFX_STATE_BLEND_EQUATION_SEPARATE(_equationRGB, _equationA)`
///   2. `BGFX_STATE_BLEND_EQUATION_ADD` is set when no other blend
///      equation is specified.
///
/// @param[in] _state State flags. Default state for primitive type is
///      triangles. See: `BGFX_STATE_DEFAULT`.
///      - `BGFX_STATE_DEPTH_TEST_*` - Depth test function.
///      - `BGFX_STATE_BLEND_*` - See remark 1 about BGFX_STATE_BLEND_FUNC.
///      - `BGFX_STATE_BLEND_EQUATION_*` - See remark 2.
///      - `BGFX_STATE_CULL_*` - Backface culling mode.
///      - `BGFX_STATE_WRITE_*` - Enable R, G, B, A or Z write.
///      - `BGFX_STATE_MSAA` - Enable hardware multisample antialiasing.
///      - `BGFX_STATE_PT_[TRISTRIP/LINES/POINTS]` - Primitive type.
/// @param[in] _rgba Sets blend factor used by `BGFX_STATE_BLEND_FACTOR` and
///      `BGFX_STATE_BLEND_INV_FACTOR` blend modes.
set_state :: #force_inline proc(_state: u64, _rgba: u32) {
	bgfx_set_state(_state, _rgba)
}

/// Set condition for rendering.
///
/// @param[in] _handle Occlusion query handle.
/// @param[in] _visible Render if occlusion query is visible.
set_condition :: #force_inline proc(_handle: OcclusionQueryHandle, _visible: bool) {
	bgfx_set_condition(_handle, _visible)
}

/// Set stencil test state.
///
/// @param[in] _fstencil Front stencil state.
/// @param[in] _bstencil Back stencil state. If back is set to `BGFX_STENCIL_NONE`
///    _fstencil is applied to both front and back facing primitives.
set_stencil :: #force_inline proc(_fstencil: u32, _bstencil: u32) {
	bgfx_set_stencil(_fstencil, _bstencil)
}

/// Set scissor for draw primitive.
/// @remark
///   To scissor for all primitives in view see `bgfx::setViewScissor`.
///
/// @param[in] _x Position x from the left corner of the window.
/// @param[in] _y Position y from the top corner of the window.
/// @param[in] _width Width of view scissor region.
/// @param[in] _height Height of view scissor region.
set_scissor :: #force_inline proc(_x: u16, _y: u16, _width: u16, _height: u16) -> u16 {
	return bgfx_set_scissor(_x, _y, _width, _height)
}

/// Set scissor from cache for draw primitive.
/// @remark
///   To scissor for all primitives in view see `bgfx::setViewScissor`.
///
/// @param[in] _cache Index in scissor cache.
set_scissor_cached :: #force_inline proc(_cache: u16) {
	bgfx_set_scissor_cached(_cache)
}

/// Set model matrix for draw primitive. If it is not called,
/// the model will be rendered with an identity model matrix.
///
/// @param[in] _mtx Pointer to first matrix in array.
/// @param[in] _num Number of matrices in array.
set_transform :: #force_inline proc(_mtx: /*const*/rawptr, _num: u16) -> u32 {
	return bgfx_set_transform(_mtx, _num)
}

///  Set model matrix from matrix cache for draw primitive.
///
/// @param[in] _cache Index in matrix cache.
/// @param[in] _num Number of matrices from cache.
set_transform_cached :: #force_inline proc(_cache: u32, _num: u16) {
	bgfx_set_transform_cached(_cache, _num)
}

/// Reserve matrices in internal matrix cache.
/// @attention Pointer returned can be modified until `bgfx::frame` is called.
///
/// @param[out] _transform Pointer to `Transform` structure.
/// @param[in] _num Number of matrices.
alloc_transform :: #force_inline proc(_transform: ^Transform, _num: u16) -> u32 {
	return bgfx_alloc_transform(_transform, _num)
}

/// Set shader uniform parameter for draw primitive.
///
/// @param[in] _handle Uniform.
/// @param[in] _value Pointer to uniform data.
/// @param[in] _num Number of elements. Passing `UINT16_MAX` will
///    use the _num passed on uniform creation.
set_uniform :: #force_inline proc(_handle: UniformHandle, _value: /*const*/rawptr, _num: u16) {
	bgfx_set_uniform(_handle, _value, _num)
}

/// Set index buffer for draw primitive.
///
/// @param[in] _handle Index buffer.
/// @param[in] _firstIndex First index to render.
/// @param[in] _numIndices Number of indices to render.
set_index_buffer :: #force_inline proc(_handle: IndexBufferHandle, _firstIndex: u32, _numIndices: u32) {
	bgfx_set_index_buffer(_handle, _firstIndex, _numIndices)
}

/// Set index buffer for draw primitive.
///
/// @param[in] _handle Dynamic index buffer.
/// @param[in] _firstIndex First index to render.
/// @param[in] _numIndices Number of indices to render.
set_dynamic_index_buffer :: #force_inline proc(_handle: DynamicIndexBufferHandle, _firstIndex: u32, _numIndices: u32) {
	bgfx_set_dynamic_index_buffer(_handle, _firstIndex, _numIndices)
}

/// Set index buffer for draw primitive.
///
/// @param[in] _tib Transient index buffer.
/// @param[in] _firstIndex First index to render.
/// @param[in] _numIndices Number of indices to render.
set_transient_index_buffer :: #force_inline proc(_tib: ^/*const*/TransientIndexBuffer, _firstIndex: u32, _numIndices: u32) {
	bgfx_set_transient_index_buffer(_tib, _firstIndex, _numIndices)
}

/// Set vertex buffer for draw primitive.
///
/// @param[in] _stream Vertex stream.
/// @param[in] _handle Vertex buffer.
/// @param[in] _startVertex First vertex to render.
/// @param[in] _numVertices Number of vertices to render.
set_vertex_buffer :: #force_inline proc(_stream: u8, _handle: VertexBufferHandle, _startVertex: u32, _numVertices: u32) {
	bgfx_set_vertex_buffer(_stream, _handle, _startVertex, _numVertices)
}

/// Set vertex buffer for draw primitive.
///
/// @param[in] _stream Vertex stream.
/// @param[in] _handle Vertex buffer.
/// @param[in] _startVertex First vertex to render.
/// @param[in] _numVertices Number of vertices to render.
/// @param[in] _layoutHandle Vertex layout for aliasing vertex buffer. If invalid
///    handle is used, vertex layout used for creation
///    of vertex buffer will be used.
set_vertex_buffer_with_layout :: #force_inline proc(_stream: u8, _handle: VertexBufferHandle, _startVertex: u32, _numVertices: u32, _layoutHandle: VertexLayoutHandle) {
	bgfx_set_vertex_buffer_with_layout(_stream, _handle, _startVertex, _numVertices, _layoutHandle)
}

/// Set vertex buffer for draw primitive.
///
/// @param[in] _stream Vertex stream.
/// @param[in] _handle Dynamic vertex buffer.
/// @param[in] _startVertex First vertex to render.
/// @param[in] _numVertices Number of vertices to render.
set_dynamic_vertex_buffer :: #force_inline proc(_stream: u8, _handle: DynamicVertexBufferHandle, _startVertex: u32, _numVertices: u32) {
	bgfx_set_dynamic_vertex_buffer(_stream, _handle, _startVertex, _numVertices)
}

/// Set vertex buffer for draw primitive.
///
/// @param[in] _stream Vertex stream.
/// @param[in] _handle Dynamic vertex buffer.
/// @param[in] _startVertex First vertex to render.
/// @param[in] _numVertices Number of vertices to render.
/// @param[in] _layoutHandle Vertex layout for aliasing vertex buffer. If invalid
///    handle is used, vertex layout used for creation
///    of vertex buffer will be used.
set_dynamic_vertex_buffer_with_layout :: #force_inline proc(_stream: u8, _handle: DynamicVertexBufferHandle, _startVertex: u32, _numVertices: u32, _layoutHandle: VertexLayoutHandle) {
	bgfx_set_dynamic_vertex_buffer_with_layout(_stream, _handle, _startVertex, _numVertices, _layoutHandle)
}

/// Set vertex buffer for draw primitive.
///
/// @param[in] _stream Vertex stream.
/// @param[in] _tvb Transient vertex buffer.
/// @param[in] _startVertex First vertex to render.
/// @param[in] _numVertices Number of vertices to render.
set_transient_vertex_buffer :: #force_inline proc(_stream: u8, _tvb: ^/*const*/TransientVertexBuffer, _startVertex: u32, _numVertices: u32) {
	bgfx_set_transient_vertex_buffer(_stream, _tvb, _startVertex, _numVertices)
}

/// Set vertex buffer for draw primitive.
///
/// @param[in] _stream Vertex stream.
/// @param[in] _tvb Transient vertex buffer.
/// @param[in] _startVertex First vertex to render.
/// @param[in] _numVertices Number of vertices to render.
/// @param[in] _layoutHandle Vertex layout for aliasing vertex buffer. If invalid
///    handle is used, vertex layout used for creation
///    of vertex buffer will be used.
set_transient_vertex_buffer_with_layout :: #force_inline proc(_stream: u8, _tvb: ^/*const*/TransientVertexBuffer, _startVertex: u32, _numVertices: u32, _layoutHandle: VertexLayoutHandle) {
	bgfx_set_transient_vertex_buffer_with_layout(_stream, _tvb, _startVertex, _numVertices, _layoutHandle)
}

/// Set number of vertices for auto generated vertices use in conjunction
/// with gl_VertexID.
/// @attention Availability depends on: `BGFX_CAPS_VERTEX_ID`.
///
/// @param[in] _numVertices Number of vertices.
set_vertex_count :: #force_inline proc(_numVertices: u32) {
	bgfx_set_vertex_count(_numVertices)
}

/// Set instance data buffer for draw primitive.
///
/// @param[in] _idb Transient instance data buffer.
/// @param[in] _start First instance data.
/// @param[in] _num Number of data instances.
set_instance_data_buffer :: #force_inline proc(_idb: ^/*const*/InstanceDataBuffer, _start: u32, _num: u32) {
	bgfx_set_instance_data_buffer(_idb, _start, _num)
}

/// Set instance data buffer for draw primitive.
///
/// @param[in] _handle Vertex buffer.
/// @param[in] _startVertex First instance data.
/// @param[in] _num Number of data instances.
set_instance_data_from_vertex_buffer :: #force_inline proc(_handle: VertexBufferHandle, _startVertex: u32, _num: u32) {
	bgfx_set_instance_data_from_vertex_buffer(_handle, _startVertex, _num)
}

/// Set instance data buffer for draw primitive.
///
/// @param[in] _handle Dynamic vertex buffer.
/// @param[in] _startVertex First instance data.
/// @param[in] _num Number of data instances.
set_instance_data_from_dynamic_vertex_buffer :: #force_inline proc(_handle: DynamicVertexBufferHandle, _startVertex: u32, _num: u32) {
	bgfx_set_instance_data_from_dynamic_vertex_buffer(_handle, _startVertex, _num)
}

/// Set number of instances for auto generated instances use in conjunction
/// with gl_InstanceID.
/// @attention Availability depends on: `BGFX_CAPS_VERTEX_ID`.
set_instance_count :: #force_inline proc(_numInstances: u32) {
	bgfx_set_instance_count(_numInstances)
}

/// Set texture stage for draw primitive.
///
/// @param[in] _stage Texture unit.
/// @param[in] _sampler Program sampler.
/// @param[in] _handle Texture handle.
/// @param[in] _flags Texture sampling mode. Default value UINT32_MAX uses
///      texture sampling settings from the texture.
///      - `BGFX_SAMPLER_[U/V/W]_[MIRROR/CLAMP]` - Mirror or clamp to edge wrap
///        mode.
///      - `BGFX_SAMPLER_[MIN/MAG/MIP]_[POINT/ANISOTROPIC]` - Point or anisotropic
///        sampling.
set_texture :: #force_inline proc(_stage: u8, _sampler: UniformHandle, _handle: TextureHandle, _flags: u32) {
	bgfx_set_texture(_stage, _sampler, _handle, _flags)
}

/// Submit an empty primitive for rendering. Uniforms and draw state
/// will be applied but no geometry will be submitted.
/// @remark
///   These empty draw calls will sort before ordinary draw calls.
///
/// @param[in] _id View id.
touch :: #force_inline proc(_id: ViewId) {
	bgfx_touch(_id)
}

/// Submit primitive for rendering.
///
/// @param[in] _id View id.
/// @param[in] _program Program.
/// @param[in] _depth Depth for sorting.
/// @param[in] _flags Which states to discard for next draw. See `BGFX_DISCARD_*`.
submit :: #force_inline proc(_id: ViewId, _program: ProgramHandle, _depth: u32, _flags: u8) {
	bgfx_submit(_id, _program, _depth, _flags)
}

/// Submit primitive with occlusion query for rendering.
///
/// @param[in] _id View id.
/// @param[in] _program Program.
/// @param[in] _occlusionQuery Occlusion query.
/// @param[in] _depth Depth for sorting.
/// @param[in] _flags Which states to discard for next draw. See `BGFX_DISCARD_*`.
submit_occlusion_query :: #force_inline proc(_id: ViewId, _program: ProgramHandle, _occlusionQuery: OcclusionQueryHandle, _depth: u32, _flags: u8) {
	bgfx_submit_occlusion_query(_id, _program, _occlusionQuery, _depth, _flags)
}

/// Submit primitive for rendering with index and instance data info from
/// indirect buffer.
/// @attention Availability depends on: `BGFX_CAPS_DRAW_INDIRECT`.
///
/// @param[in] _id View id.
/// @param[in] _program Program.
/// @param[in] _indirectHandle Indirect buffer.
/// @param[in] _start First element in indirect buffer.
/// @param[in] _num Number of draws.
/// @param[in] _depth Depth for sorting.
/// @param[in] _flags Which states to discard for next draw. See `BGFX_DISCARD_*`.
submit_indirect :: #force_inline proc(_id: ViewId, _program: ProgramHandle, _indirectHandle: IndirectBufferHandle, _start: u32, _num: u32, _depth: u32, _flags: u8) {
	bgfx_submit_indirect(_id, _program, _indirectHandle, _start, _num, _depth, _flags)
}

/// Submit primitive for rendering with index and instance data info and
/// draw count from indirect buffers.
/// @attention Availability depends on: `BGFX_CAPS_DRAW_INDIRECT_COUNT`.
///
/// @param[in] _id View id.
/// @param[in] _program Program.
/// @param[in] _indirectHandle Indirect buffer.
/// @param[in] _start First element in indirect buffer.
/// @param[in] _numHandle Buffer for number of draws. Must be
///      created with `BGFX_BUFFER_INDEX32` and `BGFX_BUFFER_DRAW_INDIRECT`.
/// @param[in] _numIndex Element in number buffer.
/// @param[in] _numMax Max number of draws.
/// @param[in] _depth Depth for sorting.
/// @param[in] _flags Which states to discard for next draw. See `BGFX_DISCARD_*`.
submit_indirect_count :: #force_inline proc(_id: ViewId, _program: ProgramHandle, _indirectHandle: IndirectBufferHandle, _start: u32, _numHandle: IndexBufferHandle, _numIndex: u32, _numMax: u32, _depth: u32, _flags: u8) {
	bgfx_submit_indirect_count(_id, _program, _indirectHandle, _start, _numHandle, _numIndex, _numMax, _depth, _flags)
}

/// Set compute index buffer.
///
/// @param[in] _stage Compute stage.
/// @param[in] _handle Index buffer handle.
/// @param[in] _access Buffer access. See `Access::Enum`.
set_compute_index_buffer :: #force_inline proc(_stage: u8, _handle: IndexBufferHandle, _access: Access) {
	bgfx_set_compute_index_buffer(_stage, _handle, _access)
}

/// Set compute vertex buffer.
///
/// @param[in] _stage Compute stage.
/// @param[in] _handle Vertex buffer handle.
/// @param[in] _access Buffer access. See `Access::Enum`.
set_compute_vertex_buffer :: #force_inline proc(_stage: u8, _handle: VertexBufferHandle, _access: Access) {
	bgfx_set_compute_vertex_buffer(_stage, _handle, _access)
}

/// Set compute dynamic index buffer.
///
/// @param[in] _stage Compute stage.
/// @param[in] _handle Dynamic index buffer handle.
/// @param[in] _access Buffer access. See `Access::Enum`.
set_compute_dynamic_index_buffer :: #force_inline proc(_stage: u8, _handle: DynamicIndexBufferHandle, _access: Access) {
	bgfx_set_compute_dynamic_index_buffer(_stage, _handle, _access)
}

/// Set compute dynamic vertex buffer.
///
/// @param[in] _stage Compute stage.
/// @param[in] _handle Dynamic vertex buffer handle.
/// @param[in] _access Buffer access. See `Access::Enum`.
set_compute_dynamic_vertex_buffer :: #force_inline proc(_stage: u8, _handle: DynamicVertexBufferHandle, _access: Access) {
	bgfx_set_compute_dynamic_vertex_buffer(_stage, _handle, _access)
}

/// Set compute indirect buffer.
///
/// @param[in] _stage Compute stage.
/// @param[in] _handle Indirect buffer handle.
/// @param[in] _access Buffer access. See `Access::Enum`.
set_compute_indirect_buffer :: #force_inline proc(_stage: u8, _handle: IndirectBufferHandle, _access: Access) {
	bgfx_set_compute_indirect_buffer(_stage, _handle, _access)
}

/// Set compute image from texture.
///
/// @param[in] _stage Compute stage.
/// @param[in] _handle Texture handle.
/// @param[in] _mip Mip level.
/// @param[in] _access Image access. See `Access::Enum`.
/// @param[in] _format Texture format. See: `TextureFormat::Enum`.
set_image :: #force_inline proc(_stage: u8, _handle: TextureHandle, _mip: u8, _access: Access, _format: TextureFormat) {
	bgfx_set_image(_stage, _handle, _mip, _access, _format)
}

/// Dispatch compute.
///
/// @param[in] _id View id.
/// @param[in] _program Compute program.
/// @param[in] _numX Number of groups X.
/// @param[in] _numY Number of groups Y.
/// @param[in] _numZ Number of groups Z.
/// @param[in] _flags Discard or preserve states. See `BGFX_DISCARD_*`.
dispatch :: #force_inline proc(_id: ViewId, _program: ProgramHandle, _numX: u32, _numY: u32, _numZ: u32, _flags: u8) {
	bgfx_dispatch(_id, _program, _numX, _numY, _numZ, _flags)
}

/// Dispatch compute indirect.
///
/// @param[in] _id View id.
/// @param[in] _program Compute program.
/// @param[in] _indirectHandle Indirect buffer.
/// @param[in] _start First element in indirect buffer.
/// @param[in] _num Number of dispatches.
/// @param[in] _flags Discard or preserve states. See `BGFX_DISCARD_*`.
dispatch_indirect :: #force_inline proc(_id: ViewId, _program: ProgramHandle, _indirectHandle: IndirectBufferHandle, _start: u32, _num: u32, _flags: u8) {
	bgfx_dispatch_indirect(_id, _program, _indirectHandle, _start, _num, _flags)
}

/// Discard previously set state for draw or compute call.
///
/// @param[in] _flags Draw/compute states to discard.
discard :: #force_inline proc(_flags: u8) {
	bgfx_discard(_flags)
}

/// Blit 2D texture region between two 2D textures.
/// @attention Destination texture must be created with `BGFX_TEXTURE_BLIT_DST` flag.
/// @attention Availability depends on: `BGFX_CAPS_TEXTURE_BLIT`.
///
/// @param[in] _id View id.
/// @param[in] _dst Destination texture handle.
/// @param[in] _dstMip Destination texture mip level.
/// @param[in] _dstX Destination texture X position.
/// @param[in] _dstY Destination texture Y position.
/// @param[in] _dstZ If texture is 2D this argument should be 0. If destination texture is cube
///    this argument represents destination texture cube face. For 3D texture this argument
///    represents destination texture Z position.
/// @param[in] _src Source texture handle.
/// @param[in] _srcMip Source texture mip level.
/// @param[in] _srcX Source texture X position.
/// @param[in] _srcY Source texture Y position.
/// @param[in] _srcZ If texture is 2D this argument should be 0. If source texture is cube
///    this argument represents source texture cube face. For 3D texture this argument
///    represents source texture Z position.
/// @param[in] _width Width of region.
/// @param[in] _height Height of region.
/// @param[in] _depth If texture is 3D this argument represents depth of region, otherwise it's
///    unused.
blit :: #force_inline proc(_id: ViewId, _dst: TextureHandle, _dstMip: u8, _dstX: u16, _dstY: u16, _dstZ: u16, _src: TextureHandle, _srcMip: u8, _srcX: u16, _srcY: u16, _srcZ: u16, _width: u16, _height: u16, _depth: u16) {
	bgfx_blit(_id, _dst, _dstMip, _dstX, _dstY, _dstZ, _src, _srcMip, _srcX, _srcY, _srcZ, _width, _height, _depth)
}


@(default_calling_convention="c")
foreign bgfx {
	bgfx_attachment_init :: proc(_this: ^Attachment, _handle: TextureHandle, _access: Access, _layer: u16, _numLayers: u16, _mip: u16, _resolve: u8) ---

	bgfx_vertex_layout_begin :: proc(_this: ^VertexLayout, _rendererType: RendererType) -> ^VertexLayout ---

	bgfx_vertex_layout_add :: proc(_this: ^VertexLayout, _attrib: Attrib, _num: u8, _type: AttribType, _normalized: bool, _asInt: bool) -> ^VertexLayout ---

	bgfx_vertex_layout_decode :: proc(_this: /*const*/^VertexLayout, _attrib: Attrib, _num: ^u8 , _type: ^AttribType, _normalized: ^bool , _asInt: ^bool ) ---

	bgfx_vertex_layout_has :: proc(_this: /*const*/^VertexLayout, _attrib: Attrib) -> bool ---

	bgfx_vertex_layout_skip :: proc(_this: ^VertexLayout, _num: u8) -> ^VertexLayout ---

	bgfx_vertex_layout_end :: proc(_this: ^VertexLayout) ---

	bgfx_vertex_layout_get_offset :: proc(_this: /*const*/^VertexLayout, _attrib: Attrib) -> u16 ---

	bgfx_vertex_layout_get_stride :: proc(_this: /*const*/^VertexLayout) -> u16 ---

	bgfx_vertex_layout_get_size :: proc(_this: /*const*/^VertexLayout, _num: u32) -> u32 ---

	bgfx_vertex_pack :: proc(_input: [4]/*const*/f32, _inputNormalized: bool, _attr: Attrib, _layout: ^/*const*/VertexLayout , _data: rawptr, _index: u32) ---

	bgfx_vertex_unpack :: proc(_output: [4]f32, _attr: Attrib, _layout: ^/*const*/VertexLayout , _data: /*const*/rawptr, _index: u32) ---

	bgfx_vertex_convert :: proc(_dstLayout: ^/*const*/VertexLayout , _dstData: rawptr, _srcLayout: ^/*const*/VertexLayout , _srcData: /*const*/rawptr, _num: u32) ---

	bgfx_weld_vertices :: proc(_output: rawptr, _layout: ^/*const*/VertexLayout , _data: /*const*/rawptr, _num: u32, _index32: bool, _epsilon: f32) -> u32 ---

	bgfx_topology_convert :: proc(_conversion: TopologyConvert, _dst: rawptr, _dstSize: u32, _indices: /*const*/rawptr, _numIndices: u32, _index32: bool) -> u32 ---

	bgfx_topology_sort_tri_list :: proc(_sort: TopologySort, _dst: rawptr, _dstSize: u32, _dir: [3]/*const*/f32, _pos: [3]/*const*/f32, _vertices: /*const*/rawptr, _stride: u32, _indices: /*const*/rawptr, _numIndices: u32, _index32: bool) ---

	bgfx_get_supported_renderers :: proc(_max: u8, _enum: ^RendererType) -> u8 ---

	bgfx_get_renderer_name :: proc(_type: RendererType) -> cstring ---

	bgfx_init_ctor :: proc(_init: ^Init) ---

	bgfx_init :: proc(_init: ^/*const*/Init ) -> bool ---

	bgfx_shutdown :: proc() ---

	bgfx_reset :: proc(_width: u32, _height: u32, _flags: u32, _format: TextureFormat) ---

	bgfx_frame :: proc(_capture: bool) -> u32 ---

	bgfx_get_renderer_type :: proc() -> RendererType ---

	bgfx_get_caps :: proc() -> ^/*const*/Caps ---

	bgfx_get_stats :: proc() -> ^/*const*/Stats ---

	bgfx_alloc :: proc(_size: u32) -> ^/*const*/Memory ---

	bgfx_copy :: proc(_data: /*const*/rawptr, _size: u32) -> ^/*const*/Memory ---

	bgfx_make_ref :: proc(_data: /*const*/rawptr, _size: u32) -> ^/*const*/Memory ---

	bgfx_make_ref_release :: proc(_data: /*const*/rawptr, _size: u32, _releaseFn: ReleaseFn, _userData: rawptr) -> ^/*const*/Memory ---

	bgfx_set_debug :: proc(_debug: u32) ---

	bgfx_dbg_text_clear :: proc(_attr: u8, _small: bool) ---

	bgfx_dbg_text_printf :: proc(_x: u16, _y: u16, _attr: u8, _format: cstring, #c_vararg arg5: ..any) ---

	bgfx_dbg_text_vprintf :: proc(_x: u16, _y: u16, _attr: u8, _format: cstring, _argList: c.va_list) ---

	bgfx_dbg_text_image :: proc(_x: u16, _y: u16, _width: u16, _height: u16, _data: /*const*/rawptr, _pitch: u16) ---

	bgfx_create_index_buffer :: proc(_mem: ^/*const*/Memory, _flags: u16) -> IndexBufferHandle ---

	bgfx_set_index_buffer_name :: proc(_handle: IndexBufferHandle, _name: cstring, _len: i32) ---

	bgfx_destroy_index_buffer :: proc(_handle: IndexBufferHandle) ---

	bgfx_create_vertex_layout :: proc(_layout: ^/*const*/VertexLayout ) -> VertexLayoutHandle ---

	bgfx_destroy_vertex_layout :: proc(_layoutHandle: VertexLayoutHandle) ---

	bgfx_create_vertex_buffer :: proc(_mem: ^/*const*/Memory, _layout: ^/*const*/VertexLayout , _flags: u16) -> VertexBufferHandle ---

	bgfx_set_vertex_buffer_name :: proc(_handle: VertexBufferHandle, _name: cstring, _len: i32) ---

	bgfx_destroy_vertex_buffer :: proc(_handle: VertexBufferHandle) ---

	bgfx_create_dynamic_index_buffer :: proc(_num: u32, _flags: u16) -> DynamicIndexBufferHandle ---

	bgfx_create_dynamic_index_buffer_mem :: proc(_mem: ^/*const*/Memory, _flags: u16) -> DynamicIndexBufferHandle ---

	bgfx_update_dynamic_index_buffer :: proc(_handle: DynamicIndexBufferHandle, _startIndex: u32, _mem: ^/*const*/Memory) ---

	bgfx_destroy_dynamic_index_buffer :: proc(_handle: DynamicIndexBufferHandle) ---

	bgfx_create_dynamic_vertex_buffer :: proc(_num: u32, _layout: ^/*const*/VertexLayout, _flags: u16) -> DynamicVertexBufferHandle ---

	bgfx_create_dynamic_vertex_buffer_mem :: proc(_mem: ^/*const*/Memory, _layout: ^/*const*/VertexLayout, _flags: u16) -> DynamicVertexBufferHandle ---

	bgfx_update_dynamic_vertex_buffer :: proc(_handle: DynamicVertexBufferHandle, _startVertex: u32, _mem: ^/*const*/Memory) ---

	bgfx_destroy_dynamic_vertex_buffer :: proc(_handle: DynamicVertexBufferHandle) ---

	bgfx_get_avail_transient_index_buffer :: proc(_num: u32, _index32: bool) -> u32 ---

	bgfx_get_avail_transient_vertex_buffer :: proc(_num: u32, _layout: ^/*const*/VertexLayout ) -> u32 ---

	bgfx_get_avail_instance_data_buffer :: proc(_num: u32, _stride: u16) -> u32 ---

	bgfx_alloc_transient_index_buffer :: proc(_tib: ^TransientIndexBuffer, _num: u32, _index32: bool) ---

	bgfx_alloc_transient_vertex_buffer :: proc(_tvb: ^TransientVertexBuffer, _num: u32, _layout: ^/*const*/VertexLayout ) ---

	bgfx_alloc_transient_buffers :: proc(_tvb: ^TransientVertexBuffer, _layout: ^/*const*/VertexLayout , _numVertices: u32, _tib: ^TransientIndexBuffer, _numIndices: u32, _index32: bool) -> bool ---

	bgfx_alloc_instance_data_buffer :: proc(_idb: ^InstanceDataBuffer, _num: u32, _stride: u16) ---

	bgfx_create_indirect_buffer :: proc(_num: u32) -> IndirectBufferHandle ---

	bgfx_destroy_indirect_buffer :: proc(_handle: IndirectBufferHandle) ---

	bgfx_create_shader :: proc(_mem: ^/*const*/Memory) -> ShaderHandle ---

	bgfx_get_shader_uniforms :: proc(_handle: ShaderHandle, _uniforms: ^UniformHandle, _max: u16) -> u16 ---

	bgfx_set_shader_name :: proc(_handle: ShaderHandle, _name: cstring, _len: i32) ---

	bgfx_destroy_shader :: proc(_handle: ShaderHandle) ---

	bgfx_create_program :: proc(_vsh: ShaderHandle, _fsh: ShaderHandle, _destroyShaders: bool) -> ProgramHandle ---

	bgfx_create_compute_program :: proc(_csh: ShaderHandle, _destroyShaders: bool) -> ProgramHandle ---

	bgfx_destroy_program :: proc(_handle: ProgramHandle) ---

	bgfx_is_texture_valid :: proc(_depth: u16, _cubeMap: bool, _numLayers: u16, _format: TextureFormat, _flags: u64) -> bool ---

	bgfx_is_frame_buffer_valid :: proc(_num: u8, _attachment: ^/*const*/Attachment) -> bool ---

	bgfx_calc_texture_size :: proc(_info: ^TextureInfo, _width: u16, _height: u16, _depth: u16, _cubeMap: bool, _hasMips: bool, _numLayers: u16, _format: TextureFormat) ---

	bgfx_create_texture :: proc(_mem: ^/*const*/Memory, _flags: u64, _skip: u8, _info: ^TextureInfo) -> TextureHandle ---

	bgfx_create_texture_2d :: proc(_width: u16, _height: u16, _hasMips: bool, _numLayers: u16, _format: TextureFormat, _flags: u64, _mem: ^/*const*/Memory) -> TextureHandle ---

	bgfx_create_texture_2d_scaled :: proc(_ratio: BackbufferRatio, _hasMips: bool, _numLayers: u16, _format: TextureFormat, _flags: u64) -> TextureHandle ---

	bgfx_create_texture_3d :: proc(_width: u16, _height: u16, _depth: u16, _hasMips: bool, _format: TextureFormat, _flags: u64, _mem: ^/*const*/Memory) -> TextureHandle ---

	bgfx_create_texture_cube :: proc(_size: u16, _hasMips: bool, _numLayers: u16, _format: TextureFormat, _flags: u64, _mem: ^/*const*/Memory) -> TextureHandle ---

	bgfx_update_texture_2d :: proc(_handle: TextureHandle, _layer: u16, _mip: u8, _x: u16, _y: u16, _width: u16, _height: u16, _mem: ^/*const*/Memory, _pitch: u16) ---

	bgfx_update_texture_3d :: proc(_handle: TextureHandle, _mip: u8, _x: u16, _y: u16, _z: u16, _width: u16, _height: u16, _depth: u16, _mem: ^/*const*/Memory) ---

	bgfx_update_texture_cube :: proc(_handle: TextureHandle, _layer: u16, _side: u8, _mip: u8, _x: u16, _y: u16, _width: u16, _height: u16, _mem: ^/*const*/Memory, _pitch: u16) ---

	bgfx_read_texture :: proc(_handle: TextureHandle, _data: rawptr, _mip: u8) -> u32 ---

	bgfx_set_texture_name :: proc(_handle: TextureHandle, _name: cstring, _len: i32) ---

	bgfx_get_direct_access_ptr :: proc(_handle: TextureHandle) -> rawptr ---

	bgfx_destroy_texture :: proc(_handle: TextureHandle) ---

	bgfx_create_frame_buffer :: proc(_width: u16, _height: u16, _format: TextureFormat, _textureFlags: u64) -> FrameBufferHandle ---

	bgfx_create_frame_buffer_scaled :: proc(_ratio: BackbufferRatio, _format: TextureFormat, _textureFlags: u64) -> FrameBufferHandle ---

	bgfx_create_frame_buffer_from_handles :: proc(_num: u8, _handles: ^/*const*/TextureHandle, _destroyTexture: bool) -> FrameBufferHandle ---

	bgfx_create_frame_buffer_from_attachment :: proc(_num: u8, _attachment: ^/*const*/Attachment, _destroyTexture: bool) -> FrameBufferHandle ---

	bgfx_create_frame_buffer_from_nwh :: proc(_nwh: rawptr, _width: u16, _height: u16, _format: TextureFormat, _depthFormat: TextureFormat) -> FrameBufferHandle ---

	bgfx_set_frame_buffer_name :: proc(_handle: FrameBufferHandle, _name: cstring, _len: i32) ---

	bgfx_get_texture :: proc(_handle: FrameBufferHandle, _attachment: u8) -> TextureHandle ---

	bgfx_destroy_frame_buffer :: proc(_handle: FrameBufferHandle) ---

	bgfx_create_uniform :: proc(_name: cstring, _type: UniformType, _num: u16) -> UniformHandle ---

	bgfx_get_uniform_info :: proc(_handle: UniformHandle, _info: ^UniformInfo) ---

	bgfx_destroy_uniform :: proc(_handle: UniformHandle) ---

	bgfx_create_occlusion_query :: proc() -> OcclusionQueryHandle ---

	bgfx_get_result :: proc(_handle: OcclusionQueryHandle, _result: ^i32) -> OcclusionQueryResult ---

	bgfx_destroy_occlusion_query :: proc(_handle: OcclusionQueryHandle) ---

	bgfx_set_palette_color :: proc(_index: u8, _rgba: [4]/*const*/f32) ---

	bgfx_set_palette_color_rgba32f :: proc(_index: u8, _r: f32, _g: f32, _b: f32, _a: f32) ---

	bgfx_set_palette_color_rgba8 :: proc(_index: u8, _rgba: u32) ---

	bgfx_set_view_name :: proc(_id: ViewId, _name: cstring, _len: i32) ---

	bgfx_set_view_rect :: proc(_id: ViewId, _x: u16, _y: u16, _width: u16, _height: u16) ---

	bgfx_set_view_rect_ratio :: proc(_id: ViewId, _x: u16, _y: u16, _ratio: BackbufferRatio) ---

	bgfx_set_view_scissor :: proc(_id: ViewId, _x: u16, _y: u16, _width: u16, _height: u16) ---

	bgfx_set_view_clear :: proc(_id: ViewId, _flags: u16, _rgba: u32, _depth: f32, _stencil: u8) ---

	bgfx_set_view_clear_mrt :: proc(_id: ViewId, _flags: u16, _depth: f32, _stencil: u8, _c0: u8, _c1: u8, _c2: u8, _c3: u8, _c4: u8, _c5: u8, _c6: u8, _c7: u8) ---

	bgfx_set_view_mode :: proc(_id: ViewId, _mode: ViewMode) ---

	bgfx_set_view_frame_buffer :: proc(_id: ViewId, _handle: FrameBufferHandle) ---

	bgfx_set_view_transform :: proc(_id: ViewId, _view: /*const*/rawptr, _proj: /*const*/rawptr) ---

	bgfx_set_view_order :: proc(_id: ViewId, _num: u16, _order: ^/*const*/ViewId) ---

	bgfx_reset_view :: proc(_id: ViewId) ---

	bgfx_encoder_begin :: proc(_forThread: bool) -> ^Encoder ---

	bgfx_encoder_end :: proc(_encoder: ^Encoder) ---

	bgfx_encoder_set_marker :: proc(_this: ^Encoder, _name: cstring, _len: i32) ---

	bgfx_encoder_set_state :: proc(_this: ^Encoder, _state: u64, _rgba: u32) ---

	bgfx_encoder_set_condition :: proc(_this: ^Encoder, _handle: OcclusionQueryHandle, _visible: bool) ---

	bgfx_encoder_set_stencil :: proc(_this: ^Encoder, _fstencil: u32, _bstencil: u32) ---

	bgfx_encoder_set_scissor :: proc(_this: ^Encoder, _x: u16, _y: u16, _width: u16, _height: u16) -> u16 ---

	bgfx_encoder_set_scissor_cached :: proc(_this: ^Encoder, _cache: u16) ---

	bgfx_encoder_set_transform :: proc(_this: ^Encoder, _mtx: /*const*/rawptr, _num: u16) -> u32 ---

	bgfx_encoder_set_transform_cached :: proc(_this: ^Encoder, _cache: u32, _num: u16) ---

	bgfx_encoder_alloc_transform :: proc(_this: ^Encoder, _transform: ^Transform, _num: u16) -> u32 ---

	bgfx_encoder_set_uniform :: proc(_this: ^Encoder, _handle: UniformHandle, _value: /*const*/rawptr, _num: u16) ---

	bgfx_encoder_set_index_buffer :: proc(_this: ^Encoder, _handle: IndexBufferHandle, _firstIndex: u32, _numIndices: u32) ---

	bgfx_encoder_set_dynamic_index_buffer :: proc(_this: ^Encoder, _handle: DynamicIndexBufferHandle, _firstIndex: u32, _numIndices: u32) ---

	bgfx_encoder_set_transient_index_buffer :: proc(_this: ^Encoder, _tib: ^/*const*/TransientIndexBuffer, _firstIndex: u32, _numIndices: u32) ---

	bgfx_encoder_set_vertex_buffer :: proc(_this: ^Encoder, _stream: u8, _handle: VertexBufferHandle, _startVertex: u32, _numVertices: u32) ---

	bgfx_encoder_set_vertex_buffer_with_layout :: proc(_this: ^Encoder, _stream: u8, _handle: VertexBufferHandle, _startVertex: u32, _numVertices: u32, _layoutHandle: VertexLayoutHandle) ---

	bgfx_encoder_set_dynamic_vertex_buffer :: proc(_this: ^Encoder, _stream: u8, _handle: DynamicVertexBufferHandle, _startVertex: u32, _numVertices: u32) ---

	bgfx_encoder_set_dynamic_vertex_buffer_with_layout :: proc(_this: ^Encoder, _stream: u8, _handle: DynamicVertexBufferHandle, _startVertex: u32, _numVertices: u32, _layoutHandle: VertexLayoutHandle) ---

	bgfx_encoder_set_transient_vertex_buffer :: proc(_this: ^Encoder, _stream: u8, _tvb: ^/*const*/TransientVertexBuffer, _startVertex: u32, _numVertices: u32) ---

	bgfx_encoder_set_transient_vertex_buffer_with_layout :: proc(_this: ^Encoder, _stream: u8, _tvb: ^/*const*/TransientVertexBuffer, _startVertex: u32, _numVertices: u32, _layoutHandle: VertexLayoutHandle) ---

	bgfx_encoder_set_vertex_count :: proc(_this: ^Encoder, _numVertices: u32) ---

	bgfx_encoder_set_instance_data_buffer :: proc(_this: ^Encoder, _idb: ^/*const*/InstanceDataBuffer, _start: u32, _num: u32) ---

	bgfx_encoder_set_instance_data_from_vertex_buffer :: proc(_this: ^Encoder, _handle: VertexBufferHandle, _startVertex: u32, _num: u32) ---

	bgfx_encoder_set_instance_data_from_dynamic_vertex_buffer :: proc(_this: ^Encoder, _handle: DynamicVertexBufferHandle, _startVertex: u32, _num: u32) ---

	bgfx_encoder_set_instance_count :: proc(_this: ^Encoder, _numInstances: u32) ---

	bgfx_encoder_set_texture :: proc(_this: ^Encoder, _stage: u8, _sampler: UniformHandle, _handle: TextureHandle, _flags: u32) ---

	bgfx_encoder_touch :: proc(_this: ^Encoder, _id: ViewId) ---

	bgfx_encoder_submit :: proc(_this: ^Encoder, _id: ViewId, _program: ProgramHandle, _depth: u32, _flags: u8) ---

	bgfx_encoder_submit_occlusion_query :: proc(_this: ^Encoder, _id: ViewId, _program: ProgramHandle, _occlusionQuery: OcclusionQueryHandle, _depth: u32, _flags: u8) ---

	bgfx_encoder_submit_indirect :: proc(_this: ^Encoder, _id: ViewId, _program: ProgramHandle, _indirectHandle: IndirectBufferHandle, _start: u32, _num: u32, _depth: u32, _flags: u8) ---

	bgfx_encoder_submit_indirect_count :: proc(_this: ^Encoder, _id: ViewId, _program: ProgramHandle, _indirectHandle: IndirectBufferHandle, _start: u32, _numHandle: IndexBufferHandle, _numIndex: u32, _numMax: u32, _depth: u32, _flags: u8) ---

	bgfx_encoder_set_compute_index_buffer :: proc(_this: ^Encoder, _stage: u8, _handle: IndexBufferHandle, _access: Access) ---

	bgfx_encoder_set_compute_vertex_buffer :: proc(_this: ^Encoder, _stage: u8, _handle: VertexBufferHandle, _access: Access) ---

	bgfx_encoder_set_compute_dynamic_index_buffer :: proc(_this: ^Encoder, _stage: u8, _handle: DynamicIndexBufferHandle, _access: Access) ---

	bgfx_encoder_set_compute_dynamic_vertex_buffer :: proc(_this: ^Encoder, _stage: u8, _handle: DynamicVertexBufferHandle, _access: Access) ---

	bgfx_encoder_set_compute_indirect_buffer :: proc(_this: ^Encoder, _stage: u8, _handle: IndirectBufferHandle, _access: Access) ---

	bgfx_encoder_set_image :: proc(_this: ^Encoder, _stage: u8, _handle: TextureHandle, _mip: u8, _access: Access, _format: TextureFormat) ---

	bgfx_encoder_dispatch :: proc(_this: ^Encoder, _id: ViewId, _program: ProgramHandle, _numX: u32, _numY: u32, _numZ: u32, _flags: u8) ---

	bgfx_encoder_dispatch_indirect :: proc(_this: ^Encoder, _id: ViewId, _program: ProgramHandle, _indirectHandle: IndirectBufferHandle, _start: u32, _num: u32, _flags: u8) ---

	bgfx_encoder_discard :: proc(_this: ^Encoder, _flags: u8) ---

	bgfx_encoder_blit :: proc(_this: ^Encoder, _id: ViewId, _dst: TextureHandle, _dstMip: u8, _dstX: u16, _dstY: u16, _dstZ: u16, _src: TextureHandle, _srcMip: u8, _srcX: u16, _srcY: u16, _srcZ: u16, _width: u16, _height: u16, _depth: u16) ---

	bgfx_request_screen_shot :: proc(_handle: FrameBufferHandle, _filePath: cstring) ---

	bgfx_render_frame :: proc(_msecs: i32) -> RenderFrame ---

	bgfx_set_platform_data :: proc(_data: ^/*const*/PlatformData ) ---

	bgfx_get_internal_data :: proc() -> ^/*const*/InternalData ---

	bgfx_override_internal_texture_ptr :: proc(_handle: TextureHandle, _ptr: uintptr) -> uintptr ---

	bgfx_override_internal_texture :: proc(_handle: TextureHandle, _width: u16, _height: u16, _numMips: u8, _format: TextureFormat, _flags: u64) -> uintptr ---

	bgfx_set_marker :: proc(_name: cstring, _len: i32) ---

	bgfx_set_state :: proc(_state: u64, _rgba: u32) ---

	bgfx_set_condition :: proc(_handle: OcclusionQueryHandle, _visible: bool) ---

	bgfx_set_stencil :: proc(_fstencil: u32, _bstencil: u32) ---

	bgfx_set_scissor :: proc(_x: u16, _y: u16, _width: u16, _height: u16) -> u16 ---

	bgfx_set_scissor_cached :: proc(_cache: u16) ---

	bgfx_set_transform :: proc(_mtx: /*const*/rawptr, _num: u16) -> u32 ---

	bgfx_set_transform_cached :: proc(_cache: u32, _num: u16) ---

	bgfx_alloc_transform :: proc(_transform: ^Transform, _num: u16) -> u32 ---

	bgfx_set_uniform :: proc(_handle: UniformHandle, _value: /*const*/rawptr, _num: u16) ---

	bgfx_set_index_buffer :: proc(_handle: IndexBufferHandle, _firstIndex: u32, _numIndices: u32) ---

	bgfx_set_dynamic_index_buffer :: proc(_handle: DynamicIndexBufferHandle, _firstIndex: u32, _numIndices: u32) ---

	bgfx_set_transient_index_buffer :: proc(_tib: ^/*const*/TransientIndexBuffer, _firstIndex: u32, _numIndices: u32) ---

	bgfx_set_vertex_buffer :: proc(_stream: u8, _handle: VertexBufferHandle, _startVertex: u32, _numVertices: u32) ---

	bgfx_set_vertex_buffer_with_layout :: proc(_stream: u8, _handle: VertexBufferHandle, _startVertex: u32, _numVertices: u32, _layoutHandle: VertexLayoutHandle) ---

	bgfx_set_dynamic_vertex_buffer :: proc(_stream: u8, _handle: DynamicVertexBufferHandle, _startVertex: u32, _numVertices: u32) ---

	bgfx_set_dynamic_vertex_buffer_with_layout :: proc(_stream: u8, _handle: DynamicVertexBufferHandle, _startVertex: u32, _numVertices: u32, _layoutHandle: VertexLayoutHandle) ---

	bgfx_set_transient_vertex_buffer :: proc(_stream: u8, _tvb: ^/*const*/TransientVertexBuffer, _startVertex: u32, _numVertices: u32) ---

	bgfx_set_transient_vertex_buffer_with_layout :: proc(_stream: u8, _tvb: ^/*const*/TransientVertexBuffer, _startVertex: u32, _numVertices: u32, _layoutHandle: VertexLayoutHandle) ---

	bgfx_set_vertex_count :: proc(_numVertices: u32) ---

	bgfx_set_instance_data_buffer :: proc(_idb: ^/*const*/InstanceDataBuffer, _start: u32, _num: u32) ---

	bgfx_set_instance_data_from_vertex_buffer :: proc(_handle: VertexBufferHandle, _startVertex: u32, _num: u32) ---

	bgfx_set_instance_data_from_dynamic_vertex_buffer :: proc(_handle: DynamicVertexBufferHandle, _startVertex: u32, _num: u32) ---

	bgfx_set_instance_count :: proc(_numInstances: u32) ---

	bgfx_set_texture :: proc(_stage: u8, _sampler: UniformHandle, _handle: TextureHandle, _flags: u32) ---

	bgfx_touch :: proc(_id: ViewId) ---

	bgfx_submit :: proc(_id: ViewId, _program: ProgramHandle, _depth: u32, _flags: u8) ---

	bgfx_submit_occlusion_query :: proc(_id: ViewId, _program: ProgramHandle, _occlusionQuery: OcclusionQueryHandle, _depth: u32, _flags: u8) ---

	bgfx_submit_indirect :: proc(_id: ViewId, _program: ProgramHandle, _indirectHandle: IndirectBufferHandle, _start: u32, _num: u32, _depth: u32, _flags: u8) ---

	bgfx_submit_indirect_count :: proc(_id: ViewId, _program: ProgramHandle, _indirectHandle: IndirectBufferHandle, _start: u32, _numHandle: IndexBufferHandle, _numIndex: u32, _numMax: u32, _depth: u32, _flags: u8) ---

	bgfx_set_compute_index_buffer :: proc(_stage: u8, _handle: IndexBufferHandle, _access: Access) ---

	bgfx_set_compute_vertex_buffer :: proc(_stage: u8, _handle: VertexBufferHandle, _access: Access) ---

	bgfx_set_compute_dynamic_index_buffer :: proc(_stage: u8, _handle: DynamicIndexBufferHandle, _access: Access) ---

	bgfx_set_compute_dynamic_vertex_buffer :: proc(_stage: u8, _handle: DynamicVertexBufferHandle, _access: Access) ---

	bgfx_set_compute_indirect_buffer :: proc(_stage: u8, _handle: IndirectBufferHandle, _access: Access) ---

	bgfx_set_image :: proc(_stage: u8, _handle: TextureHandle, _mip: u8, _access: Access, _format: TextureFormat) ---

	bgfx_dispatch :: proc(_id: ViewId, _program: ProgramHandle, _numX: u32, _numY: u32, _numZ: u32, _flags: u8) ---

	bgfx_dispatch_indirect :: proc(_id: ViewId, _program: ProgramHandle, _indirectHandle: IndirectBufferHandle, _start: u32, _num: u32, _flags: u8) ---

	bgfx_discard :: proc(_flags: u8) ---

	bgfx_blit :: proc(_id: ViewId, _dst: TextureHandle, _dstMip: u8, _dstX: u16, _dstY: u16, _dstZ: u16, _src: TextureHandle, _srcMip: u8, _srcX: u16, _srcY: u16, _srcZ: u16, _width: u16, _height: u16, _depth: u16) ---

}
