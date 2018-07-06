#include mapsheet
#include element

import nimx.window
import nimx.text_field
import os

#type
#  Game = ref object of RootObj
#    mapsheet: Map
#    units: seq[Element]

# Colors
#const
#  ZERO = 0
#  SUB_TWO = 45
#  SUB_ONE = 39
#  ONE = 130
#  TWO = 172
#  THREE = 142
#  ENEMY = 196
#  FRIENDLY = 21
#  WOODS = 46
#  ROUGH = 60


#proc createGame(map: Map, units: seq[Element]): Game =
#  Game(mapsheet: map, units: units)

#proc addUnit(game: Game, unit: Element): bool {.discardable.} =
  # Add units here, return True if the unit adds and false if it doesn't
#  game.units.add(unit)
#  result = true

proc startApp() = 
  var wnd = newWindow(newRect(40, 40, 800, 600))

  # Create a static label and add it to the hierarchy
  let label = newLabel(newRect(20, 20, 150, 20))
  label.text = "Hello, world!"
  wnd.addSubview(label)

runApplication:
  startApp()
