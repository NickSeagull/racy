# Racy

## To-do

- [ ] Create an IPC connection between the Haskell tests and the AHK runtime. This will be useful also for the future in order to create the `eval` function for macros and stuff.
  - [ ] AutoHotkey part should use the [`ObjRegisterActive` function](https://www.autohotkey.com/boards/viewtopic.php?t=6148)

  - [ ] Haskell part should use the function from `hcom` package (https://hackage.haskell.org/package/hcom-0.0.0.2/docs/System-Win32-Com.html#v:coGetActiveObject)