# @[Link(ldflags: "`pkg-config --cflags --libs x11 xcb libpng fontconfig`")]
# # Rest
# @[Link(ldflags: "-L#{__DIR__}/../LCUI/src/.libs")]
# @[Link(ldflags: "-lLCUI")]
# @[Link(ldflags: "-I#{__DIR__}/../LCUI/include")]
# @[Link(ldflags: "-I#{__DIR__}/../LCUI/")]

export C_INCLUDE_PATH=$C_INCLUDE_PATH:/usr/include/libxml2:/usr/include/freetype2/
export LD_LIBRARY_PATH=$(pwd)/LCUI/src/.libs:$LD_LIBRARY_PATH