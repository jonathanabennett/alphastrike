include mapsheet
#include element

import nimx / [ view, image, image_view, context, render_to_image, font, window, text_field]
import nimx.assets.asset_manager
import os, logging

var rolling_log = newRollingFileLogger("alphastrike.log", fmtStr = verboseFmtStr)
addHandler(rolling_log)

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

proc newTile(x: float, y: float, width: float, height: float, i: Image): ImageView =
  result = newImageView(newRect(x, y, width, height))
  result.fillRule = ImageFillRule.FitWidth
  result.image = i

proc startApp() =
  var mapsheet = loadMap("data/boards/battletech.board")
  var wnd = newWindow(newRect(40, 40, 1000, 1000))
  var hex_width = 50.float
  var hex_height = 50.float

  for loc, hex in pairs(mapsheet.grid):
    case hex.terrain:
      of WATER:
        sharedAssetManager().getAssetAtPath("images/water.png") do(i: Image, er: string):
          info("Hex of ", $hex.terrain, " at ", $(loc.x*hex_width), " , ", $(loc.y*hex_height))
          wnd.addSubView(newTile(loc.x*hex_width, loc.y*hex_height, hex_width, hex_height, i))
      of CLEAR:
        sharedAssetManager().getAssetAtPath("images/land.png") do(i: Image, er: string):
          info("Hex of ", $hex.terrain, " at ", $(loc.x*50.float), " , ", $(loc.y*hex_height))
          wnd.addSubView(newTile(loc.x*hex_width, loc.y*hex_height, hex_width, hex_height, i))
      of LIGHT_WOODS:
        sharedAssetManager().getAssetAtPath("images/land.png") do(i: Image, er: string):
          info("Hex of ", $hex.terrain, " at ", $(loc.x*50.float), " , ", $(loc.y*hex_height))
          wnd.addSubView(newTile(loc.x*hex_width, loc.y*hex_height, hex_width, hex_height, i))
      of HEAVY_WOODS:
        sharedAssetManager().getAssetAtPath("images/land.png") do(i: Image, er: string):
          info("Hex of ", $hex.terrain, " at ", $(loc.x*50.float), " , ", $(loc.y*hex_height))
          wnd.addSubView(newTile(loc.x*hex_width, loc.y*hex_height, hex_width, hex_height, i))
      of ROUGH:
        sharedAssetManager().getAssetAtPath("images/land.png") do(i: Image, er: string):
          info("Hex of ", $hex.terrain, " at ", $(loc.x*50.float), " , ", $(loc.y*hex_height))
          wnd.addSubView(newTile(loc.x*hex_width, loc.y*hex_height, hex_width, hex_height, i))
      else:
        sharedAssetManager().getAssetAtPath("images/land.png") do(i: Image, er: string):
          info("Hex of ", $hex.terrain, " at ", $(loc.x*50.float), " , ", $(loc.y*hex_height))
          wnd.addSubView(newTile(loc.x*hex_width, loc.y*hex_height, hex_width, hex_height, i))




runApplication:
  startApp()
