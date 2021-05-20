@[Include(
  "/home/ubuntu/projects/native-ui/LCUI/include/LCUI.h",
  import_docstrings: "brief",
  prefix: %w(lcui_ LCUI_ LCUI),
  flags: "-I/home/ubuntu/projects/native-ui/LCUI/include/",
  remove_prefix: false
)]
# @[Link(ldflags: "-L./LCUI/lib")]
@[Link(ldflags: "-L/home/ubuntu/projects/native-ui/LCUI/lib")]
lib LibLCUI
end