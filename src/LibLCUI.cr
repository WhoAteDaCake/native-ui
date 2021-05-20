@[Link(ldflags: "-L./LCUI/lib")]
lib LibLCUI
  LCUI_MAX_FRAMES_PER_SEC = 120
  LCUI_DIRENT_NAME_LEN = 256
  union LcuiRgb565
    value : LibC::UShort
  end
  union LcuiArgb8888
    value : Int32T
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
  end
  alias LcuiBool = UInt8
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
  alias UcharT = UInt8
  struct LcuiStyleRec
    is_valid : LcuiBool
    type : LcuiStyleType
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
  struct LcuiBoundBoxRec
    top : LcuiStyleRec
    right : LcuiStyleRec
    bottom : LcuiStyleRec
    left : LcuiStyleRec
  end
  struct LcuiBackgroundPosition
    using_value : LcuiBool
  end
  struct LcuiBackgroundSize
    using_value : LcuiBool
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
  struct LcuiBackgroundPosition
    x : LibC::Int
    y : LibC::Int
  end
  struct LcuiBackgroundSize
    width : LibC::Int
    height : LibC::Int
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
  alias WcharT = LibC::Int
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
  # LCUI_WStringObject : LcuiObjectTypeRec*
  # LCUI_StringObject : LcuiObjectTypeRec*
  # LCUI_NumberObject : LcuiObjectTypeRec*
end
