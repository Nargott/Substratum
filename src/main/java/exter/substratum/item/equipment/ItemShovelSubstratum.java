package exter.substratum.item.equipment;

import exter.substratum.material.EnumMaterialEquipment;
import net.minecraft.item.ItemSpade;

public class ItemShovelSubstratum extends ItemSpade
{
  public ItemShovelSubstratum(EnumMaterialEquipment equipment)
  {
    super(equipment.tool);
    setUnlocalizedName("substratum.hoe" + equipment.material.suffix);
    setRegistryName("hoe" + equipment.material.suffix);
  }
}