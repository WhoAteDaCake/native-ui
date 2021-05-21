@[Link(ldflags: "-L./LCUI/lib")]
lib LibLCUI
  MAX_FRAMES_PER_SEC = 120
  DIRENT_NAME_LEN = 256
  union Rgb565
    value : LibC::UShort
    b : UcharT
    g : UcharT
    r : UcharT
    blue : UcharT
    green : UcharT
    red : UcharT
  end
  alias UcharT = UInt8
  union Argb8888
    value : Int32T
    b : UcharT
    g : UcharT
    r : UcharT
    a : UcharT
    blue : UcharT
    green : UcharT
    red : UcharT
    alpha : UcharT
  end
  alias X__Int32T = LibC::Int
  alias Int32T = X__Int32T
  struct Pos
    x : LibC::Int
    y : LibC::Int
  end
  struct Size
    width : LibC::Int
    height : LibC::Int
  end
  struct Rect
    x : LibC::Int
    y : LibC::Int
    width : LibC::Int
    height : LibC::Int
  end
  struct Rect2
    left : LibC::Int
    top : LibC::Int
    right : LibC::Int
    bottom : LibC::Int
  end
  struct RectF
    x : LibC::Float
    y : LibC::Float
    width : LibC::Float
    height : LibC::Float
  end
  struct Rect2F
    left : LibC::Float
    top : LibC::Float
    right : LibC::Float
    bottom : LibC::Float
  end
  struct BoxShadowStyle
    x : LibC::Float
    y : LibC::Float
    blur : LibC::Float
    spread : LibC::Float
    color : Argb8888
  end
  struct BoxShadow
    x : LibC::Int
    y : LibC::Int
    blur : LibC::Int
    spread : LibC::Int
    color : Argb8888
    top_left_radius : LibC::Int
    top_right_radius : LibC::Int
    bottom_left_radius : LibC::Int
    bottom_right_radius : LibC::Int
  end
  struct BorderStyle
    style : LibC::Int
    width : LibC::Float
    color : Argb8888
    top : BorderStyleTop
    right : BorderStyleTop
    bottom : BorderStyleTop
    left : BorderStyleTop
    top_left_radius : LibC::Float
    top_right_radius : LibC::Float
    bottom_left_radius : LibC::Float
    bottom_right_radius : LibC::Float
  end
  struct BorderStyleTop
    style : LibC::Int
    width : LibC::Float
    color : Argb8888
  end
  struct BorderLine
    style : LibC::Int
    width : LibC::UInt
    color : Argb8888
  end
  struct Border
    top : BorderLine
    right : BorderLine
    bottom : BorderLine
    left : BorderLine
    top_left_radius : LibC::UInt
    top_right_radius : LibC::UInt
    bottom_left_radius : LibC::UInt
    bottom_right_radius : LibC::UInt
  end
  struct Graph
    width : LibC::UInt
    height : LibC::UInt
    quote : GraphQuote
    bytes : UcharT*
    argb : Argb8888*
    color_type : ColorType
    bytes_per_pixel : LibC::UInt
    bytes_per_row : LibC::UInt
    opacity : LibC::Float
    mem_size : LibC::SizeT
    palette : UcharT*
  end
  struct GraphQuote
    top : LibC::Int
    left : LibC::Int
    is_valid : Bool
    is_writable : Bool
    source : Graph*
    source_ro : Graph*
  end
  alias Bool = UInt8
    # 色彩模式
enum ColorType
        # 8位索引
ColorTypeIndex8 = 0
        # 8位灰度
ColorTypeGray8 = 1
        # RGB323
ColorTypeRgb323 = 2
        # ARGB2222
ColorTypeArgb2222 = 3
        # RGB555
ColorTypeRgb555 = 4
        # RGB565
ColorTypeRgb565 = 5
        # RGB888
ColorTypeRgb888 = 6
        # RGB8888
ColorTypeArgb8888 = 7
  end
  struct StyleRec
    is_valid : Bool
    type : StyleType
    val_int : LibC::Int
    val_0 : LibC::Int
    val_none : LibC::Int
    value : LibC::Float
    px : LibC::Float
    val_px : LibC::Float
    pt : LibC::Float
    val_pt : LibC::Float
    dp : LibC::Float
    val_dp : LibC::Float
    dip : LibC::Float
    val_dip : LibC::Float
    sp : LibC::Float
    val_sp : LibC::Float
    style : StyleValue
    val_style : StyleValue
    scale : LibC::Float
    val_scale : LibC::Float
    string : LibC::Char*
    val_string : LibC::Char*
    wstring : WcharT*
    val_wstring : WcharT*
    color : Argb8888
    val_color : Argb8888
    image : Graph*
    val_image : Graph*
    val_bool : Bool
  end
    # 样式变量类型
enum StyleType
    StypeNone = 0
    StypeAuto = 1
    StypeScale = 2
    StypePx = 3
    StypePt = 4
    StypeDip = 5
    StypeSp = 6
    StypeColor = 7
    StypeImage = 8
    StypeStyle = 9
    StypeInt = 10
    StypeBool = 11
    StypeString = 12
    StypeWstring = 13
  end
  enum StyleValue
    SvNone = 0
    SvAuto = 1
    SvNormal = 2
    SvInherit = 3
    SvInitial = 4
    SvContain = 5
    SvCover = 6
    SvLeft = 7
    SvCenter = 8
    SvRight = 9
    SvTop = 10
    SvTopLeft = 11
    SvTopCenter = 12
    SvTopRight = 13
    SvMiddle = 14
    SvCenterLeft = 15
    SvCenterCenter = 16
    SvCenterRight = 17
    SvBottom = 18
    SvBottomLeft = 19
    SvBottomCenter = 20
    SvBottomRight = 21
    SvSolid = 22
    SvDotted = 23
    SvDouble = 24
    SvDashed = 25
    SvContentBox = 26
    SvPaddingBox = 27
    SvBorderBox = 28
    SvGraphBox = 29
    SvStatic = 30
    SvRelative = 31
    SvAbsolute = 32
    SvBlock = 33
    SvInlineBlock = 34
    SvFlex = 35
    SvFlexStart = 36
    SvFlexEnd = 37
    SvStretch = 38
    SvSpaceBetween = 39
    SvSpaceAround = 40
    SvSpaceEvenly = 41
    SvWrap = 42
    SvNowrap = 43
    SvRow = 44
    SvColumn = 45
  end
  alias WcharT = LibC::Int
  struct FlexLayoutStyle
        # The flex shrink factor of a flex item See more: https://developer.mozilla.org/en-US/docs/Web/CSS/flex-shrink
shrink : LibC::Float
    grow : LibC::Float
        # The initial main size of a flex item See more: https://developer.mozilla.org/en-US/docs/Web/CSS/flex-basis
basis : LibC::Float
    wrap : StyleValue
    direction : StyleValue
        # Sets the align-self value on all direct children as a group See more: https://developer.mozilla.org/en-US/docs/Web/CSS/align-items
align_items : StyleValue
        # Sets the distribution of space between and around content items along a flexbox's cross-axis See more: https://developer.mozilla.org/en-US/docs/Web/CSS/align-content
align_content : StyleValue
        # Defines how the browser distributes space between and around content items along the main-axis of a flex container See more: https://developer.mozilla.org/en-US/docs/Web/CSS/justify-content
justify_content : StyleValue
  end
  struct BoundBoxRec
    top : StyleRec
    right : StyleRec
    bottom : StyleRec
    left : StyleRec
  end
  struct BackgroundPosition
    using_value : Bool
    x : StyleRec
    y : StyleRec
    value : LibC::Int
  end
  struct BackgroundSize
    using_value : Bool
    width : StyleRec
    height : StyleRec
    value : LibC::Int
  end
  struct BackgroundStyle
        # 背景图
image : Graph
        # 背景色
color : Argb8888
    x : Bool
    y : Bool
        # 背景图是否重复
repeat : BackgroundStyleRepeat
        # 定位方式
position : BackgroundPosition
        # 尺寸
size : BackgroundSize
  end
  struct BackgroundStyleRepeat
    x : Bool
    y : Bool
  end
  struct Background
        # 背景图
    image : Graph*
        # 背景色
    color : Argb8888
        # 背景图是否重复
    repeat : BackgroundRepeat
    x : LibC::Int
    y : LibC::Int
    position : BackgroundPosition
    width : LibC::Int
    height : LibC::Int
    size : BackgroundSize
  end
  struct BackgroundRepeat
    x : Bool
    y : Bool
  end
  struct PaintContextRec
        # 需要绘制的区域
rect : Rect
        # 绘制后的位图缓存（可称为：画布）
canvas : Graph
        # 绘制时是否需要处理 alpha 通道
with_alpha : Bool
  end
  struct WidgetTasksRec
    time : ClockT
    update_count : LibC::SizeT
    refresh_count : LibC::SizeT
    layout_count : LibC::SizeT
    user_task_count : LibC::SizeT
    destroy_count : LibC::SizeT
    destroy_time : LibC::SizeT
  end
  alias X__ClockT = LibC::Long
  alias ClockT = X__ClockT
  struct FrameProfileRec
    timers_count : LibC::SizeT
    timers_time : ClockT
    events_count : LibC::SizeT
    events_time : ClockT
    render_count : LibC::SizeT
    render_time : ClockT
    present_time : ClockT
    widget_tasks : WidgetTasksRec
  end
  struct ProfileRec
    start_time : ClockT
    end_time : ClockT
    frames_count : LibC::UInt
    frames : FrameProfileRec[120]
  end
  fun time_init = LCUITime_Init
  fun get_time = LCUI_GetTime : Int64T
  alias X__Int64T = LibC::Long
  alias Int64T = X__Int64T
  fun get_time_delta = LCUI_GetTimeDelta(start : Int64T) : Int64T
  fun sleep = LCUI_Sleep(s : LibC::UInt)
  fun m_sleep = LCUI_MSleep(ms : LibC::UInt)
  struct DirEntry
    dirent : Dirent
    name : WcharT[256]
  end
  struct Dirent
    d_ino : X__InoT
    d_off : X__OffT
    d_reclen : LibC::UShort
    d_type : UInt8
    d_name : LibC::Char[256]
  end
  alias X__InoT = LibC::ULong
  alias X__OffT = LibC::Long
  struct Dir
    handle : DirHandle
    entry : DirEntry
    cached : LibC::Int
  end
  alias DirHandle = Dir*
  fun open_dir_w = LCUI_OpenDirW(filepath : WcharT*, dir : Dir*) : LibC::Int
  fun open_dir_a = LCUI_OpenDirA(filepath : LibC::Char*, dir : Dir*) : LibC::Int
  fun read_dir_a = LCUI_ReadDirA(dir : Dir*) : DirEntry*
  fun read_dir_w = LCUI_ReadDirW(dir : Dir*) : DirEntry*
  fun close_dir = LCUI_CloseDir(dir : Dir*) : LibC::Int
  fun get_file_name_a = LCUI_GetFileNameA(entry : DirEntry*) : LibC::Char*
  fun get_file_name_w = LCUI_GetFileNameW(entry : DirEntry*) : WcharT*
  fun file_is_directory = LCUI_FileIsDirectory(entry : DirEntry*) : LibC::Int
  fun file_is_regular = LCUI_FileIsRegular(entry : DirEntry*) : LibC::Int
  struct ObjectTypeRec
    hash : LibC::UInt
    init : (Object -> Void)
    destroy : (Object -> Void)
    compare : (Object, Object -> LibC::Int)
    opreate : (Object, LibC::Char*, ObjectRec* -> Object)
    duplicate : (Object, ObjectRec* -> Void)
    tostring : (Object, Object -> Void)
  end
  struct ObjectRec
    type : ObjectTypeRec*
    number : LibC::Double
    string : LibC::Char*
    wstring : WcharT*
    data : Void*
    value : ObjectValueUnion
    size : LibC::SizeT
    watchers : LinkedListRec*
  end
  alias Object = ObjectRec*
  union ObjectValueUnion
    number : LibC::Double
    string : LibC::Char*
    wstring : WcharT*
    data : Void*
  end
  struct LinkedListRec
    length : LibC::SizeT
    head : LinkedListNodeRec
    tail : LinkedListNodeRec
  end
  struct LinkedListNodeRec
    data : Void*
    prev : LinkedListNodeRec*
    next : LinkedListNodeRec*
  end
  alias ObjectWatcherRec = Void
    # 根据容器尺寸，获取指定区域中需要裁剪的区域
fun rect_get_cut_area = LCUIRect_GetCutArea(box_w : LibC::Int, box_h : LibC::Int, rect : Rect, cut : Rect*)
    # 将矩形区域范围调整在容器有效范围内
fun rect_validate_area = LCUIRect_ValidateArea(rect : Rect*, box_w : LibC::Int, box_h : LibC::Int) : Bool
  fun rect_f_validate_area = LCUIRectF_ValidateArea(rect : RectF*, box_w : LibC::Float, box_h : LibC::Float) : Bool
  fun rect_to_rect_f = LCUIRect_ToRectF(rect : Rect*, rectf : RectF*, scale : LibC::Float)
  fun rect_scale = LCUIRect_Scale(src : Rect*, dst : Rect*, scale : LibC::Float)
  fun rect_f_to_rect = LCUIRectF_ToRect(rectf : RectF*, rect : Rect*, scale : LibC::Float)
    # 检测矩形是否遮盖另一个矩形
fun rect_is_cover_rect = LCUIRect_IsCoverRect(a : Rect*, b : Rect*) : Bool
  fun rect_f_is_cover_rect = LCUIRectF_IsCoverRect(a : RectF*, b : RectF*) : Bool
    # 获取两个矩形中的重叠矩形
fun rect_get_overlay_rect = LCUIRect_GetOverlayRect(a : Rect*, b : Rect*, out : Rect*) : Bool
  fun rect_f_get_overlay_rect = LCUIRectF_GetOverlayRect(a : RectF*, b : RectF*, out : RectF*) : Bool
    # 合并两个矩形
fun rect_merge_rect = LCUIRect_MergeRect(big : Rect*, a : Rect*, b : Rect*)
  fun rect_f_merge_rect = LCUIRectF_MergeRect(big : RectF*, a : RectF*, b : RectF*)
    # 根据重叠矩形 rect1，将矩形 rect2 分割成四个矩形 分割方法如下： ┏━━┳━━━━━━┓ ┃ ┃ 3 ┃ ┃ 0 ┣━━━┳━━┃ ┃ ┃rect1 ┃ ┃ ┃ ┃ ┃ 2 ┃ ┣━━┻━━━┫ ┃ ┃ 1 ┃ ┃ ┗━━━━━━┻━━┛
fun rect_cut_four_rect = LCUIRect_CutFourRect(rect1 : Rect*, rect2 : Rect*, rects : Rect[4])
  fun rect_split = LCUIRect_Split(base : Rect*, target : Rect*, rects : Rect[4])
  fun rect_f_is_equals = LCUIRectF_IsEquals(a : RectF*, b : RectF*) : Bool
  fun rect_is_equals = LCUIRect_IsEquals(a : Rect*, b : Rect*) : Bool
  struct EventRec
        # 事件类型
type : LibC::Int
        # 事件附加数据
data : Void*
  end
  struct EventTriggerRec
        # 事件处理器ID
handler_base_id : LibC::Int
        # 事件绑定记录
events : RbTreeRec
        # 事件处理器记录
handlers : RbTreeRec
  end
  struct RbTreeRec
    total_node : LibC::Int
    compare : (Void*, Void* -> LibC::Int)
    destroy : (Void* -> Void)
    root : RbTreeNodeRec*
  end
  struct RbTreeNodeRec
    color : UInt8
    key : LibC::Int
    data : Void*
    str : LibC::Char*
    parent : RbTreeNodeRec*
    left : RbTreeNodeRec*
    right : RbTreeNodeRec*
  end
  struct TaskRec
        # 任务处理函数
func : TaskFunc
        # 两个参数
arg : Void*[2]
        # 参数的销毁函数
destroy_arg : (Void* -> Void)[2]
  end
  alias TaskFunc = (Void*, Void* -> Void)
  fun task_destroy = LCUITask_Destroy(task : Task)
  alias Task = TaskRec*
  fun task_run = LCUITask_Run(task : Task) : LibC::Int
  fun decode_string = LCUI_DecodeString(wstr : WcharT*, str : LibC::Char*, max_len : LibC::SizeT, encoding : LibC::Int) : LibC::SizeT
  fun encode_string = LCUI_EncodeString(str : LibC::Char*, wstr : WcharT*, max_len : LibC::SizeT, encoding : LibC::Int) : LibC::SizeT
  struct TouchPointRec
    x : LibC::Int
    y : LibC::Int
    id : LibC::Int
    state : LibC::Int
    is_primary : Bool
  end
  struct PaintEvent
    rect : Rect
  end
  struct KeyboardEvent
        # The virtual-key code of the nonsystem key
code : LibC::Int
        # whether the Ctrl key was active when the key event was generated
ctrl_key : Bool
        # whether the Shift key was active when the key event was generated
shift_key : Bool
  end
  struct MouseMotionEvent
    x : LibC::Int
    y : LibC::Int
    xrel : LibC::Int
    yrel : LibC::Int
  end
  struct MouseButtonEvent
    x : LibC::Int
    y : LibC::Int
    button : LibC::Int
  end
  struct MouseWheelEvent
    x : LibC::Int
    y : LibC::Int
    delta : LibC::Int
  end
  struct TouchEvent
    n_points : LibC::Int
    points : TouchPoint
  end
  alias TouchPoint = TouchPointRec*
  struct TextInputEvent
    text : WcharT*
    length : LibC::SizeT
  end
  struct SysEventRec
    type : Uint32T
    data : Void*
    motion : MouseMotionEvent
    button : MouseButtonEvent
    wheel : MouseWheelEvent
    text : TextInputEvent
    key : KeyboardEvent
    touch : TouchEvent
    paint : PaintEvent
  end
  alias X__Uint32T = LibC::UInt
  alias Uint32T = X__Uint32T
  struct AppDriverRec
    id : AppDriverId
    process_events : ( -> Void)
    bind_sys_event : (LibC::Int, EventFunc, Void*, (Void* -> Void) -> LibC::Int)
    unbind_sys_event : (LibC::Int, EventFunc -> LibC::Int)
    unbind_sys_event2 : (LibC::Int -> LibC::Int)
    get_data : ( -> Void)
  end
  enum AppDriverId
    AppUnknown = 0
    AppLinux = 1
    AppLinuxX11 = 2
    AppWindows = 3
    AppUwp = 4
  end
  alias Event = EventRec*
  alias EventFunc = (Event, Void* -> Void)
  fun bind_event = LCUI_BindEvent(id : LibC::Int, func : SysEventFunc, data : Void*, destroy_data : (Void* -> Void)) : LibC::Int
  alias SysEvent = SysEventRec*
  alias SysEventFunc = (SysEvent, Void* -> Void)
  fun unbind_event = LCUI_UnbindEvent(handler_id : LibC::Int) : LibC::Int
  fun trigger_event = LCUI_TriggerEvent(e : SysEvent, arg : Void*) : LibC::Int
  fun create_touch_event = LCUI_CreateTouchEvent(e : SysEvent, points : TouchPoint, n_points : LibC::Int) : LibC::Int
  fun destroy_event = LCUI_DestroyEvent(e : SysEvent)
  fun bind_sys_event = LCUI_BindSysEvent(event_id : LibC::Int, func : EventFunc, data : Void*, destroy_data : (Void* -> Void)) : LibC::Int
  fun unbind_sys_event = LCUI_UnbindSysEvent(event_id : LibC::Int, func : EventFunc) : LibC::Int
  fun get_app_data = LCUI_GetAppData : Void*
  fun get_app_id = LCUI_GetAppId : AppDriverId
    # 处理当前所有事件
fun process_events = LCUI_ProcessEvents : LibC::SizeT
    # 添加任务 该任务将会添加至主线程中执行
fun post_task = LCUI_PostTask(task : Task) : Bool
    # 添加异步任务 该任务将会添加至指定 id 的工作线程中执行
fun post_async_task_to = LCUI_PostAsyncTaskTo(task : Task, target_worker_id : LibC::Int)
    # 添加异步任务 该任务将会添加至工作线程中执行
fun post_async_task = LCUI_PostAsyncTask(task : Task) : LibC::Int
  fun run_frame = LCUI_RunFrame
  fun run_frame_with_profile = LCUI_RunFrameWithProfile(profile : FrameProfile)
  alias FrameProfile = FrameProfileRec*
  fun main_loop_new = LCUIMainLoop_New : MainLoop
  alias MainLoop = Void*
  fun main_loop_run = LCUIMainLoop_Run(loop : MainLoop) : LibC::Int
  fun main_loop_quit = LCUIMainLoop_Quit(loop : MainLoop)
  fun main_loop_destroy = LCUIMainLoop_Destroy(loop : MainLoop)
  fun is_active = LCUI_IsActive : Bool
    # 获取当前帧数
fun get_frame_count = LCUI_GetFrameCount : LibC::Int
  fun init_base = LCUI_InitBase
  fun init_app = LCUI_InitApp(app : AppDriver)
  alias AppDriver = AppDriverRec*
    # 初始化 LCUI 各项功能
fun init = LCUI_Init
    # 进入 LCUI 主循环 调用该函数后，LCUI 会将当前线程作为 UI 线程，用于处理部件更新、布局、渲染等 与图形界面相关的任务。
fun main = LCUI_Main : LibC::Int
    # 获取LCUI的版本
fun get_version = LCUI_GetVersion : LibC::Char*
    # 释放LCUI占用的资源
fun destroy = LCUI_Destroy : LibC::Int
    # 退出LCUI，释放LCUI占用的资源
fun quit = LCUI_Quit
    # 退出 LCUI，并设置退出码
fun exit = LCUI_Exit(code : LibC::Int)
    # 检测当前是否在主线程上
fun is_on_main_loop = LCUI_IsOnMainLoop : Bool
  # $WStringObject : ObjectTypeRec*
  # $StringObject : ObjectTypeRec*
  # $NumberObject : ObjectTypeRec*
end
