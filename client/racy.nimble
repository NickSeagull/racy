# Package

version       = "0.1.0"
author        = "Nikita Tchayka"
description   = "A new awesome nimble package"
license       = "Apache-2.0"
srcDir        = "src"
installExt    = @["nim"]
bin           = @["racy"]


# Dependencies

requires "nim >= 1.4.0"
requires "winim >= 3.4.2"
