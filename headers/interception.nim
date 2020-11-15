const
  INTERCEPTION_API* = true
  INTERCEPTION_MAX_KEYBOARD* = 10
  INTERCEPTION_MAX_MOUSE* = 10
  INTERCEPTION_MAX_DEVICE* = (
    (INTERCEPTION_MAX_KEYBOARD) + (INTERCEPTION_MAX_MOUSE))

template INTERCEPTION_KEYBOARD*(index: untyped): untyped =
  ((index) + 1)

template INTERCEPTION_MOUSE*(index: untyped): untyped =
  ((INTERCEPTION_MAX_KEYBOARD) + (index) + 1)

type
  InterceptionContext* = pointer
  InterceptionDevice* = cint
  InterceptionPrecedence* = cint
  InterceptionFilter* = cushort
  InterceptionPredicate* = proc (device: InterceptionDevice): cint
  InterceptionKeyState* = enum
    INTERCEPTION_KEY_DOWN = 0x00000000, INTERCEPTION_KEY_UP = 0x00000001,
    INTERCEPTION_KEY_E0 = 0x00000002, INTERCEPTION_KEY_E1 = 0x00000004,
    INTERCEPTION_KEY_TERMSRV_SET_LED = 0x00000008,
    INTERCEPTION_KEY_TERMSRV_SHADOW = 0x00000010,
    INTERCEPTION_KEY_TERMSRV_VKPACKET = 0x00000020


type
  InterceptionFilterKeyState* = enum
    INTERCEPTION_FILTER_KEY_NONE = 0x00000000,
    INTERCEPTION_FILTER_KEY_ALL = 0x0000FFFF,
    INTERCEPTION_FILTER_KEY_DOWN = INTERCEPTION_KEY_UP,
    INTERCEPTION_FILTER_KEY_UP = INTERCEPTION_KEY_UP shl 1,
    INTERCEPTION_FILTER_KEY_E0 = INTERCEPTION_KEY_E0 shl 1,
    INTERCEPTION_FILTER_KEY_E1 = INTERCEPTION_KEY_E1 shl 1, INTERCEPTION_FILTER_KEY_TERMSRV_SET_LED = INTERCEPTION_KEY_TERMSRV_SET_LED shl
        1, INTERCEPTION_FILTER_KEY_TERMSRV_SHADOW = INTERCEPTION_KEY_TERMSRV_SHADOW shl
        1, INTERCEPTION_FILTER_KEY_TERMSRV_VKPACKET = INTERCEPTION_KEY_TERMSRV_VKPACKET shl
        1


type
  InterceptionMouseState* = enum
    INTERCEPTION_MOUSE_LEFT_BUTTON_DOWN = 0x00000001,
    INTERCEPTION_MOUSE_LEFT_BUTTON_UP = 0x00000002,
    INTERCEPTION_MOUSE_RIGHT_BUTTON_DOWN = 0x00000004,
    INTERCEPTION_MOUSE_RIGHT_BUTTON_UP = 0x00000008,
    INTERCEPTION_MOUSE_MIDDLE_BUTTON_DOWN = 0x00000010,
    INTERCEPTION_MOUSE_MIDDLE_BUTTON_UP = 0x00000020,
    INTERCEPTION_MOUSE_BUTTON_4_DOWN = 0x00000040,
    INTERCEPTION_MOUSE_BUTTON_4_UP = 0x00000080,
    INTERCEPTION_MOUSE_BUTTON_5_DOWN = 0x00000100,
    INTERCEPTION_MOUSE_BUTTON_5_UP = 0x00000200,
    INTERCEPTION_MOUSE_WHEEL = 0x00000400, INTERCEPTION_MOUSE_HWHEEL = 0x00000800

const
  INTERCEPTION_MOUSE_BUTTON_1_DOWN = INTERCEPTION_MOUSE_LEFT_BUTTON_DOWN
  INTERCEPTION_MOUSE_BUTTON_1_UP = INTERCEPTION_MOUSE_LEFT_BUTTON_UP
  INTERCEPTION_MOUSE_BUTTON_2_DOWN = INTERCEPTION_MOUSE_RIGHT_BUTTON_DOWN
  INTERCEPTION_MOUSE_BUTTON_2_UP = INTERCEPTION_MOUSE_RIGHT_BUTTON_UP
  INTERCEPTION_MOUSE_BUTTON_3_DOWN = INTERCEPTION_MOUSE_MIDDLE_BUTTON_DOWN
  INTERCEPTION_MOUSE_BUTTON_3_UP = INTERCEPTION_MOUSE_MIDDLE_BUTTON_UP

type
  InterceptionFilterMouseState* = enum
    INTERCEPTION_FILTER_MOUSE_NONE = 0x00000000,
    INTERCEPTION_FILTER_MOUSE_MOVE = 0x00001000,
    INTERCEPTION_FILTER_MOUSE_ALL = 0x0000FFFF, INTERCEPTION_FILTER_MOUSE_LEFT_BUTTON_DOWN = INTERCEPTION_MOUSE_LEFT_BUTTON_DOWN, INTERCEPTION_FILTER_MOUSE_LEFT_BUTTON_UP = INTERCEPTION_MOUSE_LEFT_BUTTON_UP, INTERCEPTION_FILTER_MOUSE_RIGHT_BUTTON_DOWN = INTERCEPTION_MOUSE_RIGHT_BUTTON_DOWN, INTERCEPTION_FILTER_MOUSE_RIGHT_BUTTON_UP = INTERCEPTION_MOUSE_RIGHT_BUTTON_UP, INTERCEPTION_FILTER_MOUSE_MIDDLE_BUTTON_DOWN = INTERCEPTION_MOUSE_MIDDLE_BUTTON_DOWN, INTERCEPTION_FILTER_MOUSE_MIDDLE_BUTTON_UP = INTERCEPTION_MOUSE_MIDDLE_BUTTON_UP,
    INTERCEPTION_FILTER_MOUSE_BUTTON_1_DOWN = INTERCEPTION_MOUSE_BUTTON_1_DOWN,
    INTERCEPTION_FILTER_MOUSE_BUTTON_1_UP = INTERCEPTION_MOUSE_BUTTON_1_UP,
    INTERCEPTION_FILTER_MOUSE_BUTTON_2_DOWN = INTERCEPTION_MOUSE_BUTTON_2_DOWN,
    INTERCEPTION_FILTER_MOUSE_BUTTON_2_UP = INTERCEPTION_MOUSE_BUTTON_2_UP,
    INTERCEPTION_FILTER_MOUSE_BUTTON_3_DOWN = INTERCEPTION_MOUSE_BUTTON_3_DOWN,
    INTERCEPTION_FILTER_MOUSE_BUTTON_3_UP = INTERCEPTION_MOUSE_BUTTON_3_UP,
    INTERCEPTION_FILTER_MOUSE_BUTTON_4_DOWN = INTERCEPTION_MOUSE_BUTTON_4_DOWN,
    INTERCEPTION_FILTER_MOUSE_BUTTON_4_UP = INTERCEPTION_MOUSE_BUTTON_4_UP,
    INTERCEPTION_FILTER_MOUSE_BUTTON_5_DOWN = INTERCEPTION_MOUSE_BUTTON_5_DOWN,
    INTERCEPTION_FILTER_MOUSE_BUTTON_5_UP = INTERCEPTION_MOUSE_BUTTON_5_UP,
    INTERCEPTION_FILTER_MOUSE_WHEEL = INTERCEPTION_MOUSE_WHEEL,
    INTERCEPTION_FILTER_MOUSE_HWHEEL = INTERCEPTION_MOUSE_HWHEEL


type
  InterceptionMouseFlag* = enum
    INTERCEPTION_MOUSE_MOVE_RELATIVE = 0x00000000,
    INTERCEPTION_MOUSE_MOVE_ABSOLUTE = 0x00000001,
    INTERCEPTION_MOUSE_VIRTUAL_DESKTOP = 0x00000002,
    INTERCEPTION_MOUSE_ATTRIBUTES_CHANGED = 0x00000004,
    INTERCEPTION_MOUSE_MOVE_NOCOALESCE = 0x00000008,
    INTERCEPTION_MOUSE_TERMSRV_SRC_SHADOW = 0x00000100


type
  InterceptionMouseStroke* {.bycopy.} = object
    state*: cushort
    flags*: cushort
    rolling*: cshort
    x*: cint
    y*: cint
    information*: cuint

  InterceptionKeyStroke* {.bycopy.} = object
    code*: cushort
    state*: cushort
    information*: cuint

  InterceptionStroke* = array[sizeof((InterceptionMouseStroke)), char]

proc interception_create_context*(): InterceptionContext
proc interception_destroy_context*(context: InterceptionContext)
proc interception_get_precedence*(context: InterceptionContext;
                                 device: InterceptionDevice): InterceptionPrecedence
proc interception_set_precedence*(context: InterceptionContext;
                                 device: InterceptionDevice;
                                 precedence: InterceptionPrecedence)
proc interception_get_filter*(context: InterceptionContext;
                             device: InterceptionDevice): InterceptionFilter
proc interception_set_filter*(context: InterceptionContext;
                             predicate: InterceptionPredicate;
                             filter: InterceptionFilter)
proc interception_wait*(context: InterceptionContext): InterceptionDevice
proc interception_wait_with_timeout*(context: InterceptionContext;
                                    milliseconds: culong): InterceptionDevice
proc interception_send*(context: InterceptionContext; device: InterceptionDevice;
                       stroke: ptr InterceptionStroke; nstroke: cuint): cint
proc interception_receive*(context: InterceptionContext;
                          device: InterceptionDevice;
                          stroke: ptr InterceptionStroke; nstroke: cuint): cint
proc interception_get_hardware_id*(context: InterceptionContext;
                                  device: InterceptionDevice;
                                  hardware_id_buffer: pointer; buffer_size: cuint): cuint
proc interception_is_invalid*(device: InterceptionDevice): cint
proc interception_is_keyboard*(device: InterceptionDevice): cint
proc interception_is_mouse*(device: InterceptionDevice): cint