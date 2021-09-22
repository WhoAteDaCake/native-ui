# LINKS
@[Link(ldflags: "`pkg-config --cflags --libs x11 xcb libpng fontconfig`")]
# Rest please
@[Link(ldflags: "-L#{__DIR__}/../../LCUI/build/linux/x86_64/release")]
@[Link(ldflags: "-llcui")]
@[Link(ldflags: "-I#{__DIR__}/../../LCUI/include")]

# fun surface_move = Surface_Move(surface : LcuiSurface, x : LibC::Int, y : LibC::Int)
# alias WcharT = Uint16
