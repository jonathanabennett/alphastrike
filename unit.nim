import parsecfg

#This will define the Alpha Strike stats for a unit. It will not be the actual token on the field,
#copies of this will be owned by the token on the field.

type
  UnitType enum:
    BM
    IM
    PM
    CV
    SV
    AF
    CF
    DS
    DA
    SC
    MS
    CI
    BA

  Damage = ref object of RootObj
    kind*: string
    short*: int
    medium*: int
    long*: int

  Critical enum:
    AMMO_HIT*
    ENGINE_HIT*
    FC_HIT*
    WEAPON_HIT*
    MP_HIT*

  Role enum:
    Striker
    Juggernaut

  Unit = ref object of RootObj
    name*: string
    kind*: UnitType
    size*: int
    role* Role
    points*: int
    tmm*: int
    move*: int
    jump*: int
    max_armor*: int
    max_structure*: int
    base_damage*: Damage
    damage_specials*: seq[Damage]
    specials*: seq[string]
    cur_armor*: int
    cur_structure*: int
    crits*: seq[Critical]

proc newDamage*(kind: string, short:int, medium: int, long: int): Damage =
  Damage(kind: kind, short: short, medium: medium, long: long)

proc newUnitFromASFile(file_path: string): Unit =
  var dict = loadConfig(file_path)
  new result
  result.name = dict.getSectionValue("GENERAL", "name")
  result.kind = dict.getSectionValue("GENERAL", "kind")
  result.size = dict.getSectionValue("GENERAL", "size").parseInt
  result.role = dict.getSectionValue("GENERAL", "role")
  result.points = dict.getSectionValue("GENERAL", "points")
  result.tmm = dict.getSectionValue("MOBILITY", "tmm").parseInt
  result.move = dict.getSectionValue("MOBILITY", "move").parseInt
  result.jump = dict.getSectionValue("MOBILITY", "jump").parseInt
  result.max_armor = dict.getSectionValue("DEFENSE", "armor").parseInt
  result.max_structure = dict.getSectionValue("DEFENSE", "structure").parseInt
  result.cur_armor = result.max_armor
  result.cur_structure = result.cur_structure
# Need to write the damage processing code here
# The need to write the specials processing code
