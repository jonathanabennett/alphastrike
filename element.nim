#This file will hold the data and functions for Elements on the board.
import unit

type
  Facings = enum
    NE
    E
    SE
    SW
    W
    NW

  Element = ref object of RootObj
    id: int
    x*: int
    y*: int
    facing: Facings




proc createElement(id, x, y:int): Element =
  Element(id: id, x: x, y: y)
