minetest.register_ore({
  ore_type       = "scatter",
  ore            = "electronic_materials:stone_with_silicon",
  wherein        = "default:stone",
  clust_scarcity = 8 * 8 * 8,
  clust_num_ores = 9,
  clust_size     = 3,
  y_max          = 31000,
  y_min          = 1025,
})

minetest.register_ore({
  ore_type       = "scatter",
  ore            = "electronic_materials:stone_with_silicon",
  wherein        = "default:stone",
  clust_scarcity = 8 * 8 * 8,
  clust_num_ores = 8,
  clust_size     = 3,
  y_max          = 64,
  y_min          = -31000,
})

minetest.register_ore({
  ore_type       = "scatter",
  ore            = "electronic_materials:stone_with_silicon",
  wherein        = "default:stone",
  clust_scarcity = 24 * 24 * 24,
  clust_num_ores = 27,
  clust_size     = 6,
  y_max          = 0,
  y_min          = -31000,
})

minetest.register_craftitem("electronic_materials:silicon_lump", {
    description = "Silicon Lump",
    inventory_image = "em_silicon_lump.png"
})

minetest.register_craftitem("electronic_materials:silicon_ingot", {
    description = "Silicon Ingot",
    inventory_image = "em_silicon_ingot.png"
})

minetest.register_node("electronic_materials:stone_with_silicon", {
  description = "Silicon Ore",
  tiles = {"default_stone.png^em_silicon_ore.png"},
  groups = {cracky = 3},
  drop = "electronic_materials:silicon_lump",
  sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("electronic_materials:siliconblock", {
  description = "Silicon Block",
  tiles = {"em_silicon_block.png"},
  is_ground_content = false,
  groups = {cracky = 3},
  sounds = default.node_sound_stone_defaults(),
})