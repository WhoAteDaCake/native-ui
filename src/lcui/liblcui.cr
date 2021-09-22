# LINKS
@[Link(ldflags: "`pkg-config --cflags --libs x11 xcb libpng fontconfig`")]
# Rest please
@[Link(ldflags: "-L#{__DIR__}/../../LCUI/build/linux/x86_64/release")]
@[Link(ldflags: "-llcui")]
@[Link(ldflags: "-I#{__DIR__}/../../LCUI/include")]

lib LibLCUI
  fun surface_move = Surface_Move(surface : LcuiSurface, x : LibC::Int, y : LibC::Int)
  LCUI_MAX_FRAMES_PER_SEC = 120
  LCUI_DIRENT_NAME_LEN    = 256
  enum LcuiColorType
    LcuiColorTypeIndex8   = 0
    LcuiColorTypeGray8    = 1
    LcuiColorTypeRgb323   = 2
    LcuiColorTypeArgb2222 = 3
    LcuiColorTypeRgb555   = 4
    LcuiColorTypeRgb565   = 5
    LcuiColorTypeRgb888   = 6
    LcuiColorTypeArgb8888 = 7
  end

  union LcuiRgb565
    value : LibC::UShort
    field_0 : LcuiRgb565FField0
    field_1 : LcuiRgb565FField1
  end

  struct LcuiRgb565FField0
    b : UcharT
    g : UcharT
    r : UcharT
  end

  alias UcharT = UInt8

  struct LcuiRgb565FField1
    blue : UcharT
    green : UcharT
    red : UcharT
  end

  union LcuiArgb8888
    value : Int32T
    field_0 : LcuiArgb8888FField0
    field_1 : LcuiArgb8888FField1
  end

  alias X__Int32T = LibC::Int
  alias Int32T = X__Int32T

  struct LcuiArgb8888FField0
    b : UcharT
    g : UcharT
    r : UcharT
    a : UcharT
  end

  struct LcuiArgb8888FField1
    blue : UcharT
    green : UcharT
    red : UcharT
    alpha : UcharT
  end

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

  enum LcuiStyleValue
    SvNone         =  0
    SvAuto         =  1
    SvNormal       =  2
    SvInherit      =  3
    SvInitial      =  4
    SvContain      =  5
    SvCover        =  6
    SvLeft         =  7
    SvCenter       =  8
    SvRight        =  9
    SvTop          = 10
    SvTopLeft      = 11
    SvTopCenter    = 12
    SvTopRight     = 13
    SvMiddle       = 14
    SvCenterLeft   = 15
    SvCenterCenter = 16
    SvCenterRight  = 17
    SvBottom       = 18
    SvBottomLeft   = 19
    SvBottomCenter = 20
    SvBottomRight  = 21
    SvSolid        = 22
    SvDotted       = 23
    SvDouble       = 24
    SvDashed       = 25
    SvContentBox   = 26
    SvPaddingBox   = 27
    SvBorderBox    = 28
    SvGraphBox     = 29
    SvStatic       = 30
    SvRelative     = 31
    SvAbsolute     = 32
    SvBlock        = 33
    SvInlineBlock  = 34
    SvFlex         = 35
    SvFlexStart    = 36
    SvFlexEnd      = 37
    SvStretch      = 38
    SvSpaceBetween = 39
    SvSpaceAround  = 40
    SvSpaceEvenly  = 41
    SvWrap         = 42
    SvNowrap       = 43
    SvRow          = 44
    SvColumn       = 45
  end
  enum LcuiStyleType
    LcuiStypeNone    =  0
    LcuiStypeAuto    =  1
    LcuiStypeScale   =  2
    LcuiStypePx      =  3
    LcuiStypePt      =  4
    LcuiStypeDip     =  5
    LcuiStypeSp      =  6
    LcuiStypeColor   =  7
    LcuiStypeImage   =  8
    LcuiStypeStyle   =  9
    LcuiStypeInt     = 10
    LcuiStypeBool    = 11
    LcuiStypeString  = 12
    LcuiStypeWstring = 13
  end

  struct LcuiBoxShadowStyle
    x : LibC::Float
    y : LibC::Float
    blur : LibC::Float
    spread : LibC::Float
    color : LcuiColor
  end

  alias LcuiColor = LcuiArgb8888

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
    top : LcuiBorderStyleFTop
    right : LcuiBorderStyleFTop
    bottom : LcuiBorderStyleFTop
    left : LcuiBorderStyleFTop
    top_left_radius : LibC::Float
    top_right_radius : LibC::Float
    bottom_left_radius : LibC::Float
    bottom_right_radius : LibC::Float
  end

  struct LcuiBorderStyleFTop
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
    field_0 : LcuiGraphFField0
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
    field_0 : LcuiGraphQuoteFField0
  end

  alias LcuiBool = UInt8

  union LcuiGraphQuoteFField0
    source : LcuiGraph*
    source_ro : LcuiGraph*
  end

  union LcuiGraphFField0
    bytes : UcharT*
    argb : LcuiArgb*
  end

  alias LcuiArgb = LcuiArgb8888

  struct LcuiStyleRec
    is_valid : LcuiBool
    type : LcuiStyleType
    field_0 : LcuiStyleRecFField0
  end

  union LcuiStyleRecFField0
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

  alias WcharT = UInt16
  enum LcuiSizingRule
    LcuiSizingRuleNone       = 0
    LcuiSizingRuleFixed      = 1
    LcuiSizingRuleFill       = 2
    LcuiSizingRulePercent    = 3
    LcuiSizingRuleFitContent = 4
  end
  enum LcuiLayoutRule
    LcuiLayoutRuleAuto        = 0
    LcuiLayoutRuleMaxContent  = 1
    LcuiLayoutRuleFixedWidth  = 2
    LcuiLayoutRuleFixedHeight = 3
    LcuiLayoutRuleFixed       = 4
  end

  struct LcuiFlexLayoutStyle
    shrink : LibC::Float
    grow : LibC::Float
    basis : LibC::Float
    wrap : LcuiStyleValue
    direction : LcuiStyleValue
    align_items : LcuiStyleValue
    align_content : LcuiStyleValue
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
    field_0 : LcuiBackgroundPositionFField0
    field_1 : LcuiBackgroundPositionFField1
  end

  struct LcuiBackgroundPositionFField0
    x : LcuiStyleRec
    y : LcuiStyleRec
  end

  union LcuiBackgroundPositionFField1
    value : LibC::Int
  end

  struct LcuiBackgroundSize
    using_value : LcuiBool
    field_0 : LcuiBackgroundSizeFField0
    field_1 : LcuiBackgroundSizeFField1
  end

  struct LcuiBackgroundSizeFField0
    width : LcuiStyleRec
    height : LcuiStyleRec
  end

  union LcuiBackgroundSizeFField1
    value : LibC::Int
  end

  struct LcuiBackgroundStyle
    image : LcuiGraph
    color : LcuiColor
    repeat : LcuiBackgroundStyleFRepeat
    position : LcuiBackgroundPosition
    size : LcuiBackgroundSize
  end

  struct LcuiBackgroundStyleFRepeat
    x : LcuiBool
    y : LcuiBool
  end

  struct LcuiBackground
    image : LcuiGraph*
    color : LcuiColor
    repeat : LcuiBackgroundFRepeat
    position : LcuiBackgroundFPosition
    size : LcuiBackgroundFSize
  end

  struct LcuiBackgroundFRepeat
    x : LcuiBool
    y : LcuiBool
  end

  struct LcuiBackgroundFPosition
    x : LibC::Int
    y : LibC::Int
  end

  struct LcuiBackgroundFSize
    width : LibC::Int
    height : LibC::Int
  end

  struct LcuiPaintContextRec
    rect : LcuiRect
    canvas : LcuiGraph
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

  alias LcuiWidgetTasksProfileRec = LcuiWidgetTasksRec

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
  alias X__Dirstream = Void

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

  alias LinkedList = LinkedListRec

  struct LinkedListNodeRec
    data : Void*
    prev : LinkedListNode*
    next : LinkedListNode*
  end

  alias LinkedListNode = LinkedListNodeRec
  alias LcuiObjectWatcherRec = Void
  fun lcui_rect_get_cut_area = LCUIRect_GetCutArea(box_w : LibC::Int, box_h : LibC::Int, rect : LcuiRect, cut : LcuiRect*)
  fun lcui_rect_validate_area = LCUIRect_ValidateArea(rect : LcuiRect*, box_w : LibC::Int, box_h : LibC::Int) : LcuiBool
  fun lcui_rect_f_validate_area = LCUIRectF_ValidateArea(rect : LcuiRectF*, box_w : LibC::Float, box_h : LibC::Float) : LcuiBool
  fun lcui_rect_to_rect_f = LCUIRect_ToRectF(rect : LcuiRect*, rectf : LcuiRectF*, scale : LibC::Float)
  fun lcui_rect_scale = LCUIRect_Scale(src : LcuiRect*, dst : LcuiRect*, scale : LibC::Float)
  fun lcui_rect_f_to_rect = LCUIRectF_ToRect(rectf : LcuiRectF*, rect : LcuiRect*, scale : LibC::Float)
  fun lcui_rect_is_cover_rect = LCUIRect_IsCoverRect(a : LcuiRect*, b : LcuiRect*) : LcuiBool
  fun lcui_rect_f_is_cover_rect = LCUIRectF_IsCoverRect(a : LcuiRectF*, b : LcuiRectF*) : LcuiBool
  fun lcui_rect_get_overlay_rect = LCUIRect_GetOverlayRect(a : LcuiRect*, b : LcuiRect*, out : LcuiRect*) : LcuiBool
  fun lcui_rect_f_get_overlay_rect = LCUIRectF_GetOverlayRect(a : LcuiRectF*, b : LcuiRectF*, out : LcuiRectF*) : LcuiBool
  fun lcui_rect_merge_rect = LCUIRect_MergeRect(big : LcuiRect*, a : LcuiRect*, b : LcuiRect*)
  fun lcui_rect_f_merge_rect = LCUIRectF_MergeRect(big : LcuiRectF*, a : LcuiRectF*, b : LcuiRectF*)
  fun lcui_rect_cut_four_rect = LCUIRect_CutFourRect(rect1 : LcuiRect*, rect2 : LcuiRect*, rects : LcuiRect[4])
  fun lcui_rect_split = LCUIRect_Split(base : LcuiRect*, target : LcuiRect*, rects : LcuiRect[4])
  fun lcui_rect_f_is_equals = LCUIRectF_IsEquals(a : LcuiRectF*, b : LcuiRectF*) : LcuiBool
  fun lcui_rect_is_equals = LCUIRect_IsEquals(a : LcuiRect*, b : LcuiRect*) : LcuiBool

  struct LcuiEventRec
    type : LibC::Int
    data : Void*
  end

  struct LcuiEventTriggerRec
    handler_base_id : LibC::Int
    events : RbTree
    handlers : RbTree
  end

  struct RbTreeRec
    total_node : LibC::Int
    compare : (Void*, Void* -> LibC::Int)
    destroy : (Void* -> Void)
    root : RbTreeNode*
  end

  alias RbTree = RbTreeRec

  struct RbTreeNodeRec
    color : UInt8
    key : LibC::Int
    field_0 : RbTreeNodeRecFField0
    parent : RbTreeNode*
    left : RbTreeNode*
    right : RbTreeNode*
  end

  alias RbTreeNode = RbTreeNodeRec

  union RbTreeNodeRecFField0
    data : Void*
    str : LibC::Char*
  end

  struct LcuiTaskRec
    func : LcuiTaskFunc
    arg : Void*[2]
    destroy_arg : (Void* -> Void)[2]
  end

  alias LcuiTaskFunc = (Void*, Void* -> Void)
  fun lcui_task_destroy = LCUITask_Destroy(task : LcuiTask)
  alias LcuiTask = LcuiTaskRec*
  fun lcui_task_run = LCUITask_Run(task : LcuiTask) : LibC::Int
  fun lcui_decode_string = LCUI_DecodeString(wstr : WcharT*, str : LibC::Char*, max_len : LibC::SizeT, encoding : LibC::Int) : LibC::SizeT
  fun lcui_encode_string = LCUI_EncodeString(str : LibC::Char*, wstr : WcharT*, max_len : LibC::SizeT, encoding : LibC::Int) : LibC::SizeT
  enum LcuiSysEventType
    LcuiNone           =   0
    LcuiKeydown        =   1
    LcuiKeypress       =   2
    LcuiKeyup          =   3
    LcuiMouse          =   4
    LcuiMousemove      =   5
    LcuiMousedown      =   6
    LcuiMouseup        =   7
    LcuiMousewheel     =   8
    LcuiTextinput      =   9
    LcuiTouch          =  10
    LcuiTouchmove      =  11
    LcuiTouchdown      =  12
    LcuiTouchup        =  13
    LcuiPaint          =  14
    LcuiWidget         =  15
    LcuiQuit           =  16
    LcuiSettingsChange =  17
    LcuiUser           = 100
  end

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
    code : LibC::Int
    ctrl_key : LcuiBool
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
    field_0 : LcuiSysEventRecFField0
  end

  alias X__Uint32T = LibC::UInt
  alias Uint32T = X__Uint32T

  union LcuiSysEventRecFField0
    motion : LcuiMouseMotionEvent
    button : LcuiMouseButtonEvent
    wheel : LcuiMouseWheelEvent
    text : LcuiTextInputEvent
    key : LcuiKeyboardEvent
    touch : LcuiTouchEvent
    paint : LcuiPaintEvent
  end

  enum LcuiAppDriverId
    LcuiAppUnknown  = 0
    LcuiAppLinux    = 1
    LcuiAppLinuxX11 = 2
    LcuiAppWindows  = 3
    LcuiAppUwp      = 4
  end

  struct LcuiAppDriverRec
    id : LcuiAppDriverId
    process_events : (-> Void)
    bind_sys_event : (LibC::Int, LcuiEventFunc, Void*, (Void* -> Void) -> LibC::Int)
    unbind_sys_event : (LibC::Int, LcuiEventFunc -> LibC::Int)
    unbind_sys_event2 : (LibC::Int -> LibC::Int)
    get_data : (-> Void)
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
  fun lcui_process_events = LCUI_ProcessEvents : LibC::SizeT
  fun lcui_post_task = LCUI_PostTask(task : LcuiTask) : LcuiBool
  fun lcui_post_async_task_to = LCUI_PostAsyncTaskTo(task : LcuiTask, target_worker_id : LibC::Int)
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
  fun lcui_get_frame_count = LCUI_GetFrameCount : LibC::Int
  fun lcui_init_base = LCUI_InitBase
  fun lcui_init_app = LCUI_InitApp(app : LcuiAppDriver)
  alias LcuiAppDriver = LcuiAppDriverRec*
  fun lcui_init = LCUI_Init
  fun lcui_main = LCUI_Main : LibC::Int
  fun lcui_get_version = LCUI_GetVersion : LibC::Char*
  fun lcui_destroy = LCUI_Destroy : LibC::Int
  fun lcui_quit = LCUI_Quit
  fun lcui_exit = LCUI_Exit(code : LibC::Int)
  fun lcui_is_on_main_loop = LCUI_IsOnMainLoop : LcuiBool
  fun lcui_over_pixel = LCUI_OverPixel(dst : LcuiArgb*, src : LcuiArgb*)

  union Anon1
    __data : X__PthreadMutexS
    __size : LibC::Char[40]
    __align : LibC::Long
  end

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

  alias X__PthreadListT = X__PthreadInternalList

  union Anon2
    __data : X__PthreadCondS
    __size : LibC::Char[48]
    __align : LibC::LongLong
  end

  struct X__PthreadCondS
    field_0 : X__PthreadCondSFField0
    field_1 : X__PthreadCondSFField1
    field_2 : X__PthreadCondSFField2
    field_3 : X__PthreadCondSFField3
    __g_refs : LibC::UInt[2]
    __g_size : LibC::UInt[2]
    __g1_orig_size : LibC::UInt
    __wrefs : LibC::UInt
    __g_signals : LibC::UInt[2]
  end

  struct X__PthreadCondSFField0
    __low : LibC::UInt
    __high : LibC::UInt
  end

  union X__PthreadCondSFField1
    __wseq : LibC::ULongLong
    __wseq32 : X__PthreadCondSFField0
  end

  struct X__PthreadCondSFField2
    __low : LibC::UInt
    __high : LibC::UInt
  end

  union X__PthreadCondSFField3
    __g1_start : LibC::ULongLong
    __g1_start32 : X__PthreadCondSFField2
  end

  fun lcui_mutex_init = LCUIMutex_Init(mutex : LcuiMutex*) : LibC::Int
  alias LcuiMutex = Anon1
  fun lcui_mutex_destroy = LCUIMutex_Destroy(mutex : LcuiMutex*)
  fun lcui_mutex_try_lock = LCUIMutex_TryLock(mutex : LcuiMutex*) : LibC::Int
  fun lcui_mutex_lock = LCUIMutex_Lock(mutex : LcuiMutex*) : LibC::Int
  fun lcui_mutex_unlock = LCUIMutex_Unlock(mutex : LcuiMutex*) : LibC::Int
  fun lcui_cond_init = LCUICond_Init(cond : LcuiCond*) : LibC::Int
  alias LcuiCond = Anon2
  fun lcui_cond_destroy = LCUICond_Destroy(cond : LcuiCond*) : LibC::Int
  fun lcui_cond_wait = LCUICond_Wait(cond : LcuiCond*, mutex : LcuiMutex*) : LibC::Int
  fun lcui_cond_timed_wait = LCUICond_TimedWait(cond : LcuiCond*, mutex : LcuiMutex*, ms : LibC::UInt) : LibC::Int
  fun lcui_cond_signal = LCUICond_Signal(cond : LcuiCond*) : LibC::Int
  fun lcui_cond_broadcast = LCUICond_Broadcast(cond : LcuiCond*) : LibC::Int
  fun lcui_thread_self_id = LCUIThread_SelfID : LcuiThread
  alias PthreadT = LibC::ULong
  alias LcuiThread = PthreadT
  fun lcui_thread_create = LCUIThread_Create(tidp : LcuiThread*, start_rtn : (Void* -> Void), arg : Void*) : LibC::Int
  fun lcui_thread_join = LCUIThread_Join(thread : LcuiThread, retval : Void**) : LibC::Int
  fun lcui_thread_cancel = LCUIThread_Cancel(thread : LcuiThread)
  fun lcui_thread_exit = LCUIThread_Exit(retval : Void*)
  enum LcuiStyleKeyName
    KeyLeft                    =  0
    KeyRight                   =  1
    KeyTop                     =  2
    KeyBottom                  =  3
    KeyPosition                =  4
    KeyVisibility              =  5
    KeyDisplay                 =  6
    KeyZIndex                  =  7
    KeyOpacity                 =  8
    KeyBoxSizing               =  9
    KeyWidth                   = 10
    KeyHeight                  = 11
    KeyMinWidth                = 12
    KeyMinHeight               = 13
    KeyMaxWidth                = 14
    KeyMaxHeight               = 15
    KeyMarginTop               = 16
    KeyMarginRight             = 17
    KeyMarginBottom            = 18
    KeyMarginLeft              = 19
    KeyPaddingTop              = 20
    KeyPaddingRight            = 21
    KeyPaddingBottom           = 22
    KeyPaddingLeft             = 23
    KeyVerticalAlign           = 24
    KeyBorderTopWidth          = 25
    KeyBorderTopStyle          = 26
    KeyBorderTopColor          = 27
    KeyBorderRightWidth        = 28
    KeyBorderRightStyle        = 29
    KeyBorderRightColor        = 30
    KeyBorderBottomWidth       = 31
    KeyBorderBottomStyle       = 32
    KeyBorderBottomColor       = 33
    KeyBorderLeftWidth         = 34
    KeyBorderLeftStyle         = 35
    KeyBorderLeftColor         = 36
    KeyBorderTopLeftRadius     = 37
    KeyBorderTopRightRadius    = 38
    KeyBorderBottomLeftRadius  = 39
    KeyBorderBottomRightRadius = 40
    KeyBackgroundColor         = 41
    KeyBackgroundImage         = 42
    KeyBackgroundSize          = 43
    KeyBackgroundSizeWidth     = 44
    KeyBackgroundSizeHeight    = 45
    KeyBackgroundRepeat        = 46
    KeyBackgroundRepeatX       = 47
    KeyBackgroundRepeatY       = 48
    KeyBackgroundPosition      = 49
    KeyBackgroundPositionX     = 50
    KeyBackgroundPositionY     = 51
    KeyBackgroundOrigin        = 52
    KeyBoxShadowX              = 53
    KeyBoxShadowY              = 54
    KeyBoxShadowSpread         = 55
    KeyBoxShadowBlur           = 56
    KeyBoxShadowColor          = 57
    KeyFlexBasis               = 58
    KeyFlexGrow                = 59
    KeyFlexShrink              = 60
    KeyFlexDirection           = 61
    KeyFlexWrap                = 62
    KeyJustifyContent          = 63
    KeyAlignContent            = 64
    KeyAlignItems              = 65
    KeyPointerEvents           = 66
    KeyFocusable               = 67
    StyleKeyTotal              = 68
  end

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
    id : LibC::Char*
    type : LibC::Char*
    classes : LibC::Char**
    status : LibC::Char**
    fullname : LibC::Char*
    rank : LibC::Int
  end

  struct LcuiSelectorRec
    rank : LibC::Int
    batch_num : LibC::Int
    length : LibC::Int
    hash : LibC::UInt
    nodes : LcuiSelectorNode*
  end

  alias LcuiSelectorNode = LcuiSelectorNodeRec*
  fun lcui_put_style_sheet = LCUI_PutStyleSheet(selector : LcuiSelector, in_ss : LcuiStyleSheet, space : LibC::Char*) : LibC::Int
  alias LcuiSelector = LcuiSelectorRec*
  alias LcuiStyleSheet = LcuiStyleSheetRec*
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

  alias LcuiFlexBoxLayoutStyle = LcuiFlexLayoutStyle

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

  enum LcuiWidgetTaskType
    LcuiWtaskRefreshStyle =  0
    LcuiWtaskUpdateStyle  =  1
    LcuiWtaskTitle        =  2
    LcuiWtaskProps        =  3
    LcuiWtaskBoxSizing    =  4
    LcuiWtaskPadding      =  5
    LcuiWtaskMargin       =  6
    LcuiWtaskVisible      =  7
    LcuiWtaskDisplay      =  8
    LcuiWtaskFlex         =  9
    LcuiWtaskShadow       = 10
    LcuiWtaskBorder       = 11
    LcuiWtaskBackground   = 12
    LcuiWtaskPosition     = 13
    LcuiWtaskResize       = 14
    LcuiWtaskZindex       = 15
    LcuiWtaskOpacity      = 16
    LcuiWtaskReflow       = 17
    LcuiWtaskUser         = 18
    LcuiWtaskTotalNum     = 19
  end

  struct LcuiWidgetBoxModelRec
    content : LcuiRectF
    padding : LcuiRectF
    border : LcuiRectF
    canvas : LcuiRectF
    outer : LcuiRectF
  end

  struct LcuiWidgetTaskRec
    for_self : LcuiBool
    for_children : LcuiBool
    skip_surface_props_sync : LcuiBool
    states : LcuiBool[19]
  end

  enum LcuiWidgetState
    LcuiWstateCreated  = 0
    LcuiWstateUpdated  = 1
    LcuiWstateLayouted = 2
    LcuiWstateReady    = 3
    LcuiWstateNormal   = 4
    LcuiWstateDeleted  = 5
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
    layout_x : LibC::Float
    layout_y : LibC::Float
    x : LibC::Float
    y : LibC::Float
    width : LibC::Float
    height : LibC::Float
    max_content_width : LibC::Float
    max_content_height : LibC::Float
    padding : LcuiRect2F
    margin : LcuiRect2F
    box : LcuiWidgetBoxModelRec
    style : LcuiStyleSheet
    custom_style : LcuiStyleList
    inherited_style : LcuiCachedStyleSheet
    computed_style : LcuiWidgetStyle
    data : LcuiWidgetData
    proto : LcuiWidgetPrototypeC
    task : LcuiWidgetTaskRec
    rules : LcuiWidgetRules
    trigger : LcuiEventTrigger
    invalid_area : LcuiRectF
    invalid_area_type : LcuiInvalidAreaType
    has_child_invalid_area : LcuiBool
    parent : LcuiWidget
    children : LinkedList
    children_show : LinkedList
    index : LibC::SizeT
    node : LinkedListNode
    node_show : LinkedListNode
  end

  alias StrlistT = LibC::Char**

  struct Dict
    type : DictType*
    privdata : Void*
    ht : DictHashTable[2]
    rehashidx : LibC::Int
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
    table : DictEntry**
    size : LibC::ULong
    sizemask : LibC::ULong
    used : LibC::ULong
  end

  struct DictEntry
    key : Void*
    v : DictEntryFV
    next : DictEntry*
  end

  union DictEntryFV
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
  alias LcuiWidgetSizeGetter = (LcuiWidget, LibC::Float*, LibC::Float*, LcuiLayoutRule -> Void)
  alias LcuiWidgetSizeSetter = (LcuiWidget, LibC::Float, LibC::Float -> Void)
  alias LcuiPaintContext = LcuiPaintContextRec*
  alias LcuiWidgetActualStyle = LcuiWidgetActualStyleRec*
  alias LcuiWidgetPainter = (LcuiWidget, LcuiPaintContext, LcuiWidgetActualStyle -> Void)
  alias LcuiWidgetPrototypeC = LcuiWidgetPrototypeRec*

  struct LcuiWidgetRulesRec
    only_on_visible : LcuiBool
    first_update_visible_children : LcuiBool
    cache_children_style : LcuiBool
    ignore_status_change : LcuiBool
    ignore_classes_change : LcuiBool
    max_update_children_count : LibC::Int
    max_render_children_count : LibC::UInt
    on_update_progress : (LcuiWidget, LibC::SizeT -> Void)
  end

  alias LcuiWidgetRules = LcuiWidgetRulesRec*
  alias LcuiEventTrigger = LcuiEventTriggerRec*
  enum LcuiInvalidAreaType
    LcuiInvalidAreaTypeNone       = 0
    LcuiInvalidAreaTypeCustom     = 1
    LcuiInvalidAreaTypePaddingBox = 2
    LcuiInvalidAreaTypeBorderBox  = 3
    LcuiInvalidAreaTypeCanvasBox  = 4
  end

  struct LcuiWidgetRulesDataRec
    rules : LcuiWidgetRulesRec
    style_cache : Dict*
    default_max_update_count : LibC::SizeT
    progress : LibC::SizeT
  end

  struct LcuiWidgetAttributeRec
    name : LibC::Char*
    value : LcuiWidgetAttributeRecFValue
  end

  struct LcuiWidgetAttributeRecFValue
    type : LibC::Int
    destructor : (Void* -> Void)
    field_0 : LcuiWidgetAttributeRecFValueFField0
  end

  union LcuiWidgetAttributeRecFValueFField0
    string : LibC::Char*
    data : Void*
  end

  fun widget_is_flex_layout_style_works = Widget_IsFlexLayoutStyleWorks(w : LcuiWidget) : LcuiBool
  fun widget_compute_x_metric = Widget_ComputeXMetric(w : LcuiWidget, key : LibC::Int) : LibC::Float
  fun widget_compute_y_metric = Widget_ComputeYMetric(w : LcuiWidget, key : LibC::Int) : LibC::Float
  fun widget_has_auto_style = Widget_HasAutoStyle(w : LcuiWidget, key : LibC::Int) : LcuiBool
  fun lcui_widget_get_root = LCUIWidget_GetRoot : LcuiWidget
  fun lcui_widget_get_by_id = LCUIWidget_GetById(idstr : LibC::Char*) : LcuiWidget
  fun lcui_widget_new_with_prototype = LCUIWidget_NewWithPrototype(proto : LcuiWidgetPrototypeC) : LcuiWidget
  fun lcui_widget_new = LCUIWidget_New(type_name : LibC::Char*) : LcuiWidget
  fun widget_exec_destroy = Widget_ExecDestroy(w : LcuiWidget)
  fun widget_destroy = Widget_Destroy(w : LcuiWidget)
  fun widget_get_offset = Widget_GetOffset(w : LcuiWidget, parent : LcuiWidget, offset_x : LibC::Float*, offset_y : LibC::Float*)
  fun widget_top = Widget_Top(w : LcuiWidget) : LibC::Int
  fun widget_sort_children_show = Widget_SortChildrenShow(w : LcuiWidget)
  fun widget_set_title_w = Widget_SetTitleW(w : LcuiWidget, title : WcharT*)
  fun widget_add_state = Widget_AddState(w : LcuiWidget, state : LcuiWidgetState)
  fun widget_in_visible_area = Widget_InVisibleArea(w : LcuiWidget) : LcuiBool
  fun widget_set_rules = Widget_SetRules(w : LcuiWidget, rules : LcuiWidgetRulesRec*) : LibC::Int
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
  fun widget_generate_self_hash = Widget_GenerateSelfHash(w : LcuiWidget)
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
  fun widget_set_disabled = Widget_SetDisabled(w : LcuiWidget, disabled : LcuiBool)
  fun widget_destroy_status = Widget_DestroyStatus(w : LcuiWidget)
  fun widget_set_padding = Widget_SetPadding(w : LcuiWidget, top : LibC::Float, right : LibC::Float, bottom : LibC::Float, left : LibC::Float)
  fun widget_set_margin = Widget_SetMargin(w : LcuiWidget, top : LibC::Float, right : LibC::Float, bottom : LibC::Float, left : LibC::Float)
  fun widget_set_border_color = Widget_SetBorderColor(w : LcuiWidget, color : LcuiColor)
  fun widget_set_border_width = Widget_SetBorderWidth(w : LcuiWidget, width : LibC::Float)
  fun widget_set_border_style = Widget_SetBorderStyle(w : LcuiWidget, style : LibC::Int)
  fun widget_set_border = Widget_SetBorder(w : LcuiWidget, width : LibC::Float, style : LibC::Int, clr : LcuiColor)
  fun widget_set_box_shadow = Widget_SetBoxShadow(w : LcuiWidget, x : LibC::Float, y : LibC::Float, blur : LibC::Float, color : LcuiColor)
  fun widget_move = Widget_Move(w : LcuiWidget, left : LibC::Float, top : LibC::Float)
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
  fun widget_collect_references = Widget_CollectReferences(w : LcuiWidget) : Dict*
  fun widget_get_closest = Widget_GetClosest(w : LcuiWidget, type : LibC::Char*) : LcuiWidget
  fun widget_unlink = Widget_Unlink(widget : LcuiWidget) : LibC::Int
  fun widget_append = Widget_Append(container : LcuiWidget, widget : LcuiWidget) : LibC::Int
  fun widget_prepend = Widget_Prepend(parent : LcuiWidget, widget : LcuiWidget) : LibC::Int
  fun widget_unwrap = Widget_Unwrap(widget : LcuiWidget) : LibC::Int
  fun widget_empty = Widget_Empty(widget : LcuiWidget)
  fun widget_get_prev = Widget_GetPrev(w : LcuiWidget) : LcuiWidget
  fun widget_get_next = Widget_GetNext(w : LcuiWidget) : LcuiWidget
  fun widget_get_child = Widget_GetChild(w : LcuiWidget, index : LibC::SizeT) : LcuiWidget
  fun widget_each = Widget_Each(w : LcuiWidget, callback : (LcuiWidget, Void* -> Void), arg : Void*) : LibC::SizeT
  fun widget_at = Widget_At(widget : LcuiWidget, x : LibC::Int, y : LibC::Int) : LcuiWidget
  fun widget_destroy_children = Widget_DestroyChildren(w : LcuiWidget)
  fun widget_print_tree = Widget_PrintTree(w : LcuiWidget)
  fun widget_reflow = Widget_Reflow(w : LcuiWidget, rule : LcuiLayoutRule)
  fun widget_auto_reflow = Widget_AutoReflow(w : LcuiWidget, rule : LcuiLayoutRule) : LcuiBool
  fun widget_update_task_status = Widget_UpdateTaskStatus(widget : LcuiWidget)
  fun widget_add_task = Widget_AddTask(widget : LcuiWidget, task_type : LibC::Int)
  fun widget_update = Widget_Update(w : LcuiWidget) : LibC::SizeT
  fun widget_update_with_profile = Widget_UpdateWithProfile(w : LcuiWidget, profile : LcuiWidgetTasksProfile)
  alias LcuiWidgetTasksProfile = LcuiWidgetTasksRec*
  fun widget_add_task_for_children = Widget_AddTaskForChildren(widget : LcuiWidget, task : LibC::Int)
  fun lcui_widget_init_tasks = LCUIWidget_InitTasks
  fun lcui_widget_free_tasks = LCUIWidget_FreeTasks
  fun lcui_widget_update = LCUIWidget_Update : LibC::SizeT
  fun lcui_widget_update_with_profile = LCUIWidget_UpdateWithProfile(profile : LcuiWidgetTasksProfile)
  fun lcui_widget_refresh_style = LCUIWidget_RefreshStyle
  fun widget_invalidate_area = Widget_InvalidateArea(widget : LcuiWidget, in_rect : LcuiRectF*, box_type : LibC::Int) : LcuiBool
  fun widget_get_invalid_area = Widget_GetInvalidArea(w : LcuiWidget, rects : LinkedList*) : LibC::SizeT
  fun widget_convert_area = Widget_ConvertArea(w : LcuiWidget, in_rect : LcuiRect*, out_rect : LcuiRect*, box_type : LibC::Int) : LibC::Int
  fun widget_render = Widget_Render(w : LcuiWidget, paint : LcuiPaintContext) : LibC::SizeT
  fun lcui_widget_init_renderer = LCUIWidget_InitRenderer
  fun lcui_widget_free_renderer = LCUIWidget_FreeRenderer
  fun lcui_widget_init_prototype = LCUIWidget_InitPrototype
  fun lcui_widget_free_prototype = LCUIWidget_FreePrototype
  fun lcui_widget_get_prototype = LCUIWidget_GetPrototype(name : LibC::Char*) : LcuiWidgetPrototype
  fun lcui_widget_new_prototype = LCUIWidget_NewPrototype(name : LibC::Char*, parent_name : LibC::Char*) : LcuiWidgetPrototype
  fun widget_check_type = Widget_CheckType(w : LcuiWidget, type : LibC::Char*) : LcuiBool
  fun widget_check_prototype = Widget_CheckPrototype(w : LcuiWidget, proto : LcuiWidgetPrototypeC) : LcuiBool
  fun widget_get_data = Widget_GetData(widget : LcuiWidget, proto : LcuiWidgetPrototype) : Void*
  fun widget_add_data = Widget_AddData(widget : LcuiWidget, proto : LcuiWidgetPrototype, data_size : LibC::SizeT) : Void*
  fun widget_clear_prototype = Widget_ClearPrototype(widget : LcuiWidget)
  enum LcuiWidgetEventType
    LcuiWeventNone        =  0
    LcuiWeventLink        =  1
    LcuiWeventUnlink      =  2
    LcuiWeventReady       =  3
    LcuiWeventDestroy     =  4
    LcuiWeventMove        =  5
    LcuiWeventResize      =  6
    LcuiWeventShow        =  7
    LcuiWeventHide        =  8
    LcuiWeventFocus       =  9
    LcuiWeventBlur        = 10
    LcuiWeventAfterlayout = 11
    LcuiWeventKeydown     = 12
    LcuiWeventKeyup       = 13
    LcuiWeventKeypress    = 14
    LcuiWeventTextinput   = 15
    LcuiWeventMouseover   = 16
    LcuiWeventMousemove   = 17
    LcuiWeventMouseout    = 18
    LcuiWeventMousedown   = 19
    LcuiWeventMouseup     = 20
    LcuiWeventMousewheel  = 21
    LcuiWeventClick       = 22
    LcuiWeventDblclick    = 23
    LcuiWeventTouch       = 24
    LcuiWeventTouchdown   = 25
    LcuiWeventTouchup     = 26
    LcuiWeventTouchmove   = 27
    LcuiWeventTitle       = 28
    LcuiWeventSurface     = 29
    LcuiWeventUser        = 30
  end

  struct LcuiWidgetEventRec
    type : Uint32T
    data : Void*
    target : LcuiWidget
    cancel_bubble : LcuiBool
    field_0 : LcuiWidgetEventRecFField0
  end

  union LcuiWidgetEventRecFField0
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
  fun widget_post_event = Widget_PostEvent(widget : LcuiWidget, ev : LcuiWidgetEvent, data : Void*, destroy_data : (Void* -> Void)) : LcuiBool
  alias LcuiWidgetEvent = LcuiWidgetEventRec*
  fun widget_trigger_event = Widget_TriggerEvent(widget : LcuiWidget, e : LcuiWidgetEvent, data : Void*) : LibC::Int
  fun lcui_widget_alloc_event_id = LCUIWidget_AllocEventId : LibC::Int
  fun lcui_widget_set_event_name = LCUIWidget_SetEventName(event_id : LibC::Int, event_name : LibC::Char*) : LibC::Int
  fun lcui_widget_get_event_name = LCUIWidget_GetEventName(event_id : LibC::Int) : LibC::Char*
  fun lcui_widget_get_event_id = LCUIWidget_GetEventId(event_name : LibC::Char*) : LibC::Int
  fun lcui_init_widget_event = LCUI_InitWidgetEvent(e : LcuiWidgetEvent, name : LibC::Char*)
  fun widget_bind_event_by_id = Widget_BindEventById(widget : LcuiWidget, event_id : LibC::Int, func : LcuiWidgetEventFunc, data : Void*, destroy_data : (Void* -> Void)) : LibC::Int
  alias LcuiWidgetEventFunc = (LcuiWidget, LcuiWidgetEvent, Void* -> Void)
  fun widget_bind_event = Widget_BindEvent(widget : LcuiWidget, event_name : LibC::Char*, func : LcuiWidgetEventFunc, data : Void*, destroy_data : (Void* -> Void)) : LibC::Int
  fun widget_unbind_event_by_id = Widget_UnbindEventById(widget : LcuiWidget, event_id : LibC::Int, func : LcuiWidgetEventFunc) : LibC::Int
  fun widget_unbind_event_by_handler_id = Widget_UnbindEventByHandlerId(widget : LcuiWidget, handler_id : LibC::Int) : LibC::Int
  fun widget_unbind_event = Widget_UnbindEvent(widget : LcuiWidget, event_name : LibC::Char*, func : LcuiWidgetEventFunc) : LibC::Int
  fun widget_post_surface_event = Widget_PostSurfaceEvent(w : LcuiWidget, event_type : LibC::Int, sync_props : LcuiBool) : LibC::Int
  fun lcui_widget_clear_event_target = LCUIWidget_ClearEventTarget(widget : LcuiWidget)
  fun lcui_widget_get_focus = LCUIWidget_GetFocus : LcuiWidget
  fun lcui_widget_set_focus = LCUIWidget_SetFocus(widget : LcuiWidget) : LibC::Int
  fun widget_stop_event_propagation = Widget_StopEventPropagation(widget : LcuiWidget) : LibC::Int
  fun widget_set_mouse_capture = Widget_SetMouseCapture(w : LcuiWidget)
  fun widget_release_mouse_capture = Widget_ReleaseMouseCapture(w : LcuiWidget)
  fun widget_set_touch_capture = Widget_SetTouchCapture(w : LcuiWidget, point_id : LibC::Int) : LibC::Int
  fun widget_release_touch_capture = Widget_ReleaseTouchCapture(w : LcuiWidget, point_id : LibC::Int) : LibC::Int
  fun widget_destroy_event_trigger = Widget_DestroyEventTrigger(w : LcuiWidget)
  fun lcui_widget_init_event = LCUIWidget_InitEvent
  fun lcui_widget_free_event = LCUIWidget_FreeEvent
  fun lcui_load_css_file = LCUI_LoadCSSFile(filepath : LibC::Char*) : LibC::Int
  fun lcui_load_css_string = LCUI_LoadCSSString(str : LibC::Char*, space : LibC::Char*) : LibC::SizeT
  fun lcui_widget_init_style = LCUIWidget_InitStyle
  fun lcui_widget_free_style = LCUIWidget_FreeStyle
  fun widget_print_style_sheets = Widget_PrintStyleSheets(w : LcuiWidget)
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
  fun widget_update_style = Widget_UpdateStyle(w : LcuiWidget, is_refresh_all : LcuiBool)
  fun widget_update_children_style = Widget_UpdateChildrenStyle(w : LcuiWidget, is_refresh_all : LcuiBool)
  fun widget_add_task_by_style = Widget_AddTaskByStyle(w : LcuiWidget, key : LibC::Int)
  fun widget_exec_update_style = Widget_ExecUpdateStyle(w : LcuiWidget, is_update_all : LcuiBool)
  fun widget_destroy_style_sheets = Widget_DestroyStyleSheets(w : LcuiWidget)
  fun widget_get_selector_node = Widget_GetSelectorNode(w : LcuiWidget) : LcuiSelectorNode
  fun widget_get_selector = Widget_GetSelector(w : LcuiWidget) : LcuiSelector
  fun widget_get_children_style_changes = Widget_GetChildrenStyleChanges(w : LcuiWidget, type : LibC::Int, name : LibC::Char*) : LibC::SizeT
  fun widget_padding_x = Widget_PaddingX(w : LcuiWidget) : LibC::Float
  fun widget_padding_y = Widget_PaddingY(w : LcuiWidget) : LibC::Float
  fun widget_border_x = Widget_BorderX(w : LcuiWidget) : LibC::Float
  fun widget_border_y = Widget_BorderY(w : LcuiWidget) : LibC::Float
  fun widget_margin_x = Widget_MarginX(w : LcuiWidget) : LibC::Float
  fun widget_margin_y = Widget_MarginY(w : LcuiWidget) : LibC::Float
  fun widget_get_limited_width = Widget_GetLimitedWidth(w : LcuiWidget, width : LibC::Float) : LibC::Float
  fun widget_get_limited_height = Widget_GetLimitedHeight(w : LcuiWidget, height : LibC::Float) : LibC::Float
  fun lcui_init_widget = LCUI_InitWidget
  fun lcui_free_widget = LCUI_FreeWidget
  fun lcui_builder_load_string = LCUIBuilder_LoadString(str : LibC::Char*, size : LibC::Int) : LcuiWidget
  fun lcui_builder_load_file = LCUIBuilder_LoadFile(filepath : LibC::Char*) : LcuiWidget

  struct LcuiMetricsRec
    dpi : LibC::Float
    density : LibC::Float
    scaled_density : LibC::Float
    scale : LibC::Float
  end

  enum LcuiDensityLevel
    DensityLevelSmall  = 0
    DensityLevelNormal = 1
    DensityLevelLarge  = 2
    DensityLevelBig    = 3
  end
  fun lcui_metrics_compute = LCUIMetrics_Compute(value : LibC::Float, type : LcuiStyleType) : LibC::Float
  fun lcui_metrics_compute_style = LCUIMetrics_ComputeStyle(style : LcuiStyle) : LibC::Float
  fun lcui_metrics_compute_rect_actual = LCUIMetrics_ComputeRectActual(dst : LcuiRect*, src : LcuiRectF*)
  fun lcui_metrics_compute_actual = LCUIMetrics_ComputeActual(value : LibC::Float, type : LcuiStyleType) : LibC::Int
  fun lcui_metrics_get_scale = LCUIMetrics_GetScale : LibC::Float
  fun lcui_metrics_set_density = LCUIMetrics_SetDensity(density : LibC::Float)
  fun lcui_metrics_set_scaled_density = LCUIMetrics_SetScaledDensity(density : LibC::Float)
  fun lcui_metrics_set_density_level = LCUIMetrics_SetDensityLevel(level : LcuiDensityLevel)
  fun lcui_metrics_set_scaled_density_level = LCUIMetrics_SetScaledDensityLevel(level : LcuiDensityLevel)
  fun lcui_metrics_set_dpi = LCUIMetrics_SetDpi(dpi : LibC::Float)
  fun lcui_metrics_set_scale = LCUIMetrics_SetScale(scale : LibC::Float)
  fun lcui_init_metrics = LCUI_InitMetrics
  fun lcui_get_metrics = LCUI_GetMetrics : LcuiMetricsRec*
  enum LcuiDisplayMode
    LcuiDmodeWindowed   = 1
    LcuiDmodeSeamless   = 2
    LcuiDmodeFullscreen = 3
  end
  enum LcuiDisplayEventType
    LcuiDeventNone       = 0
    LcuiDeventPaint      = 1
    LcuiDeventResize     = 2
    LcuiDeventMinmaxinfo = 3
    LcuiDeventReady      = 4
  end

  struct LcuiMinMaxInfoRec
    min_width : LibC::Int
    min_height : LibC::Int
    max_width : LibC::Int
    max_height : LibC::Int
  end

  struct LcuiDisplayEventRec
    type : LibC::Int
    field_0 : LcuiDisplayEventRecFField0
    field_1 : LcuiDisplayEventRecFField1
    field_2 : LcuiDisplayEventRecFField2
    surface : LcuiSurface
  end

  struct LcuiDisplayEventRecFField0
    rect : LcuiRect
  end

  struct LcuiDisplayEventRecFField1
    width : LibC::Int
    height : LibC::Int
  end

  union LcuiDisplayEventRecFField2
    paint : LcuiDisplayEventRecFField0
    resize : LcuiDisplayEventRecFField1
    minmaxinfo : LcuiMinMaxInfoRec
  end

  alias LcuiSurface = Void*

  struct LcuiDisplayDriverRec
    name : LibC::Char[256]
    get_width : (-> LibC::Int)
    get_height : (-> LibC::Int)
    create : (-> LcuiSurface)
    destroy : (LcuiSurface -> Void)
    close : (LcuiSurface -> Void)
    resize : (LcuiSurface, LibC::Int, LibC::Int -> Void)
    move : (LcuiSurface, LibC::Int, LibC::Int -> Void)
    show : (LcuiSurface -> Void)
    hide : (LcuiSurface -> Void)
    update : (LcuiSurface -> Void)
    present : (LcuiSurface -> Void)
    is_ready : (LcuiSurface -> LcuiBool)
    begin_paint : (LcuiSurface, LcuiRect* -> LcuiPaintContext)
    end_paint : (LcuiSurface, LcuiPaintContext -> Void)
    set_caption_w : (LcuiSurface, WcharT* -> Void)
    set_render_mode : (LcuiSurface, LibC::Int -> Void)
    get_handle : (LcuiSurface -> Void)
    get_surface_width : (LcuiSurface -> LibC::Int)
    get_surface_height : (LcuiSurface -> LibC::Int)
    set_opacity : (LcuiSurface, LibC::Float -> Void)
    bind_event : (LibC::Int, LcuiEventFunc, Void*, (Void* -> Void) -> LibC::Int)
  end

  fun lcui_display_set_mode = LCUIDisplay_SetMode(mode : LibC::Int) : LibC::Int
  fun lcui_display_get_mode = LCUIDisplay_GetMode : LibC::Int
  fun lcui_display_update = LCUIDisplay_Update
  fun lcui_display_render = LCUIDisplay_Render : LibC::SizeT
  fun lcui_display_present = LCUIDisplay_Present
  fun lcui_display_enable_paint_flashing = LCUIDisplay_EnablePaintFlashing(enable : LcuiBool)
  fun lcui_display_set_size = LCUIDisplay_SetSize(width : LibC::Int, height : LibC::Int)
  fun lcui_display_get_width = LCUIDisplay_GetWidth : LibC::Int
  fun lcui_display_get_height = LCUIDisplay_GetHeight : LibC::Int
  fun lcui_display_invalidate_area = LCUIDisplay_InvalidateArea(rect : LcuiRect*)
  fun lcui_display_get_surface_owner = LCUIDisplay_GetSurfaceOwner(w : LcuiWidget) : LcuiSurface
  fun lcui_display_get_surface_by_handle = LCUIDisplay_GetSurfaceByHandle(handle : Void*) : LcuiSurface
  fun lcui_display_bind_event = LCUIDisplay_BindEvent(event_id : LibC::Int, func : LcuiEventFunc, arg : Void*, data : Void*, destroy_data : (Void* -> Void)) : LibC::Int
  fun lcui_init_display = LCUI_InitDisplay(driver : LcuiDisplayDriver) : LibC::Int
  alias LcuiDisplayDriver = LcuiDisplayDriverRec*
  fun lcui_free_display = LCUI_FreeDisplay : LibC::Int
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
  fun text_edit_enable_style_tag = TextEdit_EnableStyleTag(widget : LcuiWidget, enable : LcuiBool)
  fun text_edit_enable_multiline = TextEdit_EnableMultiline(widget : LcuiWidget, enable : LcuiBool)
  fun text_edit_move_caret = TextEdit_MoveCaret(widget : LcuiWidget, row : LibC::Int, col : LibC::Int)
  fun text_edit_clear_text = TextEdit_ClearText(widget : LcuiWidget)
  fun text_edit_get_text_w = TextEdit_GetTextW(w : LcuiWidget, start : LibC::SizeT, max_len : LibC::SizeT, buf : WcharT*) : LibC::SizeT
  fun text_edit_get_text_length = TextEdit_GetTextLength(w : LcuiWidget) : LibC::SizeT
  fun text_edit_set_caret_blink = TextEdit_SetCaretBlink(w : LcuiWidget, visible : LcuiBool, time : LibC::Int)
  fun text_edit_get_property = TextEdit_GetProperty(w : LcuiWidget, name : LibC::Char*) : LcuiObject
  fun text_edit_set_text_w = TextEdit_SetTextW(widget : LcuiWidget, wstr : WcharT*) : LibC::Int
  fun text_edit_set_text = TextEdit_SetText(widget : LcuiWidget, utf8_str : LibC::Char*) : LibC::Int
  fun text_edit_append_text_w = TextEdit_AppendTextW(widget : LcuiWidget, wstr : WcharT*) : LibC::Int
  fun text_edit_insert_text_w = TextEdit_InsertTextW(widget : LcuiWidget, wstr : WcharT*) : LibC::Int
  fun text_edit_set_place_holder_w = TextEdit_SetPlaceHolderW(w : LcuiWidget, wstr : WcharT*) : LibC::Int
  fun text_edit_set_place_holder = TextEdit_SetPlaceHolder(w : LcuiWidget, str : LibC::Char*) : LibC::Int
  fun text_edit_set_password_char = TextEdit_SetPasswordChar(w : LcuiWidget, ch : WcharT)
  fun lcui_widget_add_text_edit = LCUIWidget_AddTextEdit
  fun text_caret_refresh = TextCaret_Refresh(widget : LcuiWidget)
  fun text_caret_set_visible = TextCaret_SetVisible(widget : LcuiWidget, visible : LcuiBool)
  fun text_caret_set_blink_time = TextCaret_SetBlinkTime(widget : LcuiWidget, n_ms : LibC::UInt)
  fun lcui_widget_add_text_caret = LCUIWidget_AddTextCaret
  fun side_bar_append_item = SideBar_AppendItem(sidebar : LcuiWidget, id : WcharT*, icon : WcharT*, text : WcharT*) : LcuiWidget
  fun lcui_widget_add_side_bar = LCUIWidget_AddSideBar
  enum LcuiScrollBarDirection
    LcuiScrollbarHorizontal = 0
    LcuiScrollbarVertical   = 1
  end
  fun scroll_bar_bind_box = ScrollBar_BindBox(w : LcuiWidget, box : LcuiWidget)
  fun scroll_bar_bind_target = ScrollBar_BindTarget(w : LcuiWidget, layer : LcuiWidget)
  fun scroll_bar_get_position = ScrollBar_GetPosition(w : LcuiWidget) : LibC::Int
  fun scroll_bar_set_position = ScrollBar_SetPosition(w : LcuiWidget, pos : LibC::Int) : LibC::Int
  fun scroll_bar_set_direction = ScrollBar_SetDirection(w : LcuiWidget, direction : LcuiScrollBarDirection)
  fun lcui_widget_add_t_scroll_bar = LCUIWidget_AddTScrollBar
  fun button_set_text_w = Button_SetTextW(w : LcuiWidget, wstr : WcharT*)
  fun button_set_text = Button_SetText(w : LcuiWidget, str : LibC::Char*)
  fun lcui_widget_add_button = LCUIWidget_AddButton
  fun anchor_open = Anchor_Open(w : LcuiWidget)
  fun lcui_widget_add_anchor = LCUIWidget_AddAnchor
end
