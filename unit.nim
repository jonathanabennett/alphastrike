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
    short*: float
    medium*: float
    long*: float

  Criticals enum:
    AMMO_HIT*
    ENGINE_HIT*
    FC_HIT*
    WEAPON_HIT*
    MP_HIT*

  Unit = ref object of RootObj
    name*: string
    kind*: UnitType
    size*: int
    tmm*: int
    move*: int
    jump*: int
    role*: string
    max_armor*: int
    max_structure*: int
    base_damage*: Damage
    damage_specials*: seq[Damage]
    specials*: seq[string]
    cur_armor*: int
    cur_structure*: int
    crits*: seq[Criticals]

proc newDamage*(kind: string, short:float, medium: float, long: float): Damage =
  Damage(kind: kind, short: short, medium: medium, long: long)
