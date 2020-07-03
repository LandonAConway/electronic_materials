minetest.register_craft({
  type = "cooking",
  output = "electronic_materials:silicon_ingot",
  recipe = "electronic_materials:silicon_lump",
})

minetest.register_craft({
  type = "shapeless",
  output = "electronic_materials:siliconblock",
  recipe = { "default:silicon_ingot", "default:silicon_ingot", "default:silicon_ingot",
              "default:silicon_ingot", "default:silicon_ingot", "default:silicon_ingot",
              "default:silicon_ingot", "default:silicon_ingot", "default:silicon_ingot"
           }
})

minetest.register_craft({
  type = "shapeless",
  output = "electronic_materials:silicon_ingot 9",
  recipe = { "default:siliconblock" }
})