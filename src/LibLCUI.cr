@[Link(ldflags: "`pkg-config --cflags --libs x11 xcb libpng fontconfig`")]
# Rest
@[Link(ldflags: "-L#{__DIR__}/../LCUI/src/.libs")]
@[Link(ldflags: "-lLCUI")]
@[Link(ldflags: "-I#{__DIR__}/../LCUI/include")]
@[Link(ldflags: "-I#{__DIR__}/../LCUI/")]
lib LibLCUI
  LCUI_MAX_FRAMES_PER_SEC = 120
  LCUI_DIRENT_NAME_LEN = 256
  union LcuiRgb565
    value : LibC::UShort
    b : UcharT
    g : UcharT
    r : UcharT
    blue : UcharT
    green : UcharT
    red : UcharT
  end
  alias UcharT = UInt8
  union LcuiArgb8888
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
  struct LcuiPos
    x : LibC::Int
    y : LibC::Int
  end
  struct LcuiSize
    width : LibC::Int
    height : LibC::Int
  end
  struct LcuiRect
    x : LibC::Int
    y : LibC::Int
    width : LibC::Int
    height : LibC::Int
  end
  struct LcuiRect2
    left : LibC::Int
    top : LibC::Int
    right : LibC::Int
    bottom : LibC::Int
  end
  struct LcuiRectF
    x : LibC::Float
    y : LibC::Float
    width : LibC::Float
    height : LibC::Float
  end
  struct LcuiRect2F
    left : LibC::Float
    top : LibC::Float
    right : LibC::Float
    bottom : LibC::Float
  end
  struct LcuiBoxShadowStyle
    x : LibC::Float
    y : LibC::Float
    blur : LibC::Float
    spread : LibC::Float
    color : LcuiColor
  end
  type LcuiColor = LcuiArgb8888
  struct LcuiBoxShadow
    x : LibC::Int
    y : LibC::Int
    blur : LibC::Int
    spread : LibC::Int
    color : LcuiColor
    top_left_radius : LibC::Int
    top_right_radius : LibC::Int
    bottom_left_radius : LibC::Int
    bottom_right_radius : LibC::Int
  end
  struct LcuiBorderStyle
    top : LcuiBorderStyleTop
    right : LcuiBorderStyleTop
    bottom : LcuiBorderStyleTop
    left : LcuiBorderStyleTop
    top_left_radius : LibC::Float
    top_right_radius : LibC::Float
    bottom_left_radius : LibC::Float
    bottom_right_radius : LibC::Float
  end
  struct LcuiBorderStyleTop
    style : LibC::Int
    width : LibC::Float
    color : LcuiColor
  end
  struct LcuiBorderLine
    style : LibC::Int
    width : LibC::UInt
    color : LcuiColor
  end
  struct LcuiBorder
    top : LcuiBorderLine
    right : LcuiBorderLine
    bottom : LcuiBorderLine
    left : LcuiBorderLine
    top_left_radius : LibC::UInt
    top_right_radius : LibC::UInt
    bottom_left_radius : LibC::UInt
    bottom_right_radius : LibC::UInt
  end
  struct LcuiGraph
    width : LibC::UInt
    height : LibC::UInt
    quote : LcuiGraphQuote
    bytes : UcharT*
    argb : LcuiArgb*
    color_type : LcuiColorType
    bytes_per_pixel : LibC::UInt
    bytes_per_row : LibC::UInt
    opacity : LibC::Float
    mem_size : LibC::SizeT
    palette : UcharT*
  end
  struct LcuiGraphQuote
    top : LibC::Int
    left : LibC::Int
    is_valid : LcuiBool
    is_writable : LcuiBool
    source : LcuiGraph*
    source_ro : LcuiGraph*
  end
  alias LcuiBool = UInt8
  type LcuiArgb = LcuiArgb8888
    # 色彩模式
enum LcuiColorType
        # 8位索引
LcuiColorTypeIndex8 = 0
        # 8位灰度
LcuiColorTypeGray8 = 1
        # RGB323
LcuiColorTypeRgb323 = 2
        # ARGB2222
LcuiColorTypeArgb2222 = 3
        # RGB555
LcuiColorTypeRgb555 = 4
        # RGB565
LcuiColorTypeRgb565 = 5
        # RGB888
LcuiColorTypeRgb888 = 6
        # RGB8888
LcuiColorTypeArgb8888 = 7
  end
  struct LcuiStyleRec
    is_valid : LcuiBool
    type : LcuiStyleType
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
    style : LcuiStyleValue
    val_style : LcuiStyleValue
    scale : LibC::Float
    val_scale : LibC::Float
    string : LibC::Char*
    val_string : LibC::Char*
    wstring : WcharT*
    val_wstring : WcharT*
    color : LcuiColor
    val_color : LcuiColor
    image : LcuiGraph*
    val_image : LcuiGraph*
    val_bool : LcuiBool
  end
    # 样式变量类型
enum LcuiStyleType
    LcuiStypeNone = 0
    LcuiStypeAuto = 1
    LcuiStypeScale = 2
    LcuiStypePx = 3
    LcuiStypePt = 4
    LcuiStypeDip = 5
    LcuiStypeSp = 6
    LcuiStypeColor = 7
    LcuiStypeImage = 8
    LcuiStypeStyle = 9
    LcuiStypeInt = 10
    LcuiStypeBool = 11
    LcuiStypeString = 12
    LcuiStypeWstring = 13
  end
  enum LcuiStyleValue
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
  struct LcuiFlexLayoutStyle
        # The flex shrink factor of a flex item See more: https://developer.mozilla.org/en-US/docs/Web/CSS/flex-shrink
shrink : LibC::Float
    grow : LibC::Float
        # The initial main size of a flex item See more: https://developer.mozilla.org/en-US/docs/Web/CSS/flex-basis
basis : LibC::Float
    wrap : LcuiStyleValue
    direction : LcuiStyleValue
        # Sets the align-self value on all direct children as a group See more: https://developer.mozilla.org/en-US/docs/Web/CSS/align-items
align_items : LcuiStyleValue
        # Sets the distribution of space between and around content items along a flexbox's cross-axis See more: https://developer.mozilla.org/en-US/docs/Web/CSS/align-content
align_content : LcuiStyleValue
        # Defines how the browser distributes space between and around content items along the main-axis of a flex container See more: https://developer.mozilla.org/en-US/docs/Web/CSS/justify-content
justify_content : LcuiStyleValue
  end
  struct LcuiBoundBoxRec
    top : LcuiStyleRec
    right : LcuiStyleRec
    bottom : LcuiStyleRec
    left : LcuiStyleRec
  end
  struct LcuiBackgroundPosition
    using_value : LcuiBool
    x : LcuiStyleRec
    y : LcuiStyleRec
    value : LibC::Int
  end
  struct LcuiBackgroundSize
    using_value : LcuiBool
    width : LcuiStyleRec
    height : LcuiStyleRec
    value : LibC::Int
  end
  struct LcuiBackgroundStyle
        # 背景图
image : LcuiGraph
        # 背景色
color : LcuiColor
        # 背景图是否重复
repeat : LcuiBackgroundStyleRepeat
        # 定位方式
position : LcuiBackgroundPosition
        # 尺寸
size : LcuiBackgroundSize
  end
  struct LcuiBackgroundStyleRepeat
    x : LcuiBool
    y : LcuiBool
  end
  struct LcuiBackground
        # 背景图
image : LcuiGraph*
        # 背景色
color : LcuiColor
        # 背景图是否重复
repeat : LcuiBackgroundRepeat
    position : LcuiBackgroundPosition
    size : LcuiBackgroundSize
  end
  struct LcuiBackgroundRepeat
    x : LcuiBool
    y : LcuiBool
  end
  struct LcuiPaintContextRec
        # 需要绘制的区域
rect : LcuiRect
        # 绘制后的位图缓存（可称为：画布）
canvas : LcuiGraph
        # 绘制时是否需要处理 alpha 通道
with_alpha : LcuiBool
  end
  struct LcuiWidgetTasksRec
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
  struct LcuiFrameProfileRec
    timers_count : LibC::SizeT
    timers_time : ClockT
    events_count : LibC::SizeT
    events_time : ClockT
    render_count : LibC::SizeT
    render_time : ClockT
    present_time : ClockT
    widget_tasks : LcuiWidgetTasksProfileRec
  end
  type LcuiWidgetTasksProfileRec = LcuiWidgetTasksRec
  struct LcuiProfileRec
    start_time : ClockT
    end_time : ClockT
    frames_count : LibC::UInt
    frames : LcuiFrameProfileRec[120]
  end
  fun lcui_time_init = LCUITime_Init
  fun lcui_get_time = LCUI_GetTime : Int64T
  alias X__Int64T = LibC::Long
  alias Int64T = X__Int64T
  fun lcui_get_time_delta = LCUI_GetTimeDelta(start : Int64T) : Int64T
  fun lcui_sleep = LCUI_Sleep(s : LibC::UInt)
  fun lcui_m_sleep = LCUI_MSleep(ms : LibC::UInt)
  struct LcuiDirEntry
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
  struct LcuiDir
    handle : LcuiDirHandle
    entry : LcuiDirEntry
    cached : LibC::Int
  end
  type Dir = Void*
  alias LcuiDirHandle = Dir
  fun lcui_open_dir_w = LCUI_OpenDirW(filepath : WcharT*, dir : LcuiDir*) : LibC::Int
  fun lcui_open_dir_a = LCUI_OpenDirA(filepath : LibC::Char*, dir : LcuiDir*) : LibC::Int
  fun lcui_read_dir_a = LCUI_ReadDirA(dir : LcuiDir*) : LcuiDirEntry*
  fun lcui_read_dir_w = LCUI_ReadDirW(dir : LcuiDir*) : LcuiDirEntry*
  fun lcui_close_dir = LCUI_CloseDir(dir : LcuiDir*) : LibC::Int
  fun lcui_get_file_name_a = LCUI_GetFileNameA(entry : LcuiDirEntry*) : LibC::Char*
  fun lcui_get_file_name_w = LCUI_GetFileNameW(entry : LcuiDirEntry*) : WcharT*
  fun lcui_file_is_directory = LCUI_FileIsDirectory(entry : LcuiDirEntry*) : LibC::Int
  fun lcui_file_is_regular = LCUI_FileIsRegular(entry : LcuiDirEntry*) : LibC::Int
  struct LcuiObjectTypeRec
    hash : LibC::UInt
    init : (LcuiObject -> Void)
    destroy : (LcuiObject -> Void)
    compare : (LcuiObject, LcuiObject -> LibC::Int)
    opreate : (LcuiObject, LibC::Char*, LcuiObjectRec* -> LcuiObject)
    duplicate : (LcuiObject, LcuiObjectRec* -> Void)
    tostring : (LcuiObject, LcuiObject -> Void)
  end
  struct LcuiObjectRec
    type : LcuiObjectTypeRec*
    value : LcuiObjectValueUnion
    size : LibC::SizeT
    watchers : LinkedList*
  end
  alias LcuiObject = LcuiObjectRec*
  union LcuiObjectValueUnion
    number : LibC::Double
    string : LibC::Char*
    wstring : WcharT*
    data : Void*
  end
  struct LinkedListRec
    length : LibC::SizeT
    head : LinkedListNode
    tail : LinkedListNode
  end
  type LinkedList = LinkedListRec
  struct LinkedListNodeRec
    data : Void*
    prev : LinkedListNode*
    next : LinkedListNode*
  end
  type LinkedListNode = LinkedListNodeRec
  alias LcuiObjectWatcherRec = Void
    # 根据容器尺寸，获取指定区域中需要裁剪的区域
fun lcui_rect_get_cut_area = LCUIRect_GetCutArea(box_w : LibC::Int, box_h : LibC::Int, rect : LcuiRect, cut : LcuiRect*)
    # 将矩形区域范围调整在容器有效范围内
fun lcui_rect_validate_area = LCUIRect_ValidateArea(rect : LcuiRect*, box_w : LibC::Int, box_h : LibC::Int) : LcuiBool
  fun lcui_rect_f_validate_area = LCUIRectF_ValidateArea(rect : LcuiRectF*, box_w : LibC::Float, box_h : LibC::Float) : LcuiBool
  fun lcui_rect_to_rect_f = LCUIRect_ToRectF(rect : LcuiRect*, rectf : LcuiRectF*, scale : LibC::Float)
  fun lcui_rect_scale = LCUIRect_Scale(src : LcuiRect*, dst : LcuiRect*, scale : LibC::Float)
  fun lcui_rect_f_to_rect = LCUIRectF_ToRect(rectf : LcuiRectF*, rect : LcuiRect*, scale : LibC::Float)
    # 检测矩形是否遮盖另一个矩形
fun lcui_rect_is_cover_rect = LCUIRect_IsCoverRect(a : LcuiRect*, b : LcuiRect*) : LcuiBool
  fun lcui_rect_f_is_cover_rect = LCUIRectF_IsCoverRect(a : LcuiRectF*, b : LcuiRectF*) : LcuiBool
    # 获取两个矩形中的重叠矩形
fun lcui_rect_get_overlay_rect = LCUIRect_GetOverlayRect(a : LcuiRect*, b : LcuiRect*, out : LcuiRect*) : LcuiBool
  fun lcui_rect_f_get_overlay_rect = LCUIRectF_GetOverlayRect(a : LcuiRectF*, b : LcuiRectF*, out : LcuiRectF*) : LcuiBool
    # 合并两个矩形
fun lcui_rect_merge_rect = LCUIRect_MergeRect(big : LcuiRect*, a : LcuiRect*, b : LcuiRect*)
  fun lcui_rect_f_merge_rect = LCUIRectF_MergeRect(big : LcuiRectF*, a : LcuiRectF*, b : LcuiRectF*)
    # 根据重叠矩形 rect1，将矩形 rect2 分割成四个矩形 分割方法如下： ┏━━┳━━━━━━┓ ┃ ┃ 3 ┃ ┃ 0 ┣━━━┳━━┃ ┃ ┃rect1 ┃ ┃ ┃ ┃ ┃ 2 ┃ ┣━━┻━━━┫ ┃ ┃ 1 ┃ ┃ ┗━━━━━━┻━━┛
fun lcui_rect_cut_four_rect = LCUIRect_CutFourRect(rect1 : LcuiRect*, rect2 : LcuiRect*, rects : LcuiRect[4])
  fun lcui_rect_split = LCUIRect_Split(base : LcuiRect*, target : LcuiRect*, rects : LcuiRect[4])
  fun lcui_rect_f_is_equals = LCUIRectF_IsEquals(a : LcuiRectF*, b : LcuiRectF*) : LcuiBool
  fun lcui_rect_is_equals = LCUIRect_IsEquals(a : LcuiRect*, b : LcuiRect*) : LcuiBool
  struct LcuiEventRec
        # 事件类型
type : LibC::Int
        # 事件附加数据
data : Void*
  end
  struct LcuiEventTriggerRec
        # 事件处理器ID
handler_base_id : LibC::Int
        # 事件绑定记录
events : RbTree
        # 事件处理器记录
handlers : RbTree
  end
  struct RbTreeRec
    total_node : LibC::Int
    compare : (Void*, Void* -> LibC::Int)
    destroy : (Void* -> Void)
    root : RbTreeNode*
  end
  type RbTree = RbTreeRec
  struct RbTreeNodeRec
    color : UInt8
    key : LibC::Int
    data : Void*
    str : LibC::Char*
    parent : RbTreeNode*
    left : RbTreeNode*
    right : RbTreeNode*
  end
  type RbTreeNode = RbTreeNodeRec
  struct LcuiTaskRec
        # 任务处理函数
func : LcuiTaskFunc
        # 两个参数
arg : Void*[2]
        # 参数的销毁函数
destroy_arg : (Void* -> Void)[2]
  end
  alias LcuiTaskFunc = (Void*, Void* -> Void)
  fun lcui_task_destroy = LCUITask_Destroy(task : LcuiTask)
  alias LcuiTask = LcuiTaskRec*
  fun lcui_task_run = LCUITask_Run(task : LcuiTask) : LibC::Int
  fun lcui_decode_string = LCUI_DecodeString(wstr : WcharT*, str : LibC::Char*, max_len : LibC::SizeT, encoding : LibC::Int) : LibC::SizeT
  fun lcui_encode_string = LCUI_EncodeString(str : LibC::Char*, wstr : WcharT*, max_len : LibC::SizeT, encoding : LibC::Int) : LibC::SizeT
  struct LcuiTouchPointRec
    x : LibC::Int
    y : LibC::Int
    id : LibC::Int
    state : LibC::Int
    is_primary : LcuiBool
  end
  struct LcuiPaintEvent
    rect : LcuiRect
  end
  struct LcuiKeyboardEvent
        # The virtual-key code of the nonsystem key
code : LibC::Int
        # whether the Ctrl key was active when the key event was generated
ctrl_key : LcuiBool
        # whether the Shift key was active when the key event was generated
shift_key : LcuiBool
  end
  struct LcuiMouseMotionEvent
    x : LibC::Int
    y : LibC::Int
    xrel : LibC::Int
    yrel : LibC::Int
  end
  struct LcuiMouseButtonEvent
    x : LibC::Int
    y : LibC::Int
    button : LibC::Int
  end
  struct LcuiMouseWheelEvent
    x : LibC::Int
    y : LibC::Int
    delta : LibC::Int
  end
  struct LcuiTouchEvent
    n_points : LibC::Int
    points : LcuiTouchPoint
  end
  alias LcuiTouchPoint = LcuiTouchPointRec*
  struct LcuiTextInputEvent
    text : WcharT*
    length : LibC::SizeT
  end
  struct LcuiSysEventRec
    type : Uint32T
    data : Void*
    motion : LcuiMouseMotionEvent
    button : LcuiMouseButtonEvent
    wheel : LcuiMouseWheelEvent
    text : LcuiTextInputEvent
    key : LcuiKeyboardEvent
    touch : LcuiTouchEvent
    paint : LcuiPaintEvent
  end
  alias X__Uint32T = LibC::UInt
  alias Uint32T = X__Uint32T
  struct LcuiAppDriverRec
    id : LcuiAppDriverId
    process_events : ( -> Void)
    bind_sys_event : (LibC::Int, LcuiEventFunc, Void*, (Void* -> Void) -> LibC::Int)
    unbind_sys_event : (LibC::Int, LcuiEventFunc -> LibC::Int)
    unbind_sys_event2 : (LibC::Int -> LibC::Int)
    get_data : ( -> Void)
  end
  enum LcuiAppDriverId
    LcuiAppUnknown = 0
    LcuiAppLinux = 1
    LcuiAppLinuxX11 = 2
    LcuiAppWindows = 3
    LcuiAppUwp = 4
  end
  alias LcuiEvent = LcuiEventRec*
  alias LcuiEventFunc = (LcuiEvent, Void* -> Void)
  fun lcui_bind_event = LCUI_BindEvent(id : LibC::Int, func : LcuiSysEventFunc, data : Void*, destroy_data : (Void* -> Void)) : LibC::Int
  alias LcuiSysEvent = LcuiSysEventRec*
  alias LcuiSysEventFunc = (LcuiSysEvent, Void* -> Void)
  fun lcui_unbind_event = LCUI_UnbindEvent(handler_id : LibC::Int) : LibC::Int
  fun lcui_trigger_event = LCUI_TriggerEvent(e : LcuiSysEvent, arg : Void*) : LibC::Int
  fun lcui_create_touch_event = LCUI_CreateTouchEvent(e : LcuiSysEvent, points : LcuiTouchPoint, n_points : LibC::Int) : LibC::Int
  fun lcui_destroy_event = LCUI_DestroyEvent(e : LcuiSysEvent)
  fun lcui_bind_sys_event = LCUI_BindSysEvent(event_id : LibC::Int, func : LcuiEventFunc, data : Void*, destroy_data : (Void* -> Void)) : LibC::Int
  fun lcui_unbind_sys_event = LCUI_UnbindSysEvent(event_id : LibC::Int, func : LcuiEventFunc) : LibC::Int
  fun lcui_get_app_data = LCUI_GetAppData : Void*
  fun lcui_get_app_id = LCUI_GetAppId : LcuiAppDriverId
    # 处理当前所有事件
fun lcui_process_events = LCUI_ProcessEvents : LibC::SizeT
    # 添加任务 该任务将会添加至主线程中执行
fun lcui_post_task = LCUI_PostTask(task : LcuiTask) : LcuiBool
    # 添加异步任务 该任务将会添加至指定 id 的工作线程中执行
fun lcui_post_async_task_to = LCUI_PostAsyncTaskTo(task : LcuiTask, target_worker_id : LibC::Int)
    # 添加异步任务 该任务将会添加至工作线程中执行
fun lcui_post_async_task = LCUI_PostAsyncTask(task : LcuiTask) : LibC::Int
  fun lcui_run_frame = LCUI_RunFrame
  fun lcui_run_frame_with_profile = LCUI_RunFrameWithProfile(profile : LcuiFrameProfile)
  alias LcuiFrameProfile = LcuiFrameProfileRec*
  fun lcui_main_loop_new = LCUIMainLoop_New : LcuiMainLoop
  alias LcuiMainLoop = Void*
  fun lcui_main_loop_run = LCUIMainLoop_Run(loop : LcuiMainLoop) : LibC::Int
  fun lcui_main_loop_quit = LCUIMainLoop_Quit(loop : LcuiMainLoop)
  fun lcui_main_loop_destroy = LCUIMainLoop_Destroy(loop : LcuiMainLoop)
  fun lcui_is_active = LCUI_IsActive : LcuiBool
    # 获取当前帧数
fun lcui_get_frame_count = LCUI_GetFrameCount : LibC::Int
  fun lcui_init_base = LCUI_InitBase
  fun lcui_init_app = LCUI_InitApp(app : LcuiAppDriver)
  alias LcuiAppDriver = LcuiAppDriverRec*
    # 初始化 LCUI 各项功能
fun lcui_init = LCUI_Init
    # 进入 LCUI 主循环 调用该函数后，LCUI 会将当前线程作为 UI 线程，用于处理部件更新、布局、渲染等 与图形界面相关的任务。
fun lcui_main = LCUI_Main : LibC::Int
    # 获取LCUI的版本
fun lcui_get_version = LCUI_GetVersion : LibC::Char*
    # 释放LCUI占用的资源
fun lcui_destroy = LCUI_Destroy : LibC::Int
    # 退出LCUI，释放LCUI占用的资源
fun lcui_quit = LCUI_Quit
    # 退出 LCUI，并设置退出码
fun lcui_exit = LCUI_Exit(code : LibC::Int)
    # 检测当前是否在主线程上
fun lcui_is_on_main_loop = LCUI_IsOnMainLoop : LcuiBool
  fun lcui_over_pixel = LCUI_OverPixel(dst : LcuiArgb*, src : LcuiArgb*)
  fun lcui_mutex_init = LCUIMutex_Init(mutex : LcuiMutex*) : LibC::Int
  union PthreadMutexT
    __data : X__PthreadMutexS
    __size : LibC::Char[40]
    __align : LibC::Long
  end
  alias LcuiMutex = PthreadMutexT
  struct X__PthreadMutexS
    __lock : LibC::Int
    __count : LibC::UInt
    __owner : LibC::Int
    __nusers : LibC::UInt
    __kind : LibC::Int
    __spins : LibC::Short
    __elision : LibC::Short
    __list : X__PthreadListT
  end
  struct X__PthreadInternalList
    __prev : X__PthreadInternalList*
    __next : X__PthreadInternalList*
  end
  type X__PthreadListT = X__PthreadInternalList
  fun lcui_mutex_destroy = LCUIMutex_Destroy(mutex : LcuiMutex*)
  fun lcui_mutex_try_lock = LCUIMutex_TryLock(mutex : LcuiMutex*) : LibC::Int
  fun lcui_mutex_lock = LCUIMutex_Lock(mutex : LcuiMutex*) : LibC::Int
  fun lcui_mutex_unlock = LCUIMutex_Unlock(mutex : LcuiMutex*) : LibC::Int
    # 初始化一个条件变量
fun lcui_cond_init = LCUICond_Init(cond : LcuiCond*) : LibC::Int
  union PthreadCondT
    __data : X__PthreadCondS
    __size : LibC::Char[48]
    __align : LibC::LongLong
  end
  alias LcuiCond = PthreadCondT
  struct X__PthreadCondS
    __wseq : LibC::ULongLong
    __wseq32 : X__PthreadCondSWseq32
    __g1_start : LibC::ULongLong
    __low : LibC::UInt
    __high : LibC::UInt
    __g1_start32 : X__PthreadCondSG1Start32
    __g_refs : LibC::UInt[2]
    __g_size : LibC::UInt[2]
    __g1_orig_size : LibC::UInt
    __wrefs : LibC::UInt
    __g_signals : LibC::UInt[2]
  end
  struct X__PthreadCondSWseq32
    __low : LibC::UInt
    __high : LibC::UInt
  end
  struct X__PthreadCondSG1Start32
    __low : LibC::UInt
    __high : LibC::UInt
  end
    # 销毁一个条件变量
fun lcui_cond_destroy = LCUICond_Destroy(cond : LcuiCond*) : LibC::Int
    # 阻塞当前线程，等待条件成立
fun lcui_cond_wait = LCUICond_Wait(cond : LcuiCond*, mutex : LcuiMutex*) : LibC::Int
    # 计时阻塞当前线程，等待条件成立
fun lcui_cond_timed_wait = LCUICond_TimedWait(cond : LcuiCond*, mutex : LcuiMutex*, ms : LibC::UInt) : LibC::Int
    # 唤醒一个阻塞等待条件成立的线程
fun lcui_cond_signal = LCUICond_Signal(cond : LcuiCond*) : LibC::Int
    # 唤醒所有阻塞等待条件成立的线程
fun lcui_cond_broadcast = LCUICond_Broadcast(cond : LcuiCond*) : LibC::Int
  fun lcui_thread_self_id = LCUIThread_SelfID : LcuiThread
  alias PthreadT = LibC::ULong
  alias LcuiThread = PthreadT
  fun lcui_thread_create = LCUIThread_Create(tidp : LcuiThread*, start_rtn : (Void* -> Void), arg : Void*) : LibC::Int
  fun lcui_thread_join = LCUIThread_Join(thread : LcuiThread, retval : Void**) : LibC::Int
  fun lcui_thread_cancel = LCUIThread_Cancel(thread : LcuiThread)
  fun lcui_thread_exit = LCUIThread_Exit(retval : Void*)
  struct LcuiStyleSheetRec
    sheet : LcuiStyle
    length : LibC::Int
  end
  alias LcuiStyle = LcuiStyleRec*
  struct LcuiStyleListNodeRec
    key : LibC::Int
    style : LcuiStyleRec
    node : LinkedListNode
  end
  struct LcuiSelectorNodeRec
        # ID
id : LibC::Char*
        # 类型名称
type : LibC::Char*
        # 样式类列表
classes : LibC::Char**
        # 状态列表
status : LibC::Char**
        # 全名，由 id、type、classes、status 组合而成
fullname : LibC::Char*
        # 权值
rank : LibC::Int
  end
  struct LcuiSelectorRec
        # 权值，决定优先级
rank : LibC::Int
        # 批次号
batch_num : LibC::Int
        # 选择器结点长度
length : LibC::Int
        # 哈希值
hash : LibC::UInt
        # 选择器结点列表
nodes : LcuiSelectorNode*
  end
  alias LcuiSelectorNode = LcuiSelectorNodeRec*
  fun lcui_put_style_sheet = LCUI_PutStyleSheet(selector : LcuiSelector, in_ss : LcuiStyleSheet, space : LibC::Char*) : LibC::Int
  alias LcuiSelector = LcuiSelectorRec*
  alias LcuiStyleSheet = LcuiStyleSheetRec*
    # 从指定组中查找样式表
fun lcui_find_style_sheet_from_group = LCUI_FindStyleSheetFromGroup(group : LibC::Int, name : LibC::Char*, s : LcuiSelector, list : LinkedList*) : LibC::Int
  fun lcui_get_cached_style_sheet = LCUI_GetCachedStyleSheet(s : LcuiSelector) : LcuiCachedStyleSheet
  alias LcuiCachedStyleSheet = LcuiStyleSheetRec*
  fun lcui_get_style_sheet = LCUI_GetStyleSheet(s : LcuiSelector, out_ss : LcuiStyleSheet)
  fun lcui_print_style_sheets_by_selector = LCUI_PrintStyleSheetsBySelector(s : LcuiSelector)
  fun lcui_set_style_name = LCUI_SetStyleName(key : LibC::Int, name : LibC::Char*) : LibC::Int
  fun lcui_add_css_property_name = LCUI_AddCSSPropertyName(name : LibC::Char*) : LibC::Int
  fun lcui_add_style_value = LCUI_AddStyleValue(key : LibC::Int, name : LibC::Char*) : LibC::Int
  fun lcui_get_style_value = LCUI_GetStyleValue(str : LibC::Char*) : LibC::Int
  fun lcui_get_style_value_name = LCUI_GetStyleValueName(val : LibC::Int) : LibC::Char*
  fun lcui_get_style_name = LCUI_GetStyleName(key : LibC::Int) : LibC::Char*
  fun lcui_get_style_total = LCUI_GetStyleTotal : LibC::Int
  fun lcui_print_style_sheet = LCUI_PrintStyleSheet(ss : LcuiStyleSheet)
  fun lcui_print_selector = LCUI_PrintSelector(selector : LcuiSelector)
  fun lcui_print_css_library = LCUI_PrintCSSLibrary
  fun lcui_init_css_library = LCUI_InitCSSLibrary
  fun lcui_free_css_library = LCUI_FreeCSSLibrary
  struct LcuiWidgetStyle
    visible : LcuiBool
    focusable : LcuiBool
    width_sizing : LcuiSizingRule
    height_sizing : LcuiSizingRule
    min_width : LibC::Float
    min_height : LibC::Float
    max_width : LibC::Float
    max_height : LibC::Float
    left : LibC::Float
    top : LibC::Float
    right : LibC::Float
    bottom : LibC::Float
    z_index : LibC::Int
    opacity : LibC::Float
    position : LcuiStyleValue
    display : LcuiStyleValue
    box_sizing : LcuiStyleValue
    vertical_align : LcuiStyleValue
    border : LcuiBorderStyle
    shadow : LcuiBoxShadowStyle
    background : LcuiBackgroundStyle
    flex : LcuiFlexBoxLayoutStyle
    pointer_events : LibC::Int
  end
  enum LcuiSizingRule
    LcuiSizingRuleNone = 0
    LcuiSizingRuleFixed = 1
    LcuiSizingRuleFill = 2
    LcuiSizingRulePercent = 3
    LcuiSizingRuleFitContent = 4
  end
  type LcuiFlexBoxLayoutStyle = LcuiFlexLayoutStyle
  struct LcuiWidgetActualStyleRec
    x : LibC::Float
    y : LibC::Float
    canvas_box : LcuiRect
    border_box : LcuiRect
    padding_box : LcuiRect
    content_box : LcuiRect
    border : LcuiBorder
    shadow : LcuiBoxShadow
    background : LcuiBackground
  end
  struct LcuiWidgetBoxModelRec
    content : LcuiRectF
    padding : LcuiRectF
    border : LcuiRectF
    canvas : LcuiRectF
    outer : LcuiRectF
  end
  struct LcuiWidgetTaskRec
        # Should update for self?
for_self : LcuiBool
        # Should update for children?
for_children : LcuiBool
        # Should skip the property sync of bound surface?
skip_surface_props_sync : LcuiBool
        # States of tasks
states : LcuiBool[19]
  end
  struct LcuiWidgetRec
    hash : LibC::UInt
    state : LcuiWidgetState
    id : LibC::Char*
    type : LibC::Char*
    classes : StrlistT
    status : StrlistT
    title : WcharT*
    attributes : Dict*
    disabled : LcuiBool
    event_blocked : LcuiBool
        # Coordinates calculated by the layout system The position of the rectangular boxes is calculated based on it
layout_x : LibC::Float
        # Coordinates calculated by the layout system The position of the rectangular boxes is calculated based on it
layout_y : LibC::Float
        # Geometric parameters (readonly) Their values come from the box.border
x : LibC::Float
        # Geometric parameters (readonly) Their values come from the box.border
y : LibC::Float
        # Geometric parameters (readonly) Their values come from the box.border
width : LibC::Float
        # Geometric parameters (readonly) Their values come from the box.border
height : LibC::Float
        # A box’s “ideal” size in a given axis when given infinite available space. See more: https://drafts.csswg.org/css-sizing-3/#max-content
max_content_width : LibC::Float
        # A box’s “ideal” size in a given axis when given infinite available space. See more: https://drafts.csswg.org/css-sizing-3/#max-content
max_content_height : LibC::Float
    padding : LcuiRect2F
    margin : LcuiRect2F
    box : LcuiWidgetBoxModelRec
    style : LcuiStyleSheet
    custom_style : LcuiStyleList
    inherited_style : LcuiCachedStyleSheet
    computed_style : LcuiWidgetStyle
        # Some data bound to the prototype
data : LcuiWidgetData
        # Prototype chain It is used to implement the inheritance of widgets, Just like prototype chain in JavaScript
proto : LcuiWidgetPrototypeC
        # Update task context
task : LcuiWidgetTaskRec
    rules : LcuiWidgetRules
    trigger : LcuiEventTrigger
        # Invalid area (Dirty Rectangle)
invalid_area : LcuiRectF
    invalid_area_type : LcuiInvalidAreaType
    has_child_invalid_area : LcuiBool
        # Parent widget
parent : LcuiWidget
        # List of child widgets
children : LinkedList
        # List of child widgets in descending order by z-index
children_show : LinkedList
        # Position in the parent->children this == LinkedList_Get(&this->parent->children, this.index)
index : LibC::SizeT
        # Node in the parent->children &this->node == LinkedList_GetNode(&this->parent->children, this.index)
node : LinkedListNode
        # Node in the parent->children_shoa
node_show : LinkedListNode
  end
    # 部件状态
enum LcuiWidgetState
    LcuiWstateCreated = 0
    LcuiWstateUpdated = 1
    LcuiWstateLayouted = 2
    LcuiWstateReady = 3
    LcuiWstateNormal = 4
    LcuiWstateDeleted = 5
  end
  alias StrlistT = LibC::Char**
  struct Dict
        # 为哈希表中不同类型的值所使用的一族函数
type : DictType*
    privdata : Void*
        # 每个字典使用两个哈希表
ht : DictHashTable[2]
        # rehash 进行到的索引位置，如果没有在 rehash ，就为 -1
rehashidx : LibC::Int
        # 当前正在使用的 iterator 的数量
iterators : LibC::Int
  end
  struct DictType
    hash_function : (Void* -> LibC::UInt)
    key_dup : (Void*, Void* -> Void)
    val_dup : (Void*, Void* -> Void)
    key_compare : (Void*, Void*, Void* -> LibC::Int)
    key_destructor : (Void*, Void* -> Void)
    val_destructor : (Void*, Void* -> Void)
  end
  struct DictHashTable
        # 节点指针数组
table : DictEntry**
        # 桶的数量
size : LibC::ULong
        # mask 码，用于地址索引计算
sizemask : LibC::ULong
        # 已有节点数量
used : LibC::ULong
  end
  struct DictEntry
    key : Void*
    v : DictEntryV
        # 指向下一个哈希节点(形成链表)
next : DictEntry*
  end
  union DictEntryV
    val : Void*
    u64 : Uint64T
    s64 : Int64T
  end
  alias X__Uint64T = LibC::ULong
  alias Uint64T = X__Uint64T
  alias LcuiStyleList = LinkedList*
  struct LcuiWidgetData
    length : LibC::UInt
    list : LcuiWidgetDataEntryRec*
  end
  struct LcuiWidgetDataEntryRec
    data : Void*
    proto : LcuiWidgetPrototype
  end
  struct LcuiWidgetPrototypeRec
    name : LibC::Char*
    init : LcuiWidgetFunction
    refresh : LcuiWidgetFunction
    destroy : LcuiWidgetFunction
    update : LcuiWidgetFunction
    runtask : LcuiWidgetTaskHandler
    setattr : LcuiWidgetAttrSetter
    settext : LcuiWidgetTextSetter
    bindprop : LcuiWidgetPropertyBinder
    autosize : LcuiWidgetSizeGetter
    resize : LcuiWidgetSizeSetter
    paint : LcuiWidgetPainter
    proto : LcuiWidgetPrototype
  end
  alias LcuiWidgetPrototype = LcuiWidgetPrototypeRec*
  alias LcuiWidget = LcuiWidgetRec*
  alias LcuiWidgetFunction = (LcuiWidget -> Void)
  alias LcuiWidgetTaskHandler = (LcuiWidget, LibC::Int -> Void)
  alias LcuiWidgetAttrSetter = (LcuiWidget, LibC::Char*, LibC::Char* -> Void)
  alias LcuiWidgetTextSetter = (LcuiWidget, LibC::Char* -> Void)
  alias LcuiWidgetPropertyBinder = (LcuiWidget, LibC::Char*, LcuiObject -> Void)
  enum LcuiLayoutRule
    LcuiLayoutRuleAuto = 0
    LcuiLayoutRuleMaxContent = 1
    LcuiLayoutRuleFixedWidth = 2
    LcuiLayoutRuleFixedHeight = 3
    LcuiLayoutRuleFixed = 4
  end
  alias LcuiWidgetSizeGetter = (LcuiWidget, LibC::Float*, LibC::Float*, LcuiLayoutRule -> Void)
  alias LcuiWidgetSizeSetter = (LcuiWidget, LibC::Float, LibC::Float -> Void)
  alias LcuiPaintContext = LcuiPaintContextRec*
  alias LcuiWidgetActualStyle = LcuiWidgetActualStyleRec*
  alias LcuiWidgetPainter = (LcuiWidget, LcuiPaintContext, LcuiWidgetActualStyle -> Void)
  alias LcuiWidgetPrototypeC = LcuiWidgetPrototypeRec*
  struct LcuiWidgetRulesRec
        # Suspend update if the current widget is not visible or is completely covered by other widgets
only_on_visible : LcuiBool
        # First update the children in the visible area If your widget has a lot of children and you want to see the children who are currently seeing the priority update, we recommend enabling this rule.
first_update_visible_children : LcuiBool
        # Cache the stylesheets of children to improve the query speed of the stylesheet. If this rule is enabled, we recommend that you manually call Widget_GenerateHash() to generate a hash value for the children of the widget.
cache_children_style : LcuiBool
        # Refresh the style of all child widgets if the status has changed
ignore_status_change : LcuiBool
        # Refresh the style of all child widgets if the classes has changed
ignore_classes_change : LcuiBool
        # Maximum number of children updated at each update values: -1 - Update all children at once 0 - Automatically calculates the appropriate maximum number N - Custom maximum number
max_update_children_count : LibC::Int
        # Limit the number of children rendered
max_render_children_count : LibC::UInt
        # A callback function on update progress
on_update_progress : (LcuiWidget, LibC::SizeT -> Void)
  end
  alias LcuiWidgetRules = LcuiWidgetRulesRec*
  alias LcuiEventTrigger = LcuiEventTriggerRec*
  enum LcuiInvalidAreaType
    LcuiInvalidAreaTypeNone = 0
    LcuiInvalidAreaTypeCustom = 1
    LcuiInvalidAreaTypePaddingBox = 2
    LcuiInvalidAreaTypeBorderBox = 3
    LcuiInvalidAreaTypeCanvasBox = 4
  end
  struct LcuiWidgetRulesDataRec
    rules : LcuiWidgetRulesRec
    style_cache : Dict*
    default_max_update_count : LibC::SizeT
    progress : LibC::SizeT
  end
  struct LcuiWidgetAttributeRec
    name : LibC::Char*
    value : LcuiWidgetAttributeRecValue
  end
  struct LcuiWidgetAttributeRecValue
    type : LibC::Int
    destructor : (Void* -> Void)
    string : LibC::Char*
    data : Void*
  end
  fun widget_is_flex_layout_style_works = Widget_IsFlexLayoutStyleWorks(w : LcuiWidget) : LcuiBool
  fun widget_compute_x_metric = Widget_ComputeXMetric(w : LcuiWidget, key : LibC::Int) : LibC::Float
  fun widget_compute_y_metric = Widget_ComputeYMetric(w : LcuiWidget, key : LibC::Int) : LibC::Float
  fun widget_has_auto_style = Widget_HasAutoStyle(w : LcuiWidget, key : LibC::Int) : LcuiBool
  fun lcui_widget_get_root = LCUIWidget_GetRoot : LcuiWidget
  fun lcui_widget_get_by_id = LCUIWidget_GetById(idstr : LibC::Char*) : LcuiWidget
    # Create a widget by prototype
fun lcui_widget_new_with_prototype = LCUIWidget_NewWithPrototype(proto : LcuiWidgetPrototypeC) : LcuiWidget
    # Create a widget by type name
fun lcui_widget_new = LCUIWidget_New(type_name : LibC::Char*) : LcuiWidget
    # Execute destruction task
fun widget_exec_destroy = Widget_ExecDestroy(w : LcuiWidget)
    # Mark a Widget needs to be destroyed
fun widget_destroy = Widget_Destroy(w : LcuiWidget)
  fun widget_get_offset = Widget_GetOffset(w : LcuiWidget, parent : LcuiWidget, offset_x : LibC::Float*, offset_y : LibC::Float*)
  fun widget_top = Widget_Top(w : LcuiWidget) : LibC::Int
  fun widget_sort_children_show = Widget_SortChildrenShow(w : LcuiWidget)
  fun widget_set_title_w = Widget_SetTitleW(w : LcuiWidget, title : WcharT*)
  fun widget_add_state = Widget_AddState(w : LcuiWidget, state : LcuiWidgetState)
    # Check whether the widget is in the visible area
fun widget_in_visible_area = Widget_InVisibleArea(w : LcuiWidget) : LcuiBool
    # Set widget updating rules
fun widget_set_rules = Widget_SetRules(w : LcuiWidget, rules : LcuiWidgetRulesRec*) : LibC::Int
    # Set widget content text
fun widget_set_text = Widget_SetText(w : LcuiWidget, text : LibC::Char*)
  fun widget_bind_property = Widget_BindProperty(w : LcuiWidget, name : LibC::Char*, value : LcuiObject)
  fun widget_update_box_position = Widget_UpdateBoxPosition(w : LcuiWidget)
  fun widget_update_canvas_box = Widget_UpdateCanvasBox(w : LcuiWidget)
  fun widget_update_box_size = Widget_UpdateBoxSize(w : LcuiWidget)
  fun lcui_widget_clear_trash = LCUIWidget_ClearTrash : LibC::SizeT
  fun lcui_widget_init_base = LCUIWidget_InitBase
  fun lcui_widget_free_root = LCUIWidget_FreeRoot
  fun lcui_widget_free_base = LCUIWidget_FreeBase
  fun widget_set_attribute_ex = Widget_SetAttributeEx(w : LcuiWidget, name : LibC::Char*, value : Void*, value_type : LibC::Int, value_destructor : (Void* -> Void)) : LibC::Int
  fun widget_set_attribute = Widget_SetAttribute(w : LcuiWidget, name : LibC::Char*, value : LibC::Char*) : LibC::Int
  fun widget_get_attribute = Widget_GetAttribute(w : LcuiWidget, name : LibC::Char*) : LibC::Char*
  fun widget_destroy_attributes = Widget_DestroyAttributes(w : LcuiWidget)
  fun widget_destroy_id = Widget_DestroyId(w : LcuiWidget) : LibC::Int
  fun widget_set_id = Widget_SetId(w : LcuiWidget, idstr : LibC::Char*) : LibC::Int
  fun lcui_widget_get_by_id = LCUIWidget_GetById(id : LibC::Char*) : LcuiWidget
  fun lcui_widget_init_id_library = LCUIWidget_InitIdLibrary
  fun lcui_widget_free_id_library = LCUIWidget_FreeIdLibrary
    # Generate a hash for a widget to identify it and siblings
fun widget_generate_self_hash = Widget_GenerateSelfHash(w : LcuiWidget)
    # Generate hash values for a widget and its children
fun widget_generate_hash = Widget_GenerateHash(w : LcuiWidget)
  fun widget_set_hash_list = Widget_SetHashList(w : LcuiWidget, hash_list : LibC::UInt*, len : LibC::SizeT) : LibC::SizeT
  fun widget_get_hash_list = Widget_GetHashList(w : LcuiWidget, hash_list : LibC::UInt*, maxlen : LibC::SizeT) : LibC::SizeT
  fun widget_add_class = Widget_AddClass(w : LcuiWidget, class_name : LibC::Char*) : LibC::Int
  fun widget_has_class = Widget_HasClass(w : LcuiWidget, class_name : LibC::Char*) : LcuiBool
  fun widget_remove_class = Widget_RemoveClass(w : LcuiWidget, class_name : LibC::Char*) : LibC::Int
  fun widget_destroy_classes = Widget_DestroyClasses(w : LcuiWidget)
  fun widget_add_status = Widget_AddStatus(w : LcuiWidget, status_name : LibC::Char*) : LibC::Int
  fun widget_has_status = Widget_HasStatus(w : LcuiWidget, status_name : LibC::Char*) : LcuiBool
  fun widget_remove_status = Widget_RemoveStatus(w : LcuiWidget, status_name : LibC::Char*) : LibC::Int
  fun widget_update_status = Widget_UpdateStatus(widget : LcuiWidget)
    # 设置部件是否禁用
fun widget_set_disabled = Widget_SetDisabled(w : LcuiWidget, disabled : LcuiBool)
  fun widget_destroy_status = Widget_DestroyStatus(w : LcuiWidget)
    # 设置内边距
fun widget_set_padding = Widget_SetPadding(w : LcuiWidget, top : LibC::Float, right : LibC::Float, bottom : LibC::Float, left : LibC::Float)
    # 设置外边距
fun widget_set_margin = Widget_SetMargin(w : LcuiWidget, top : LibC::Float, right : LibC::Float, bottom : LibC::Float, left : LibC::Float)
  fun widget_set_border_color = Widget_SetBorderColor(w : LcuiWidget, color : LcuiColor)
  fun widget_set_border_width = Widget_SetBorderWidth(w : LcuiWidget, width : LibC::Float)
  fun widget_set_border_style = Widget_SetBorderStyle(w : LcuiWidget, style : LibC::Int)
    # 设置边框样式
fun widget_set_border = Widget_SetBorder(w : LcuiWidget, width : LibC::Float, style : LibC::Int, clr : LcuiColor)
    # 设置阴影样式
fun widget_set_box_shadow = Widget_SetBoxShadow(w : LcuiWidget, x : LibC::Float, y : LibC::Float, blur : LibC::Float, color : LcuiColor)
    # 移动部件位置
fun widget_move = Widget_Move(w : LcuiWidget, left : LibC::Float, top : LibC::Float)
    # 调整部件尺寸
fun widget_resize = Widget_Resize(w : LcuiWidget, width : LibC::Float, height : LibC::Float)
  fun widget_get_style = Widget_GetStyle(w : LcuiWidget, key : LibC::Int) : LcuiStyle
  fun widget_unset_style = Widget_UnsetStyle(w : LcuiWidget, key : LibC::Int) : LibC::Int
  fun widget_get_inherited_style = Widget_GetInheritedStyle(w : LcuiWidget, key : LibC::Int) : LcuiStyle
  fun widget_check_style_boolean_value = Widget_CheckStyleBooleanValue(w : LcuiWidget, key : LibC::Int, value : LcuiBool) : LcuiBool
  fun widget_check_style_valid = Widget_CheckStyleValid(w : LcuiWidget, key : LibC::Int) : LcuiBool
  fun widget_set_visibility = Widget_SetVisibility(w : LcuiWidget, value : LibC::Char*)
  fun widget_set_visible = Widget_SetVisible(w : LcuiWidget)
  fun widget_set_hidden = Widget_SetHidden(w : LcuiWidget)
  fun widget_show = Widget_Show(w : LcuiWidget)
  fun widget_hide = Widget_Hide(w : LcuiWidget)
  fun widget_set_position = Widget_SetPosition(w : LcuiWidget, position : LcuiStyleValue)
  fun widget_set_opacity = Widget_SetOpacity(w : LcuiWidget, opacity : LibC::Float)
  fun widget_set_box_sizing = Widget_SetBoxSizing(w : LcuiWidget, sizing : LcuiStyleValue)
    # Collect all child widget that have a ref attribute specified
fun widget_collect_references = Widget_CollectReferences(w : LcuiWidget) : Dict*
    # Get the first widget that match the type by testing the widget itself and traversing up through its ancestors.
fun widget_get_closest = Widget_GetClosest(w : LcuiWidget, type : LibC::Char*) : LcuiWidget
    # 将部件与子部件列表断开链接
fun widget_unlink = Widget_Unlink(widget : LcuiWidget) : LibC::Int
    # 向子部件列表追加部件
fun widget_append = Widget_Append(container : LcuiWidget, widget : LcuiWidget) : LibC::Int
    # 将部件插入到子部件列表的开头处
fun widget_prepend = Widget_Prepend(parent : LcuiWidget, widget : LcuiWidget) : LibC::Int
    # 移除部件，并将其子级部件转移至父部件内
fun widget_unwrap = Widget_Unwrap(widget : LcuiWidget) : LibC::Int
    # 清空部件内的子级部件
fun widget_empty = Widget_Empty(widget : LcuiWidget)
    # 获取上一个部件
fun widget_get_prev = Widget_GetPrev(w : LcuiWidget) : LcuiWidget
    # 获取下一个部件
fun widget_get_next = Widget_GetNext(w : LcuiWidget) : LcuiWidget
    # 获取一个子部件
fun widget_get_child = Widget_GetChild(w : LcuiWidget, index : LibC::SizeT) : LcuiWidget
    # Traverse the child widget tree
fun widget_each = Widget_Each(w : LcuiWidget, callback : (LcuiWidget, Void* -> Void), arg : Void*) : LibC::SizeT
    # 获取当前点命中的最上层可见部件
fun widget_at = Widget_At(widget : LcuiWidget, x : LibC::Int, y : LibC::Int) : LcuiWidget
  fun widget_destroy_children = Widget_DestroyChildren(w : LcuiWidget)
  fun widget_print_tree = Widget_PrintTree(w : LcuiWidget)
  fun widget_reflow = Widget_Reflow(w : LcuiWidget, rule : LcuiLayoutRule)
    # 更新当前任务状态，确保部件的任务能够被处理到
fun widget_update_task_status = Widget_UpdateTaskStatus(widget : LcuiWidget)
    # 添加任务
fun widget_add_task = Widget_AddTask(widget : LcuiWidget, task_type : LibC::Int)
    # 处理部件中当前积累的任务
fun widget_update = Widget_Update(w : LcuiWidget) : LibC::SizeT
  fun widget_update_with_profile = Widget_UpdateWithProfile(w : LcuiWidget, profile : LcuiWidgetTasksProfile)
  alias LcuiWidgetTasksProfile = LcuiWidgetTasksRec*
    # 为子级部件添加任务
fun widget_add_task_for_children = Widget_AddTaskForChildren(widget : LcuiWidget, task : LibC::Int)
    # 初始化 LCUI 部件任务处理功能
fun lcui_widget_init_tasks = LCUIWidget_InitTasks
    # 销毁（释放） LCUI 部件任务处理功能的相关资源
fun lcui_widget_free_tasks = LCUIWidget_FreeTasks
    # 处理一次当前积累的部件任务
fun lcui_widget_update = LCUIWidget_Update : LibC::SizeT
  fun lcui_widget_update_with_profile = LCUIWidget_UpdateWithProfile(profile : LcuiWidgetTasksProfile)
    # 刷新所有部件的样式
fun lcui_widget_refresh_style = LCUIWidget_RefreshStyle
    # 标记部件中的无效区域
fun widget_invalidate_area = Widget_InvalidateArea(widget : LcuiWidget, in_rect : LcuiRectF*, box_type : LibC::Int) : LcuiBool
    # 取出部件中的无效区域
fun widget_get_invalid_area = Widget_GetInvalidArea(w : LcuiWidget, rects : LinkedList*) : LibC::SizeT
    # 将部件中的矩形区域转换成指定范围框内有效的矩形区域
fun widget_convert_area = Widget_ConvertArea(w : LcuiWidget, in_rect : LcuiRect*, out_rect : LcuiRect*, box_type : LibC::Int) : LibC::Int
    # 渲染指定部件呈现的图形内容
fun widget_render = Widget_Render(w : LcuiWidget, paint : LcuiPaintContext) : LibC::SizeT
  fun lcui_widget_init_renderer = LCUIWidget_InitRenderer
  fun lcui_widget_free_renderer = LCUIWidget_FreeRenderer
  fun lcui_widget_init_prototype = LCUIWidget_InitPrototype
  fun lcui_widget_free_prototype = LCUIWidget_FreePrototype
  fun lcui_widget_get_prototype = LCUIWidget_GetPrototype(name : LibC::Char*) : LcuiWidgetPrototype
  fun lcui_widget_new_prototype = LCUIWidget_NewPrototype(name : LibC::Char*, parent_name : LibC::Char*) : LcuiWidgetPrototype
    # 判断部件类型
fun widget_check_type = Widget_CheckType(w : LcuiWidget, type : LibC::Char*) : LcuiBool
    # 判断部件原型
fun widget_check_prototype = Widget_CheckPrototype(w : LcuiWidget, proto : LcuiWidgetPrototypeC) : LcuiBool
  fun widget_get_data = Widget_GetData(widget : LcuiWidget, proto : LcuiWidgetPrototype) : Void*
  fun widget_add_data = Widget_AddData(widget : LcuiWidget, proto : LcuiWidgetPrototype, data_size : LibC::SizeT) : Void*
    # 清除部件自带的原型数据
fun widget_clear_prototype = Widget_ClearPrototype(widget : LcuiWidget)
  struct LcuiWidgetEventRec
        # 事件类型标识号
type : Uint32T
        # 附加数据
data : Void*
        # 触发事件的部件
target : LcuiWidget
        # 是否取消事件冒泡
cancel_bubble : LcuiBool
    motion : LcuiWidgetMouseMotionEvent
    button : LcuiWidgetMouseButtonEvent
    wheel : LcuiWidgetMouseWheelEvent
    key : LcuiWidgetKeyboardEvent
    touch : LcuiWidgetTouchEvent
    text : LcuiWidgetTextInputEvent
  end
  alias LcuiWidgetMouseMotionEvent = LcuiMouseMotionEvent
  alias LcuiWidgetMouseButtonEvent = LcuiMouseButtonEvent
  alias LcuiWidgetMouseWheelEvent = LcuiMouseWheelEvent
  alias LcuiWidgetKeyboardEvent = LcuiKeyboardEvent
  alias LcuiWidgetTouchEvent = LcuiTouchEvent
  alias LcuiWidgetTextInputEvent = LcuiTextInputEvent
    # 触发事件，让事件处理器在主循环中调用
fun widget_post_event = Widget_PostEvent(widget : LcuiWidget, ev : LcuiWidgetEvent, data : Void*, destroy_data : (Void* -> Void)) : LcuiBool
  alias LcuiWidgetEvent = LcuiWidgetEventRec*
    # 触发事件，直接调用事件处理器
fun widget_trigger_event = Widget_TriggerEvent(widget : LcuiWidget, e : LcuiWidgetEvent, data : Void*) : LibC::Int
    # 自动分配一个可用的事件标识号
fun lcui_widget_alloc_event_id = LCUIWidget_AllocEventId : LibC::Int
    # 设置与事件标识号对应的名称
fun lcui_widget_set_event_name = LCUIWidget_SetEventName(event_id : LibC::Int, event_name : LibC::Char*) : LibC::Int
    # 获取与事件标识号对应的名称
fun lcui_widget_get_event_name = LCUIWidget_GetEventName(event_id : LibC::Int) : LibC::Char*
    # 获取与事件名称对应的标识号
fun lcui_widget_get_event_id = LCUIWidget_GetEventId(event_name : LibC::Char*) : LibC::Int
  fun lcui_init_widget_event = LCUI_InitWidgetEvent(e : LcuiWidgetEvent, name : LibC::Char*)
    # 添加部件事件绑定
fun widget_bind_event_by_id = Widget_BindEventById(widget : LcuiWidget, event_id : LibC::Int, func : LcuiWidgetEventFunc, data : Void*, destroy_data : (Void* -> Void)) : LibC::Int
  alias LcuiWidgetEventFunc = (LcuiWidget, LcuiWidgetEvent, Void* -> Void)
    # 添加部件事件绑定
fun widget_bind_event = Widget_BindEvent(widget : LcuiWidget, event_name : LibC::Char*, func : LcuiWidgetEventFunc, data : Void*, destroy_data : (Void* -> Void)) : LibC::Int
    # 解除部件事件绑定
fun widget_unbind_event_by_id = Widget_UnbindEventById(widget : LcuiWidget, event_id : LibC::Int, func : LcuiWidgetEventFunc) : LibC::Int
    # 解除部件事件绑定
fun widget_unbind_event_by_handler_id = Widget_UnbindEventByHandlerId(widget : LcuiWidget, handler_id : LibC::Int) : LibC::Int
    # 解除部件事件绑定
fun widget_unbind_event = Widget_UnbindEvent(widget : LcuiWidget, event_name : LibC::Char*, func : LcuiWidgetEventFunc) : LibC::Int
    # 投递表面（surface）事件 表面是与顶层部件绑定在一起的，只有当部件为顶层部件时，才能投递表面事件。 表面事件主要用于让表面与部件同步一些数据，如：大小、位置、显示/隐藏。
fun widget_post_surface_event = Widget_PostSurfaceEvent(w : LcuiWidget, event_type : LibC::Int, sync_props : LcuiBool) : LibC::Int
    # 清除事件对象，通常在部件销毁时调用该函数，以避免部件销毁后还有事件发送给它
fun lcui_widget_clear_event_target = LCUIWidget_ClearEventTarget(widget : LcuiWidget)
    # get current focused widget
fun lcui_widget_get_focus = LCUIWidget_GetFocus : LcuiWidget
    # 将一个部件设置为焦点
fun lcui_widget_set_focus = LCUIWidget_SetFocus(widget : LcuiWidget) : LibC::Int
    # 停止部件的事件传播
fun widget_stop_event_propagation = Widget_StopEventPropagation(widget : LcuiWidget) : LibC::Int
    # 为部件设置鼠标捕获，设置后将捕获全局范围内的鼠标事件
fun widget_set_mouse_capture = Widget_SetMouseCapture(w : LcuiWidget)
    # 为部件解除鼠标捕获
fun widget_release_mouse_capture = Widget_ReleaseMouseCapture(w : LcuiWidget)
    # 为部件设置触点捕获，设置后将捕获全局范围内的触点事件
fun widget_set_touch_capture = Widget_SetTouchCapture(w : LcuiWidget, point_id : LibC::Int) : LibC::Int
    # 为部件解除触点捕获
fun widget_release_touch_capture = Widget_ReleaseTouchCapture(w : LcuiWidget, point_id : LibC::Int) : LibC::Int
  fun widget_destroy_event_trigger = Widget_DestroyEventTrigger(w : LcuiWidget)
    # 初始化 LCUI 部件的事件系统
fun lcui_widget_init_event = LCUIWidget_InitEvent
    # 销毁（释放） LCUI 部件的事件系统的相关资源
fun lcui_widget_free_event = LCUIWidget_FreeEvent
    # 初始化
fun lcui_widget_init_style = LCUIWidget_InitStyle
    # 销毁，释放资源
fun lcui_widget_free_style = LCUIWidget_FreeStyle
    # 打印部件的样式表
fun widget_print_style_sheets = Widget_PrintStyleSheets(w : LcuiWidget)
    # Set widget style by string
fun widget_set_style_string = Widget_SetStyleString(w : LcuiWidget, name : LibC::Char*, value : LibC::Char*)
  fun widget_compute_padding_style = Widget_ComputePaddingStyle(w : LcuiWidget)
  fun widget_compute_margin_style = Widget_ComputeMarginStyle(w : LcuiWidget)
  fun widget_compute_properties = Widget_ComputeProperties(w : LcuiWidget)
  fun widget_compute_width_limit_style = Widget_ComputeWidthLimitStyle(w : LcuiWidget, rule : LcuiLayoutRule)
  fun widget_compute_height_limit_style = Widget_ComputeHeightLimitStyle(w : LcuiWidget, rule : LcuiLayoutRule)
  fun widget_compute_height_style = Widget_ComputeHeightStyle(w : LcuiWidget)
  fun widget_compute_width_style = Widget_ComputeWidthStyle(w : LcuiWidget)
  fun widget_compute_size_style = Widget_ComputeSizeStyle(w : LcuiWidget)
  fun widget_compute_visibility_style = Widget_ComputeVisibilityStyle(w : LcuiWidget)
  fun widget_compute_display_style = Widget_ComputeDisplayStyle(w : LcuiWidget)
  fun widget_compute_opacity_style = Widget_ComputeOpacityStyle(w : LcuiWidget)
  fun widget_compute_z_index_style = Widget_ComputeZIndexStyle(w : LcuiWidget)
  fun widget_compute_position_style = Widget_ComputePositionStyle(w : LcuiWidget)
  fun widget_compute_flex_box_style = Widget_ComputeFlexBoxStyle(w : LcuiWidget)
  fun widget_compute_flex_basis_style = Widget_ComputeFlexBasisStyle(w : LcuiWidget)
    # 更新当前部件的样式
fun widget_update_style = Widget_UpdateStyle(w : LcuiWidget, is_refresh_all : LcuiBool)
    # 更新当前部件的子级部件样式
fun widget_update_children_style = Widget_UpdateChildrenStyle(w : LcuiWidget, is_refresh_all : LcuiBool)
  fun widget_add_task_by_style = Widget_AddTaskByStyle(w : LcuiWidget, key : LibC::Int)
    # 直接更新当前部件的样式
fun widget_exec_update_style = Widget_ExecUpdateStyle(w : LcuiWidget, is_update_all : LcuiBool)
  fun widget_destroy_style_sheets = Widget_DestroyStyleSheets(w : LcuiWidget)
    # 获取选择器结点
fun widget_get_selector_node = Widget_GetSelectorNode(w : LcuiWidget) : LcuiSelectorNode
    # 获取选择器
fun widget_get_selector = Widget_GetSelector(w : LcuiWidget) : LcuiSelector
    # 获取样式受到影响的子级部件数量
fun widget_get_children_style_changes = Widget_GetChildrenStyleChanges(w : LcuiWidget, type : LibC::Int, name : LibC::Char*) : LibC::SizeT
  fun lcui_init_widget = LCUI_InitWidget
  fun lcui_free_widget = LCUI_FreeWidget
    # 从字符串中载入界面配置代码，解析并生成相应的图形界面(元素)
fun lcui_builder_load_string = LCUIBuilder_LoadString(str : LibC::Char*, size : LibC::Int) : LcuiWidget
    # 从文件中载入界面配置代码，解析并生成相应的图形界面(元素)
fun lcui_builder_load_file = LCUIBuilder_LoadFile(filepath : LibC::Char*) : LcuiWidget
  struct LcuiFontBitmap
        # 与顶边框的距离
top : LibC::Int
        # 与左边框的距离
left : LibC::Int
        # 位图宽度
width : LibC::Int
        # 位图行数
rows : LibC::Int
    pitch : LibC::Int
        # 字体位图数据
buffer : UcharT*
    num_grays : LibC::Short
    pixel_mode : LibC::Char
        # XY轴的跨距
advance : LcuiPos
  end
  struct LcuiFontEngine
    name : LibC::Char[64]
    open : (LibC::Char*, LcuiFont** -> LibC::Int)
    render : (LcuiFontBitmap*, WcharT, LibC::Int, LcuiFont -> LibC::Int)
    close : (Void* -> Void)
  end
  struct LcuiFontRec
        # 字体信息ID
id : LibC::Int
        # 样式名称
style_name : LibC::Char*
        # 字族名称
family_name : LibC::Char*
        # 相关数据
data : Void*
        # 风格
style : LcuiFontStyle
        # 粗细程度
weight : LcuiFontWeight
        # 所属的字体引擎
engine : LcuiFontEngine*
  end
  alias LcuiFont = LcuiFontRec*
  enum LcuiFontStyle
    FontStyleNormal = 0
    FontStyleItalic = 1
    FontStyleOblique = 2
    FontStyleTotalNum = 3
  end
  enum LcuiFontWeight
    FontWeightNone = 0
    FontWeightThin = 100
    FontWeightExtraLight = 200
    FontWeightLight = 300
    FontWeightNormal = 400
    FontWeightMedium = 500
    FontWeightSemiBold = 600
    FontWeightBold = 700
    FontWeightExtraBold = 800
    FontWeightBlack = 900
    FontWeightTotalNum = 9
  end
    # 根据字符串内容猜测字体粗细程度 文档：https://developer.mozilla.org/en-US/docs/Web/CSS/font-weight
fun lcui_font_detect_weight = LCUIFont_DetectWeight(str : LibC::Char*) : LcuiFontWeight
    # 根据字符串内容猜测字体风格 文档：https://developer.mozilla.org/en-US/docs/Web/CSS/font-style
fun lcui_font_detect_style = LCUIFont_DetectStyle(str : LibC::Char*) : LcuiFontStyle
  fun lcui_font_init_in_core_font = LCUIFont_InitInCoreFont(engine : LcuiFontEngine*) : LibC::Int
  fun lcui_font_exit_in_core_font = LCUIFont_ExitInCoreFont : LibC::Int
    # 载入字体位图
fun lcui_font_render_bitmap = LCUIFont_RenderBitmap(buff : LcuiFontBitmap*, ch : WcharT, font_id : LibC::Int, pixel_size : LibC::Int) : LibC::Int
    # 添加字体族，并返回该字族的ID
fun lcui_font_add = LCUIFont_Add(font : LcuiFont) : LibC::Int
    # 获取字体的ID
fun lcui_font_get_id = LCUIFont_GetId(family_name : LibC::Char*, style : LcuiFontStyle, weight : LcuiFontWeight) : LibC::Int
    # 更新当前字体的粗细程度
fun lcui_font_update_weight = LCUIFont_UpdateWeight(font_ids : LibC::Int*, weight : LcuiFontWeight, new_font_ids : LibC::Int**) : LibC::SizeT
    # 更新当前字体的风格
fun lcui_font_update_style = LCUIFont_UpdateStyle(font_ids : LibC::Int*, style : LcuiFontStyle, new_font_ids : LibC::Int**) : LibC::SizeT
    # 根据字族名称获取对应的字体 ID 列表
fun lcui_font_get_id_by_names = LCUIFont_GetIdByNames(font_ids : LibC::Int**, style : LcuiFontStyle, weight : LcuiFontWeight, names : LibC::Char*) : LibC::SizeT
    # 获取指定字体ID的字体信息
fun lcui_font_get_by_id = LCUIFont_GetById(id : LibC::Int) : LcuiFont
    # 获取默认的字体ID
fun lcui_font_get_default = LCUIFont_GetDefault : LibC::Int
    # 设定默认的字体
fun lcui_font_set_default = LCUIFont_SetDefault(id : LibC::Int)
    # 向字体缓存中添加字体位图
fun lcui_font_add_bitmap = LCUIFont_AddBitmap(ch : WcharT, font_id : LibC::Int, size : LibC::Int, bmp : LcuiFontBitmap*) : LcuiFontBitmap*
    # 从缓存中获取字体位图
fun lcui_font_get_bitmap = LCUIFont_GetBitmap(ch : WcharT, font_id : LibC::Int, size : LibC::Int, bmp : LcuiFontBitmap**) : LibC::Int
    # 载入字体至数据库中
fun lcui_font_load_file = LCUIFont_LoadFile(filepath : LibC::Char*) : LibC::Int
    # 初始化字体处理模块
fun lcui_init_font_library = LCUI_InitFontLibrary
    # 停用字体处理模块
fun lcui_free_font_library = LCUI_FreeFontLibrary
  struct LcuiCssParserRec
    parse : LcuiCssParserFunction
  end
  struct LcuiCssParserContextRec
        # 缓存中的字符串的下标位置
pos : LibC::Int
        # 用于遍历字符串的指针
cur : LibC::Char*
        # 样式记录所属的空间
space : LibC::Char*
        # 缓存中的字符串
buffer : LibC::Char*
        # 缓存区大小
buffer_size : LibC::SizeT
        # 当前解析目标
target : LcuiCssParserTarget
        # 可供使用的解析器列表
parsers : LcuiCssParsers
    rule : LcuiCssParserRuleContextRec
    style : LcuiCssParserStyleContextRec
    comment : LcuiCssParserCommentContextRec
  end
  alias LcuiCssParserContext = LcuiCssParserContextRec*
  alias LcuiCssParserFunction = (LcuiCssParserContext -> LibC::Int)
  enum LcuiCssParserTarget
        # 无
CssTargetNone = 0
        # 规则名称
CssTargetRuleName = 1
        # 规则数据
CssTargetRuleData = 2
        # 选择器
CssTargetSelector = 3
        # 属性名
CssTargetKey = 4
        # 属性值
CssTargetValue = 5
        # 注释
CssTargetComment = 6
    CssTargetTotalNum = 7
  end
  alias LcuiCssParsers = LcuiCssParserRec[7]
  struct LcuiCssParserRuleContextRec
        # 规则解析器的状态
state : LibC::Int
        # 当前规则
rule : LcuiCssRule
        # 规则解析器列表
parsers : LcuiCssRuleParsers
  end
  enum LcuiCssRule
    CssRuleNone = 0
        # -face
CssRuleFontFace = 1
    CssRuleImport = 2
    CssRuleMedia = 3
    CssRuleTotalNum = 4
  end
  struct LcuiCssRuleParserRec
    name : LibC::Char[32]
    data : Void*
    begin : LcuiCssParserFunction
    parse : LcuiCssParserFunction
  end
  alias LcuiCssRuleParsers = LcuiCssRuleParserRec[4]
  struct LcuiCssParserStyleContextRec
        # 当前所在的目录
dirname : LibC::Char*
        # 样式记录所属的空间
space : LibC::Char*
    style_handler : (LibC::Int, LcuiStyle, Void* -> Void)
    style_handler_arg : Void*
        # 当前匹配到的选择器列表
selectors : LinkedList
        # 当前缓存的样式表
sheet : LcuiStyleSheet
        # 当前找到的样式属性解析器
parser : LcuiCssPropertyParser
  end
  struct LcuiCssPropertyParserRec
        # 标识，在解析数据时可以使用它访问样式表中的自定义属性
key : LibC::Int
        # 名称，对应 CSS 样式属性名称
name : LibC::Char*
    parse : (LcuiCssParserStyleContext, LibC::Char* -> LibC::Int)
  end
  alias LcuiCssPropertyParser = LcuiCssPropertyParserRec*
  alias LcuiCssParserStyleContext = LcuiCssParserStyleContextRec*
  struct LcuiCssParserCommentContextRec
        # 是否为单行注释
is_line_comment : LcuiBool
        # 保存的上一个目标，解析完注释后将还原成该目标
prev_target : LcuiCssParserTarget
  end
  fun lcui_get_style_value = LCUI_GetStyleValue(str : LibC::Char*) : LibC::Int
  fun lcui_get_style_value_name = LCUI_GetStyleValueName(val : LibC::Int) : LibC::Char*
  fun lcui_get_style_name = LCUI_GetStyleName(key : LibC::Int) : LibC::Char*
    # 初始化 LCUI 的 CSS 代码解析功能
fun lcui_init_css_parser = LCUI_InitCSSParser
  fun lcui_get_css_property_parser = LCUI_GetCSSPropertyParser(name : LibC::Char*) : LcuiCssPropertyParser
    # 从文件中载入CSS样式数据，并导入至样式库中
fun lcui_load_css_file = LCUI_LoadCSSFile(filepath : LibC::Char*) : LibC::Int
    # 从字符串中载入CSS样式数据，并导入至样式库中
fun lcui_load_css_string = LCUI_LoadCSSString(str : LibC::Char*, space : LibC::Char*) : LibC::SizeT
  fun lcui_free_css_parser = LCUI_FreeCSSParser
    # 注册新的属性和对应的属性值解析器
fun lcui_add_css_property_parser = LCUI_AddCSSPropertyParser(sp : LcuiCssPropertyParser) : LibC::Int
  struct LcuiCssFontFaceRec
    font_family : LibC::Char*
    font_style : LcuiFontStyle
    font_weight : LcuiFontWeight
    src : LibC::Char*
  end
    # 设定与标签关联的文本内容
fun text_view_set_text_w = TextView_SetTextW(w : LcuiWidget, text : WcharT*) : LibC::Int
  fun text_view_set_text = TextView_SetText(w : LcuiWidget, utf8_text : LibC::Char*) : LibC::Int
  fun text_view_set_line_height = TextView_SetLineHeight(w : LcuiWidget, height : LibC::Int)
  fun text_view_set_text_align = TextView_SetTextAlign(w : LcuiWidget, align : LibC::Int)
  fun text_view_set_color = TextView_SetColor(w : LcuiWidget, color : LcuiColor)
  fun text_view_set_auto_wrap = TextView_SetAutoWrap(w : LcuiWidget, enable : LcuiBool)
  fun text_view_set_mulitiline = TextView_SetMulitiline(w : LcuiWidget, enable : LcuiBool)
  fun lcui_widget_refresh_text_view = LCUIWidget_RefreshTextView : LibC::SizeT
  fun lcui_widget_add_text_view = LCUIWidget_AddTextView
  fun lcui_widget_free_text_view = LCUIWidget_FreeTextView
    # Enable style tag parser
fun text_edit_enable_style_tag = TextEdit_EnableStyleTag(widget : LcuiWidget, enable : LcuiBool)
  fun text_edit_enable_multiline = TextEdit_EnableMultiline(widget : LcuiWidget, enable : LcuiBool)
  fun text_edit_move_caret = TextEdit_MoveCaret(widget : LcuiWidget, row : LibC::Int, col : LibC::Int)
    # 清空文本内容
fun text_edit_clear_text = TextEdit_ClearText(widget : LcuiWidget)
    # 获取文本内容
fun text_edit_get_text_w = TextEdit_GetTextW(w : LcuiWidget, start : LibC::SizeT, max_len : LibC::SizeT, buf : WcharT*) : LibC::SizeT
    # 获取文本长度
fun text_edit_get_text_length = TextEdit_GetTextLength(w : LcuiWidget) : LibC::SizeT
    # 设置文本编辑框内的光标，指定是否闪烁、闪烁时间间隔
fun text_edit_set_caret_blink = TextEdit_SetCaretBlink(w : LcuiWidget, visible : LcuiBool, time : LibC::Int)
  fun text_edit_get_property = TextEdit_GetProperty(w : LcuiWidget, name : LibC::Char*) : LcuiObject
    # 为文本框设置文本（宽字符版）
fun text_edit_set_text_w = TextEdit_SetTextW(widget : LcuiWidget, wstr : WcharT*) : LibC::Int
  fun text_edit_set_text = TextEdit_SetText(widget : LcuiWidget, utf8_str : LibC::Char*) : LibC::Int
    # 为文本框追加文本（宽字符版）
fun text_edit_append_text_w = TextEdit_AppendTextW(widget : LcuiWidget, wstr : WcharT*) : LibC::Int
    # 为文本框插入文本（宽字符版）
fun text_edit_insert_text_w = TextEdit_InsertTextW(widget : LcuiWidget, wstr : WcharT*) : LibC::Int
    # 设置占位符，当文本编辑框内容为空时显示占位符
fun text_edit_set_place_holder_w = TextEdit_SetPlaceHolderW(w : LcuiWidget, wstr : WcharT*) : LibC::Int
  fun text_edit_set_place_holder = TextEdit_SetPlaceHolder(w : LcuiWidget, str : LibC::Char*) : LibC::Int
    # 设置密码屏蔽符
fun text_edit_set_password_char = TextEdit_SetPasswordChar(w : LcuiWidget, ch : WcharT)
  fun lcui_widget_add_text_edit = LCUIWidget_AddTextEdit
  # $LCUI_WStringObject : LcuiObjectTypeRec*
  # $LCUI_StringObject : LcuiObjectTypeRec*
  # $LCUI_NumberObject : LcuiObjectTypeRec*
end
