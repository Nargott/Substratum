from enum import Enum
import os.path

_texure_dir = os.path.join("src","main","resources","assets","substratum","textures")

class Registry(Enum):
  BLOCK = "tile"
  ITEM = "item"
  FLUID = "fluid"

class ItemType:

  def __init__(self, name, regtype, texture, local_name):
    self.name = name
    self.regtype = regtype
    self.local_name = local_name
    self.texture = os.path.join(_texure_dir, texture)

ITEM_TYPES = [
  ItemType("ore",           Registry.BLOCK,  "blocks/ore_%s.png",          "%s Ore", ),
  ItemType("block",         Registry.BLOCK,  "blocks/block_%s.png",        "Block of %s"),
  ItemType("slab",          Registry.BLOCK,  "blocks/slab_%s.png",         "%s Slab"),
  ItemType("slab_double",   Registry.BLOCK,  "blocks/slab_%s.png",         "Double %s Slab"),
  ItemType("stairs",        Registry.BLOCK,  "blocks/slab_%s.png",         "%s Stars"),
  ItemType("ingot",         Registry.ITEM,   "items/ingot_%s.png",         "%s Ingot"),
  ItemType("dust",          Registry.ITEM,   "items/dust_%s.png",          "%s Dust"),
  ItemType("dust_small",    Registry.ITEM,   "items/dust_small_%s.png",    "Small Pile of %s Dust"),
  ItemType("nugget",        Registry.ITEM,   "items/nugget_%s.png",        "%s Nugget"),
  ItemType("plate",         Registry.ITEM,   "items/plate_%s.png",         "%s Plate"),
  ItemType("rod",           Registry.ITEM,   "items/rod_%s.png",           "%s Rod"),
  ItemType("gear",          Registry.ITEM,   "items/gear_%s.png",          "%s Gear"),
  ItemType("bottle_dust",   Registry.ITEM,   "items/bottle_dust_%s.png",   "%s Dust Bottle"),
  ItemType("bottle_liquid", Registry.ITEM,   "items/bottle_liquid_%s.png", "Liquid %s Bottle"),
  ItemType("bucket_liquid", Registry.ITEM,   "items/bucket_liquid_%s.png", "Liquid %s Bucket"),
  ItemType("dye",           Registry.ITEM,   "items/dye_%s.png",           "%s Dye Powder"),
  ItemType("dye_small",     Registry.ITEM,   "items/dye_small_%s.png",     "Small Pile of %s Dye Powder"),
  ItemType("helmet",        Registry.ITEM,   "items/helmet_%s.png",        "%s Helmet"),
  ItemType("chestplate",    Registry.ITEM,   "items/chestplate_%s.png",    "%s Chestplate"),
  ItemType("leggings",      Registry.ITEM,   "items/leggings_%s.png",      "%s Leggings"),
  ItemType("boots",         Registry.ITEM,   "items/boots_%s.png",         "%s Boots"),
  ItemType("pickaxe",       Registry.ITEM,   "items/pickaxe_%s.png",       "%s Pickaxe"),
  ItemType("axe",           Registry.ITEM,   "items/axe_%s.png",           "%s Axe"),
  ItemType("sword",         Registry.ITEM,   "items/sword_%s.png",         "%s Sword"),
  ItemType("shovel",        Registry.ITEM,   "items/shovel_%s.png",        "%s Shovel"),
  ItemType("hoe",           Registry.ITEM,   "items/hoe_%s.png",           "%s Hoe"),
  ItemType("liquid",        Registry.FLUID,  "blocks/liquid_%s_still.png", "Liquid %s")
]

ITEM_TYPES_DICT = {}
for itype in ITEM_TYPES:
  ITEM_TYPES_DICT[itype.name] = itype
