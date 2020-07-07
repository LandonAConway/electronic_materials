minetest.register_craft({
  type = "cooking",
  output = "electronic_materials:silicon_ingot",
  recipe = "electronic_materials:silicon_lump",
})

minetest.register_craft({
  type = "shapeless",
  output = "electronic_materials:siliconblock",
  recipe = { "electronic_materials:silicon_ingot", "electronic_materials:silicon_ingot", "electronic_materials:silicon_ingot",
              "electronic_materials:silicon_ingot", "electronic_materials:silicon_ingot", "electronic_materials:silicon_ingot",
              "electronic_materials:silicon_ingot", "electronic_materials:silicon_ingot", "electronic_materials:silicon_ingot"
           }
})

minetest.register_craft({
  type = "shapeless",
  output = "electronic_materials:silicon_ingot 9",
  recipe = { "electronic_materials:siliconblock" }
})