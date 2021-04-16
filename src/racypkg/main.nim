import winim
import ./key_utils

proc keyboardHook(nCode: int32, wParam: WPARAM, lParam: LPARAM): LRESULT {.stdcall.}=
  BlockInput(1)
  var last: int32
  var letter: bool = true
  if nCode != HC_ACTION: return
  if wParam == WM_KEYDOWN or wParam == WM_SYSKEYDOWN:
    var p: PKBDLLHOOKSTRUCT = cast[PKBDLLHOOKSTRUCT](lParam)
    let code = p.vkCode
    # if code == 0xA2: # LCTRL or first signal of RALT
    #   last = code
    #   return CallNextHookEx(cast[HHOOK](NULL), nCode,wParam, lParam)
    last = code
    if letter:
      echo ( $keycodeToString(code) )
      var key:INPUT
      key.type = INPUT_KEYBOARD
      key.ki.wVk = code.uint16;
      key.ki.time = 0;
      key.ki.dwFlags = 0x0000
      SendInput(1.UINT, &key, sizeof(INPUT).int32)
      return -1


proc main*() =
  echo "Racy initialized"
  var hInstance = GetModuleHandle(nil)
  var hook = SetWindowsHookEx(WH_KEYBOARD_LL.int32, keyboardHook, hInstance, 0)
  var msg: MSG
  while GetMessage(msg, 0, 0, 0) != 0:
    TranslateMessage(&msg)
    DispatchMessage(&msg)
  UnhookWindowsHookEx(hook)