import winim

proc keycodeToString*(keycode: cint): string =
  case keycode:
    of VK_LBUTTON: "LBUTTON"
    of VK_RBUTTON: "RBUTTON"
    of VK_CANCEL: "CANCEL"
    of VK_MBUTTON: "MBUTTON"
    of VK_XBUTTON1: "XBUTTON1"
    of VK_XBUTTON2: "XBUTTON2"
    of VK_BACK: "BACK"
    of VK_TAB: "TAB"
    of VK_CLEAR: "CLEAR"
    of VK_RETURN: "RETURN"
    of VK_SHIFT: "SHIFT"
    of VK_CONTROL: "CONTROL"
    of VK_MENU: "MENU"
    of VK_PAUSE: "PAUSE"
    of VK_CAPITAL: "CAPITAL"
    of VK_KANA: "KANA"
    of VK_JUNJA: "JUNJA"
    of VK_FINAL: "FINAL"
    of VK_KANJI: "KANJI"
    of VK_ESCAPE: "ESCAPE"
    of VK_CONVERT: "CONVERT"
    of VK_NONCONVERT: "NONCONVERT"
    of VK_ACCEPT: "ACCEPT"
    of VK_MODECHANGE: "MODECHANGE"
    of VK_SPACE: "SPACE"
    of VK_PRIOR: "PRIOR"
    of VK_NEXT: "NEXT"
    of VK_END: "END"
    of VK_HOME: "HOME"
    of VK_LEFT: "LEFT"
    of VK_UP: "UP"
    of VK_RIGHT: "RIGHT"
    of VK_DOWN: "DOWN"
    of VK_SELECT: "SELECT"
    of VK_PRINT: "PRINT"
    of VK_EXECUTE: "EXECUTE"
    of VK_SNAPSHOT: "SNAPSHOT"
    of VK_INSERT: "INSERT"
    of VK_DELETE: "DELETE"
    of VK_HELP: "HELP"
    of VK_LWIN: "LWIN"
    of VK_RWIN: "RWIN"
    of VK_APPS: "APPS"
    of VK_SLEEP: "SLEEP"
    of VK_NUMPAD0: "NUMPAD0"
    of VK_NUMPAD1: "NUMPAD1"
    of VK_NUMPAD2: "NUMPAD2"
    of VK_NUMPAD3: "NUMPAD3"
    of VK_NUMPAD4: "NUMPAD4"
    of VK_NUMPAD5: "NUMPAD5"
    of VK_NUMPAD6: "NUMPAD6"
    of VK_NUMPAD7: "NUMPAD7"
    of VK_NUMPAD8: "NUMPAD8"
    of VK_NUMPAD9: "NUMPAD9"
    of VK_MULTIPLY: "MULTIPLY"
    of VK_ADD: "ADD"
    of VK_SEPARATOR: "SEPARATOR"
    of VK_SUBTRACT: "SUBTRACT"
    of VK_DECIMAL: "DECIMAL"
    of VK_DIVIDE: "DIVIDE"
    of VK_F1: "F1"
    of VK_F2: "F2"
    of VK_F3: "F3"
    of VK_F4: "F4"
    of VK_F5: "F5"
    of VK_F6: "F6"
    of VK_F7: "F7"
    of VK_F8: "F8"
    of VK_F9: "F9"
    of VK_F10: "F10"
    of VK_F11: "F11"
    of VK_F12: "F12"
    of VK_F13: "F13"
    of VK_F14: "F14"
    of VK_F15: "F15"
    of VK_F16: "F16"
    of VK_F17: "F17"
    of VK_F18: "F18"
    of VK_F19: "F19"
    of VK_F20: "F20"
    of VK_F21: "F21"
    of VK_F22: "F22"
    of VK_F23: "F23"
    of VK_F24: "F24"
    of VK_NUMLOCK: "NUMLOCK"
    of VK_SCROLL: "SCROLL"
    of VK_OEM_NEC_EQUAL: "OEM_NEC_EQUAL"
    of VK_OEM_FJ_MASSHOU: "OEM_FJ_MASSHOU"
    of VK_OEM_FJ_TOUROKU: "OEM_FJ_TOUROKU"
    of VK_OEM_FJ_LOYA: "OEM_FJ_LOYA"
    of VK_OEM_FJ_ROYA: "OEM_FJ_ROYA"
    of VK_LSHIFT: "LSHIFT"
    of VK_RSHIFT: "RSHIFT"
    of VK_LCONTROL: "LCONTROL"
    of VK_RCONTROL: "RCONTROL"
    of VK_LMENU: "LMENU"
    of VK_RMENU: "RMENU"
    of VK_BROWSER_BACK: "BROWSER_BACK"
    of VK_BROWSER_FORWARD: "BROWSER_FORWARD"
    of VK_BROWSER_REFRESH: "BROWSER_REFRESH"
    of VK_BROWSER_STOP: "BROWSER_STOP"
    of VK_BROWSER_SEARCH: "BROWSER_SEARCH"
    of VK_BROWSER_FAVORITES: "BROWSER_FAVORITES"
    of VK_BROWSER_HOME: "BROWSER_HOME"
    of VK_VOLUME_MUTE: "VOLUME_MUTE"
    of VK_VOLUME_DOWN: "VOLUME_DOWN"
    of VK_VOLUME_UP: "VOLUME_UP"
    of VK_MEDIA_NEXT_TRACK: "MEDIA_NEXT_TRACK"
    of VK_MEDIA_PREV_TRACK: "MEDIA_PREV_TRACK"
    of VK_MEDIA_STOP: "MEDIA_STOP"
    of VK_MEDIA_PLAY_PAUSE: "MEDIA_PLAY_PAUSE"
    of VK_LAUNCH_MAIL: "LAUNCH_MAIL"
    of VK_LAUNCH_MEDIA_SELECT: "LAUNCH_MEDIA_SELECT"
    of VK_LAUNCH_APP1: "LAUNCH_APP1"
    of VK_LAUNCH_APP2: "LAUNCH_APP2"
    of VK_OEM_1: "OEM_1"
    of VK_OEM_PLUS: "OEM_PLUS"
    of VK_OEM_COMMA: "OEM_COMMA"
    of VK_OEM_MINUS: "OEM_MINUS"
    of VK_OEM_PERIOD: "OEM_PERIOD"
    of VK_OEM_2: "OEM_2"
    of VK_OEM_3: "OEM_3"
    of VK_OEM_4: "OEM_4"
    of VK_OEM_5: "OEM_5"
    of VK_OEM_6: "OEM_6"
    of VK_OEM_7: "OEM_7"
    of VK_OEM_8: "OEM_8"
    of VK_OEM_AX: "OEM_AX"
    of VK_OEM_102: "OEM_102"
    of VK_ICO_HELP: "ICO_HELP"
    of VK_ICO_00: "ICO_00"
    of VK_PROCESSKEY: "PROCESSKEY"
    of VK_ICO_CLEAR: "ICO_CLEAR"
    of VK_PACKET: "PACKET"
    of VK_OEM_RESET: "OEM_RESET"
    of VK_OEM_JUMP: "OEM_JUMP"
    of VK_OEM_PA1: "OEM_PA1"
    of VK_OEM_PA2: "OEM_PA2"
    of VK_OEM_PA3: "OEM_PA3"
    of VK_OEM_WSCTRL: "OEM_WSCTRL"
    of VK_OEM_CUSEL: "OEM_CUSEL"
    of VK_OEM_ATTN: "OEM_ATTN"
    of VK_OEM_FINISH: "OEM_FINISH"
    of VK_OEM_COPY: "OEM_COPY"
    of VK_OEM_AUTO: "OEM_AUTO"
    of VK_OEM_ENLW: "OEM_ENLW"
    of VK_OEM_BACKTAB: "OEM_BACKTAB"
    of VK_ATTN: "ATTN"
    of VK_CRSEL: "CRSEL"
    of VK_EXSEL: "EXSEL"
    of VK_EREOF: "EREOF"
    of VK_PLAY: "PLAY"
    of VK_ZOOM: "ZOOM"
    of VK_NONAME: "NONAME"
    of VK_PA1: "PA1"
    of VK_OEM_CLEAR: "OEM_CLEAR"
    else: $char(keycode)