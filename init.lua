--Molten Stuff
minetest.register_craftitem("electronic_materials:glass_shards", {
	description = "Glass Shards",
	inventory_image = "em_glass_shards.png"
})

minetest.register_craft({
	type = "shapeless",
	output = "electronic_materials:glass_shards",
	recipe = { "default:glass" }
})

minetest.register_craftitem("electronic_materials:molten_plastic", {
    description = "Molten Plastic",
    inventory_image = "em_molten_plastic.png"
})

minetest.register_craft({
	type = "cooking",
	output = "electronic_materials:molten_plastic",
	recipe = "basic_materials:plastic_sheet",
})

minetest.register_craftitem("electronic_materials:molten_glass", {
    description = "Molten Glass",
    inventory_image = "em_molten_glass.png"
})
minetest.register_craft({
	type = "cooking",
	output = "electronic_materials:molten_glass",
	recipe = "electronic_materials:glass_shards",
})

minetest.register_craftitem("electronic_materials:molten_copper", {
    description = "Molten Copper",
    inventory_image = "em_molten_copper.png"
})

minetest.register_craft({
	type = "cooking",
	output = "electronic_materials:molten_copper",
	recipe = "default:copper_ingot",
})

minetest.register_craftitem("electronic_materials:molten_tin", {
    description = "Molten Tin",
    inventory_image = "em_molten_tin.png"
})

minetest.register_craft({
	type = "cooking",
	output = "electronic_materials:molten_tin",
	recipe = "default:tin_ingot",
})

--Copper Clads
minetest.register_craftitem("electronic_materials:small_copper_clad", {
    description = "Small Copper Clad",
    inventory_image = "em_small_copper_clad.png"
})

minetest.register_craft({
    type = "shaped",
    output = "electronic_materials:small_copper_clad",
    recipe = {
		{"", "", ""},
		{"", "electronic_materials:molten_copper", ""},
		{"", "", ""}
	}
})

minetest.register_craftitem("electronic_materials:medium_copper_clad", {
    description = "Medium Copper Clad",
    inventory_image = "em_medium_copper_clad.png"
})

minetest.register_craft({
    type = "shaped",
    output = "electronic_materials:medium_copper_clad",
    recipe = {
		{"electronic_materials:molten_copper", "electronic_materials:molten_copper", ""},
		{"electronic_materials:molten_copper", "electronic_materials:molten_copper", ""},
		{"", "", ""}
	}
})

minetest.register_craftitem("electronic_materials:large_copper_clad", {
    description = "Large Copper Clad",
    inventory_image = "em_large_copper_clad.png"
})

minetest.register_craft({
    type = "shaped",
    output = "electronic_materials:large_copper_clad",
    recipe = {
		{"electronic_materials:molten_copper", "electronic_materials:molten_copper", "electronic_materials:molten_copper"},
		{"electronic_materials:molten_copper", "electronic_materials:molten_copper", "electronic_materials:molten_copper"},
		{"electronic_materials:molten_copper", "electronic_materials:molten_copper", "electronic_materials:molten_copper"}
	}
})

--Msic
minetest.register_craftitem("electronic_materials:green_solder_mask", {
    description = "Green Solder Mask",
    inventory_image = "em_green_solder_mask.png"
})

minetest.register_craft({
	type = "shapeless",
	output = "electronic_materials:green_solder_mask",
	recipe = { "basic_materials:oil_extract", "dye:dark_green" },
})

minetest.register_craftitem("electronic_materials:plastic_fiberglass", {
    description = "Plastic Fiberglass",
    inventory_image = "em_plastic_fiberglass.png"
})

minetest.register_craft({
    type = "shapeless",
    output = "electronic_materials:plastic_fiberglass",
    recipe = {"electronic_materials:molten_plastic", "electronic_materials:molten_glass"}
})

--Circut Boards
minetest.register_craftitem("electronic_materials:small_circut_board_unmasked", {
    description = "Small Unmasked Circut Board",
    inventory_image = "em_small_circut_board_unmasked.png"
})

minetest.register_craft({
    type = "shapeless",
    output = "electronic_materials:small_circut_board_unmasked",
    recipe = { "electronic_materials:small_copper_clad" }
})

minetest.register_craftitem("electronic_materials:medium_circut_board_unmasked", {
    description = "Medium Unmasked Circut Board",
    inventory_image = "em_medium_circut_board_unmasked.png"
})

minetest.register_craft({
    type = "shapeless",
    output = "electronic_materials:medium_circut_board_unmasked",
    recipe = { "electronic_materials:medium_copper_clad" }
})

minetest.register_craftitem("electronic_materials:large_circut_board_unmasked", {
    description = "Large Unmasked Circut Board",
    inventory_image = "em_large_circut_board_unmasked.png"
})

minetest.register_craft({
    type = "shapeless",
    output = "electronic_materials:large_circut_board_unmasked",
    recipe = { "electronic_materials:large_copper_clad" }
})

minetest.register_craftitem("electronic_materials:small_circut_board", {
    description = "Small Circut Board",
    inventory_image = "em_small_circut_board.png"
})

minetest.register_craft({
    type = "shapeless",
    output = "electronic_materials:small_circut_board",
    recipe = { "electronic_materials:small_circut_board_unmasked", "electronic_materials:plastic_fiberglass", "electronic_materials:green_solder_mask" }
})

minetest.register_craftitem("electronic_materials:medium_circut_board", {
    description = "Medium Curcut Board",
    inventory_image = "em_medium_circut_board.png"
})

minetest.register_craft({
    type = "shapeless",
    output = "electronic_materials:medium_circut_board",
    recipe = { "electronic_materials:medium_circut_board_unmasked", "electronic_materials:plastic_fiberglass", "electronic_materials:green_solder_mask" }
})

minetest.register_craftitem("electronic_materials:large_circut_board", {
    description = "Large Circut Board",
    inventory_image = "em_large_circut_board.png"
})

minetest.register_craft({
    type = "shapeless",
    output = "electronic_materials:large_circut_board",
    recipe = { "electronic_materials:large_circut_board_unmasked", "electronic_materials:plastic_fiberglass", "electronic_materials:green_solder_mask" }
})

--Motherboards and Misc
minetest.register_craftitem("electronic_materials:bios_chip", {
    description = "Bios Chip",
    inventory_image = "em_bios_chip.png"
})

minetest.register_craft({
    type = "shapeless",
    output = "electronic_materials:bios_chip",
    recipe = { "electronic_materials:molten_plastic", "electronic_materials:molten_tin", "electronic_materials:small_circut_board",
		"basic_materials:plastic_sheet", "dye:black" }
})

minetest.register_craftitem("electronic_materials:microcontroller_unit", {
    description = "Microcontroller Unit",
    inventory_image = "em_microcontroller_unit.png"
})

minetest.register_craft({
    type = "shapeless",
    output = "electronic_materials:microcontroller_unit",
    recipe = { "electronic_materials:molten_plastic", "electronic_materials:molten_glass",  "electronic_materials:molten_tin",
		"basic_materials:plastic_sheet", "dye:black" }
})

minetest.register_craftitem("electronic_materials:small_motherboard", {
    description = "Small Motherboard",
    inventory_image = "em_small_motherboard.png"
})

minetest.register_craft({
    type = "shapeless",
    output = "electronic_materials:small_motherboard",
    recipe = { "electronic_materials:small_circut_board", "electronic_materials:bios_chip" }
})

minetest.register_craftitem("electronic_materials:medium_motherboard", {
    description = "Medium Motherboard",
    inventory_image = "em_medium_motherboard.png"
})

minetest.register_craft({
    type = "shapeless",
    output = "electronic_materials:medium_motherboard",
    recipe = { "electronic_materials:medium_circut_board", "electronic_materials:bios_chip" }
})

minetest.register_craftitem("electronic_materials:large_motherboard", {
    description = "Large Motherboard",
    inventory_image = "em_large_motherboard.png"
})

minetest.register_craft({
    type = "shapeless",
    output = "electronic_materials:large_motherboard",
    recipe = { "electronic_materials:large_circut_board", "electronic_materials:bios_chip" }
})

--Hard Drive Materials
minetest.register_craftitem("electronic_materials:hard_disk_platter", {
    description = "Hard Disk Platter",
    inventory_image = "em_hard_disk_platter.png"
})

minetest.register_craft({
    type = "shaped",
    output = "electronic_materials:hard_disk_platter",
    recipe = {
		{"electronic_materials:molten_glass", "electronic_materials:molten_glass", "electronic_materials:molten_glass"},
		{"electronic_materials:molten_glass", "", "electronic_materials:molten_glass"},
		{"electronic_materials:molten_glass", "electronic_materials:molten_glass", "electronic_materials:molten_glass"}
	}
})

minetest.register_craftitem("electronic_materials:two_hard_disk_platters", {
    description = "Two Hard Disk Platters",
    inventory_image = "em_two_hard_disk_platters.png"
})

minetest.register_craft({
    type = "shapeless",
    output = "electronic_materials:two_hard_disk_platters",
    recipe = { "electronic_materials:hard_disk_platter", "electronic_materials:hard_disk_platter" }
})

minetest.register_craftitem("electronic_materials:three_hard_disk_platters", {
    description = "Three Hard Disk Platters",
    inventory_image = "em_three_hard_disk_platters.png"
})

minetest.register_craft({
    type = "shapeless",
    output = "electronic_materials:three_hard_disk_platters",
    recipe = { "electronic_materials:hard_disk_platter", "electronic_materials:hard_disk_platter", "electronic_materials:hard_disk_platter" }
})

minetest.register_craftitem("electronic_materials:four_hard_disk_platters", {
    description = "Four Hard Disk Platters",
    inventory_image = "em_four_hard_disk_platters.png"
})

minetest.register_craft({
    type = "shapeless",
    output = "electronic_materials:four_hard_disk_platters",
    recipe = { "electronic_materials:hard_disk_platter", "electronic_materials:hard_disk_platter", "electronic_materials:hard_disk_platter",
		"electronic_materials:hard_disk_platter" }
})

minetest.register_craftitem("electronic_materials:five_hard_disk_platters", {
    description = "Five Hard Disk Platters",
    inventory_image = "em_five_hard_disk_platters.png"
})

minetest.register_craft({
    type = "shapeless",
    output = "electronic_materials:five_hard_disk_platters",
    recipe = { "electronic_materials:hard_disk_platter", "electronic_materials:hard_disk_platter", "electronic_materials:hard_disk_platter",
		"electronic_materials:hard_disk_platter", "electronic_materials:hard_disk_platter" }
})

minetest.register_craftitem("electronic_materials:hard_drive_enclosure", {
    description = "Hard Drive Enclosure",
    inventory_image = "em_hdd_enclosure.png"
})

minetest.register_craft({
    type = "shaped",
    output = "electronic_materials:hard_drive_enclosure",
    recipe = {
		{"electronic_materials:molten_tin", "electronic_materials:molten_tin", "electronic_materials:molten_tin"},
		{"electronic_materials:molten_tin", "", "electronic_materials:molten_tin"},
		{"electronic_materials:molten_tin", "electronic_materials:molten_tin", "electronic_materials:molten_tin"}
	}
})

minetest.register_craftitem("electronic_materials:hard_drive_500gb", {
    description = "Hard Drive (500 GB)",
    inventory_image = "em_hard_drive.png"
})

minetest.register_craft({
    type = "shapeless",
    output = "electronic_materials:hard_drive_500gb",
    recipe = { "electronic_materials:hard_drive_enclosure", "electronic_materials:small_circut_board", "electronic_materials:microcontroller_unit",
		"electronic_materials:hard_disk_platter" }
})

minetest.register_craftitem("electronic_materials:hard_drive_1tb", {
    description = "Hard Drive (1 TB)",
    inventory_image = "em_hard_drive.png"
})

minetest.register_craft({
    type = "shapeless",
    output = "electronic_materials:hard_drive_1tb",
    recipe = { "electronic_materials:hard_drive_enclosure", "electronic_materials:small_circut_board", "electronic_materials:microcontroller_unit",
		"electronic_materials:two_hard_disk_platters" }
})

minetest.register_craftitem("electronic_materials:hard_drive_1_5tb", {
    description = "Hard Drive (1.5 TB)",
    inventory_image = "em_hard_drive.png"
})

minetest.register_craft({
    type = "shapeless",
    output = "electronic_materials:hard_drive_1_5tb",
    recipe = { "electronic_materials:hard_drive_enclosure", "electronic_materials:small_circut_board", "electronic_materials:microcontroller_unit",
		"electronic_materials:three_hard_disk_platters" }
})

minetest.register_craftitem("electronic_materials:hard_drive_2tb", {
    description = "Hard Drive (2 TB)",
    inventory_image = "em_hard_drive.png"
})

minetest.register_craft({
    type = "shapeless",
    output = "electronic_materials:hard_drive_2tb",
    recipe = { "electronic_materials:hard_drive_enclosure", "electronic_materials:small_circut_board", "electronic_materials:microcontroller_unit",
		"electronic_materials:four_hard_disk_platters" }
})

minetest.register_craftitem("electronic_materials:hard_drive_2_5tb", {
    description = "Hard Drive (2.5 TB)",
    inventory_image = "em_hard_drive.png"
})

minetest.register_craft({
    type = "shapeless",
    output = "electronic_materials:hard_drive_2_5tb",
    recipe = { "electronic_materials:hard_drive_enclosure", "electronic_materials:small_circut_board", "electronic_materials:microcontroller_unit",
		"electronic_materials:five_hard_disk_platters" }
})