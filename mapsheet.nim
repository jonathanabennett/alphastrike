import
  parsecfg, os, strutils, streams, tables

type
  Location = tuple[x: float, y: float]

  TerrainType = enum
    CLEAR
    WATER
    ROUGH
    LIGHT_WOODS
    HEAVY_WOODS

  Tile = ref object of RootObj
    loc*: Location
    level*: int
    terrain*: TerrainType

  Map = ref object of RootObj
    id: int
    width*: int
    height*: int
    grid*: Table[Location, Tile]

proc tileCreator(location: Location, level: int, terrain: TerrainType): Tile =
  result = Tile(loc: location, level: level, terrain: terrain)

#proc mapCreator(id: int, width: int, height: int): Map =
#  var grid: Table[string; Tile]
#  for y in 0..<height:
#    for x in 0..<width:
#      if x mod 2 == 0:
#        grid.add(tileCreator(x, y, 0, CLEAR))
#      else:
#        grid.add(tileCreator(x, y, 0, ROUGH))
#
#  result = Map(id: id, width: width, height: height, grid: grid)

proc loadMap(filepath: string): Map =
  new result
  result.grid = initTable[Location, Tile]()

  block readboard:
    for line in lines filepath:
      var substrings = line.splitWhitespace
      case substrings[0]
      of "size":
        result.width = substrings[1].parseInt
        result.height = substrings[2].parseInt
      of "hex":
        var x = substrings[1][0..1].parseFloat
        var y = substrings[1][2..3].parseFloat
        var loc_tuple = (x, y)
        var level: int = substrings[2].parseInt
      
        var terrain_str: string = substrings[3].strip(true, true,{'"'})
        var terrain: TerrainType
        case terrain_str:
          of "woods:1": terrain = LIGHT_WOODS
          of "woods:2": terrain = HEAVY_WOODS
          of "rough:1": terrain = ROUGH
          of "rough:2": terrain = ROUGH
          of "water:1":
            terrain = WATER
            level = level - 1
          of "water:2":
            terrain = WATER
            level = level - 2
          of "":
            terrain = CLEAR
          else:
            echo terrain_str, " does not match anything!!!"
            terrain = CLEAR
        result.grid[loc_tuple] = tileCreator(loc_tuple, level, terrain)
      of "end": break readboard

