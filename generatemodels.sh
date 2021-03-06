#!/bin/bash

modeldir="src/main/resources/assets/substratum/models"
blockstatedir="src/main/resources/assets/substratum/blockstates"


for block in $(cat "blocks.list")
do
  ( # Block model
  cat <<- EOF
	{
	  "parent": "minecraft:block/cube_all",
	  "textures":
	  {
	    "all": "substratum:blocks/@@TEXTURE@@"
	  }
	}
	EOF
  ) | sed -e "s/@@TEXTURE@@/"$block"/g" > $modeldir"/block/"$block".json"

  ( # Block item model
  cat <<- EOF
	{
	  "parent": "substratum:block/@@MODEL@@"
	}
	EOF
  ) | sed -e "s/@@MODEL@@/"$block"/g" > $modeldir"/item/"$block".json"
done

for slab in $(cat "slabs.list")
do
  ( # Bottom slab
  cat <<- EOF
	{
	   "parent": "minecraft:block/half_slab",
	   "textures":
	   {
	     "bottom": "substratum:blocks/@@TEXTURE@@",
	     "top": "substratum:blocks/@@TEXTURE@@",
	     "side": "substratum:blocks/@@TEXTURESIDE@@"
	  }
	}
	EOF
  ) | sed -e "s/@@TEXTURE@@/block_"$slab"/g" \
    | sed -e "s/@@TEXTURESIDE@@/slab_"$slab"/g" \
    | sed -e 's/substratum:blocks\/block_iron/minecraft:blocks\/iron_block/g' \
    | sed -e 's/substratum:blocks\/block_gold/minecraft:blocks\/gold_block/g' > $modeldir"/block/slab_bottom_"$slab".json"

  ( # Top slab
  cat <<- EOF
	{
	  "parent": "minecraft:block/upper_slab",
	  "textures":
	  {
	    "bottom": "substratum:blocks/@@TEXTURE@@",
	    "top": "substratum:blocks/@@TEXTURE@@",
	    "side": "substratum:blocks/@@TEXTURESIDE@@"
	  }
	}
	EOF
  ) | sed -e "s/@@TEXTURE@@/block_"$slab"/g" \
    | sed -e "s/@@TEXTURESIDE@@/slab_"$slab"/g" \
    | sed -e 's/substratum:blocks\/block_iron/minecraft:blocks\/iron_block/g' \
    | sed -e 's/substratum:blocks\/block_gold/minecraft:blocks\/gold_block/g' > $modeldir"/block/slab_top_"$slab".json"
  
  ( # Double slab
  cat <<- EOF
	{
	  "parent": "block/cube_column",
	  "textures":
	  {
	     "end": "substratum:blocks/@@TEXTURE@@",
	     "side": "substratum:blocks/@@TEXTURESIDE@@"
	  }
	}
	EOF
  ) | sed -e "s/@@TEXTURE@@/block_"$slab"/g" \
    | sed -e "s/@@TEXTURESIDE@@/slab_"$slab"/g" \
    | sed -e 's/substratum:blocks\/block_iron/minecraft:blocks\/iron_block/g' \
    | sed -e 's/substratum:blocks\/block_gold/minecraft:blocks\/gold_block/g' > $modeldir"/block/slab_double_"$slab".json"

  ( # Slab item model
  cat <<- EOF
	{
	  "parent": "substratum:block/@@MODEL@@"
	}
	EOF
  ) | sed -e "s/@@MODEL@@/slab_bottom_"$slab"/g" > $modeldir"/item/slab_"$slab".json"

  ( # Stairs blockstate
  cat <<- EOF
	{
	  "variants":
	  {
	    "facing=east,half=bottom,shape=straight":  { "model": "substratum:@@MODELSTRAIGHT@@" },
	    "facing=west,half=bottom,shape=straight":  { "model": "substratum:@@MODELSTRAIGHT@@", "y": 180, "uvlock": true },
	    "facing=south,half=bottom,shape=straight": { "model": "substratum:@@MODELSTRAIGHT@@", "y": 90, "uvlock": true },
	    "facing=north,half=bottom,shape=straight": { "model": "substratum:@@MODELSTRAIGHT@@", "y": 270, "uvlock": true },
	    "facing=east,half=bottom,shape=outer_right":  { "model": "substratum:@@MODELOUTER@@" },
	    "facing=west,half=bottom,shape=outer_right":  { "model": "substratum:@@MODELOUTER@@", "y": 180, "uvlock": true },
	    "facing=south,half=bottom,shape=outer_right": { "model": "substratum:@@MODELOUTER@@", "y": 90, "uvlock": true },
	    "facing=north,half=bottom,shape=outer_right": { "model": "substratum:@@MODELOUTER@@", "y": 270, "uvlock": true },
	    "facing=east,half=bottom,shape=outer_left":  { "model": "substratum:@@MODELOUTER@@", "y": 270, "uvlock": true },
	    "facing=west,half=bottom,shape=outer_left":  { "model": "substratum:@@MODELOUTER@@", "y": 90, "uvlock": true },
	    "facing=south,half=bottom,shape=outer_left": { "model": "substratum:@@MODELOUTER@@" },
	    "facing=north,half=bottom,shape=outer_left": { "model": "substratum:@@MODELOUTER@@", "y": 180, "uvlock": true },
	    "facing=east,half=bottom,shape=inner_right":  { "model": "substratum:@@MODELINNER@@" },
	    "facing=west,half=bottom,shape=inner_right":  { "model": "substratum:@@MODELINNER@@", "y": 180, "uvlock": true },
	    "facing=south,half=bottom,shape=inner_right": { "model": "substratum:@@MODELINNER@@", "y": 90, "uvlock": true },
	    "facing=north,half=bottom,shape=inner_right": { "model": "substratum:@@MODELINNER@@", "y": 270, "uvlock": true },
	    "facing=east,half=bottom,shape=inner_left":  { "model": "substratum:@@MODELINNER@@", "y": 270, "uvlock": true },
	    "facing=west,half=bottom,shape=inner_left":  { "model": "substratum:@@MODELINNER@@", "y": 90, "uvlock": true },
	    "facing=south,half=bottom,shape=inner_left": { "model": "substratum:@@MODELINNER@@" },
	    "facing=north,half=bottom,shape=inner_left": { "model": "substratum:@@MODELINNER@@", "y": 180, "uvlock": true },
	    "facing=east,half=top,shape=straight":  { "model": "substratum:@@MODELSTRAIGHT@@", "x": 180, "uvlock": true },
	    "facing=west,half=top,shape=straight":  { "model": "substratum:@@MODELSTRAIGHT@@", "x": 180, "y": 180, "uvlock": true },
	    "facing=south,half=top,shape=straight": { "model": "substratum:@@MODELSTRAIGHT@@", "x": 180, "y": 90, "uvlock": true },
	    "facing=north,half=top,shape=straight": { "model": "substratum:@@MODELSTRAIGHT@@", "x": 180, "y": 270, "uvlock": true },
	    "facing=east,half=top,shape=outer_right":  { "model": "substratum:@@MODELOUTER@@", "x": 180, "uvlock": true },
	    "facing=west,half=top,shape=outer_right":  { "model": "substratum:@@MODELOUTER@@", "x": 180, "y": 180, "uvlock": true },
	    "facing=south,half=top,shape=outer_right": { "model": "substratum:@@MODELOUTER@@", "x": 180, "y": 90, "uvlock": true },
	    "facing=north,half=top,shape=outer_right": { "model": "substratum:@@MODELOUTER@@", "x": 180, "y": 270, "uvlock": true },
	    "facing=east,half=top,shape=outer_left":  { "model": "substratum:@@MODELOUTER@@", "x": 180, "y": 90, "uvlock": true },
	    "facing=west,half=top,shape=outer_left":  { "model": "substratum:@@MODELOUTER@@", "x": 180, "y": 270, "uvlock": true },
	    "facing=south,half=top,shape=outer_left": { "model": "substratum:@@MODELOUTER@@", "x": 180, "y": 180, "uvlock": true },
	    "facing=north,half=top,shape=outer_left": { "model": "substratum:@@MODELOUTER@@", "x": 180, "uvlock": true },
	    "facing=east,half=top,shape=inner_right":  { "model": "substratum:@@MODELINNER@@", "x": 180, "uvlock": true },
	    "facing=west,half=top,shape=inner_right":  { "model": "substratum:@@MODELINNER@@", "x": 180, "y": 180, "uvlock": true },
	    "facing=south,half=top,shape=inner_right": { "model": "substratum:@@MODELINNER@@", "x": 180, "y": 90, "uvlock": true },
	    "facing=north,half=top,shape=inner_right": { "model": "substratum:@@MODELINNER@@", "x": 180, "y": 270, "uvlock": true },
	    "facing=east,half=top,shape=inner_left":  { "model": "substratum:@@MODELINNER@@", "x": 180, "y": 90, "uvlock": true },
	    "facing=west,half=top,shape=inner_left":  { "model": "substratum:@@MODELINNER@@", "x": 180, "y": 270, "uvlock": true },
	    "facing=south,half=top,shape=inner_left": { "model": "substratum:@@MODELINNER@@", "x": 180, "y": 180, "uvlock": true },
	    "facing=north,half=top,shape=inner_left": { "model": "substratum:@@MODELINNER@@", "x": 180, "uvlock": true }
	  }
	}
	EOF
  ) | sed -e "s/@@MODELSTRAIGHT@@/stairs_straight_"$slab"/g" \
    | sed -e "s/@@MODELINNER@@/stairs_inner_"$slab"/g" \
    | sed -e "s/@@MODELOUTER@@/stairs_outer_"$slab"/g" > $blockstatedir"/stairs_"$slab".json"

  ( # Straight stairs
  cat <<- EOF
	{
	  "parent": "minecraft:block/stairs",
	  "textures":
	  {
	    "bottom": "substratum:blocks/@@TEXTURE@@",
	    "top": "substratum:blocks/@@TEXTURE@@",
	    "side": "substratum:blocks/@@TEXTURE@@"
	  }
	}
	EOF
  ) | sed -e "s/@@TEXTURE@@/block_"$slab"/g" \
    | sed -e 's/substratum:blocks\/block_iron/minecraft:blocks\/iron_block/g' \
    | sed -e 's/substratum:blocks\/block_gold/minecraft:blocks\/gold_block/g' > $modeldir"/block/stairs_straight_"$slab".json"

  ( # Inner stairs
  cat <<- EOF
	{
	  "parent": "minecraft:block/inner_stairs",
	  "textures":
	  {
	    "bottom": "substratum:blocks/@@TEXTURE@@",
	    "top": "substratum:blocks/@@TEXTURE@@",
	    "side": "substratum:blocks/@@TEXTURE@@"
	  }
	}
	EOF
  ) | sed -e "s/@@TEXTURE@@/block_"$slab"/g" \
    | sed -e 's/substratum:blocks\/block_iron/minecraft:blocks\/iron_block/g' \
    | sed -e 's/substratum:blocks\/block_gold/minecraft:blocks\/gold_block/g' > $modeldir"/block/stairs_inner_"$slab".json"

  ( # Outer stairs
  cat <<- EOF
	{
	  "parent": "minecraft:block/outer_stairs",
	  "textures":
	  {
	    "bottom": "substratum:blocks/@@TEXTURE@@",
	    "top": "substratum:blocks/@@TEXTURE@@",
	    "side": "substratum:blocks/@@TEXTURE@@"
	  }
	}
	EOF
  ) | sed -e "s/@@TEXTURE@@/block_"$slab"/g" \
    | sed -e 's/substratum:blocks\/block_iron/minecraft:blocks\/iron_block/g' \
    | sed -e 's/substratum:blocks\/block_gold/minecraft:blocks\/gold_block/g' > $modeldir"/block/stairs_outer_"$slab".json"

  ( # Stairs item model
  cat <<- EOF
	{
	  "parent": "substratum:block/@@MODEL@@"
	}
	EOF
  ) | sed -e "s/@@MODEL@@/stairs_straight_"$slab"/g" > $modeldir"/item/stairs_"$slab".json"
done

for item in $(cat "items.list")
do
  ( # Item model
  cat <<- EOF
	{
	    "parent": "item/generated",
	    "textures": {
	        "layer0": "substratum:items/@@TEXTURE@@"
	    }
	}
	EOF
  ) | sed -e "s/@@TEXTURE@@/"$item"/g" > $modeldir"/item/"$item".json"
done

for item in $(cat "tools.list")
do
  ( # Item model
  cat <<- EOF
	{
	    "parent": "item/handheld",
	    "textures": {
	        "layer0": "substratum:items/@@TEXTURE@@"
	    }
	}
	EOF
  ) | sed -e "s/@@TEXTURE@@/"$item"/g" > $modeldir"/item/"$item".json"
done

for fluid in $(cat "fluids.list")
do
  ( # Fluid model
    cat <<- EOF
	{
	  "forge_marker": 1,
	  "variants":
	  {
	    "normal":
	    {
	      "model": "forge:fluid",
	      "custom": { "fluid": "@@FLUID@@" }
	    }
	  }
	}
	EOF
  ) | sed -e "s/@@FLUID@@/"liquid$(echo $fluid | tr '[A-Z]' '[a-z]')"/g" > $blockstatedir"/"liquid_$(echo $fluid | tr '[A-Z]' '[a-z]')".json"
done

