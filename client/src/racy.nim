# This is just an example to get you started. A typical hybrid package
# uses this file as the main entry point of the application.

import racypkg/submodule
import racypkg/interception

when isMainModule:
  echo(getWelcomeMessage())
