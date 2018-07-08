#include mapsheet
#include element

import nimx / [ view, image, image_view, context, render_to_image, font, window, text_field]
import nimx.assets.asset_manager
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

proc startApp() = 
  var wnd = newWindow(newRect(40, 40, 800, 600))
  let ground_hex = newImageView(newRect(0, 0, 50, 50))
  ground_hex.fillRule = ImageFillRule.FitWidth
  sharedAssetManager().getAssetAtPath("images/land.png") do(i: Image, err: string):
    ground_hex.image = i

  wnd.addSubView(ground_hex)



runApplication:
  startApp()
