
electronic_materials = {}
dofile(minetest.get_modpath("electronic_materials") .. "/storagedevices.lua")

--Mod Storage--
---------------
local modstorage = minetest.get_mod_storage()
electronic_materials.storage = {}

function electronic_materials.storage.set_string(key, value)
    modstorage:set_string(key, value)
end

function electronic_materials.storage.get_string(key)
    return modstorage:get_string(key)
end

--Ores
dofile(minetest.get_modpath("electronic_materials") .. "/ores.lua")
dofile(minetest.get_modpath("electronic_materials") .. "/ores_crafting.lua")

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

minetest.register_craftitem("electronic_materials:molten_silicon", {
    description = "Molten Silicon",
    inventory_image = "em_molten_tin.png"
})

minetest.register_craft({
  type = "cooking",
  output = "electronic_materials:molten_silicon",
  recipe = "electronic_materials:silicon_ingot",
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

--Misc
minetest.register_craftitem("electronic_materials:green_solder_mask", {
    description = "Green Solder Mask",
    inventory_image = "em_green_solder_mask.png"
})

minetest.register_craft({
	type = "shapeless",
	output = "electronic_materials:green_solder_mask",
	recipe = { "basic_materials:oil_extract", "dye:dark_green" },
})

minetest.register_craftitem("electronic_materials:blue_solder_mask", {
    description = "Blue Solder Mask",
    inventory_image = "em_blue_solder_mask.png"
})

minetest.register_craft({
	type = "shapeless",
	output = "electronic_materials:blue_solder_mask",
	recipe = { "basic_materials:oil_extract", "dye:blue" },
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

--Circuit Boards
minetest.register_craftitem("electronic_materials:small_circuit_board_unmasked", {
    description = "Small Unmasked Circuit Board",
    inventory_image = "em_small_circuit_board_unmasked.png"
})

minetest.register_craft({
    type = "shapeless",
    output = "electronic_materials:small_circuit_board_unmasked",
    recipe = { "electronic_materials:small_copper_clad" }
})

minetest.register_craftitem("electronic_materials:medium_circuit_board_unmasked", {
    description = "Medium Unmasked Circuit Board",
    inventory_image = "em_medium_circuit_board_unmasked.png"
})

minetest.register_craft({
    type = "shapeless",
    output = "electronic_materials:medium_circuit_board_unmasked",
    recipe = { "electronic_materials:medium_copper_clad" }
})

minetest.register_craftitem("electronic_materials:large_circuit_board_unmasked", {
    description = "Large Unmasked Circuit Board",
    inventory_image = "em_large_circuit_board_unmasked.png"
})

minetest.register_craft({
    type = "shapeless",
    output = "electronic_materials:large_circuit_board_unmasked",
    recipe = { "electronic_materials:large_copper_clad" }
})

minetest.register_craftitem("electronic_materials:small_circuit_board", {
    description = "Small Circuit Board",
    inventory_image = "em_small_circuit_board.png"
})

minetest.register_craft({
    type = "shapeless",
    output = "electronic_materials:small_circuit_board",
    recipe = { "electronic_materials:small_circuit_board_unmasked", "electronic_materials:plastic_fiberglass", "electronic_materials:green_solder_mask" }
})

minetest.register_craftitem("electronic_materials:medium_circuit_board", {
    description = "Medium Curcut Board",
    inventory_image = "em_medium_circuit_board.png"
})

minetest.register_craft({
    type = "shapeless",
    output = "electronic_materials:medium_circuit_board",
    recipe = { "electronic_materials:medium_circuit_board_unmasked", "electronic_materials:plastic_fiberglass", "electronic_materials:green_solder_mask" }
})

minetest.register_craftitem("electronic_materials:large_circuit_board", {
    description = "Large Circuit Board",
    inventory_image = "em_large_circuit_board.png"
})

minetest.register_craft({
    type = "shapeless",
    output = "electronic_materials:large_circuit_board",
    recipe = { "electronic_materials:large_circuit_board_unmasked", "electronic_materials:plastic_fiberglass", "electronic_materials:green_solder_mask" }
})

--Motherboards and Misc
minetest.register_craftitem("electronic_materials:bios_chip", {
    description = "Bios Chip",
    inventory_image = "em_bios_chip.png"
})

minetest.register_craft({
    type = "shapeless",
    output = "electronic_materials:bios_chip",
    recipe = { "electronic_materials:molten_plastic", "electronic_materials:molten_tin", "electronic_materials:small_circuit_board",
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
    recipe = { "electronic_materials:small_circuit_board", "electronic_materials:bios_chip" }
})

minetest.register_craftitem("electronic_materials:medium_motherboard", {
    description = "Medium Motherboard",
    inventory_image = "em_medium_motherboard.png"
})

minetest.register_craft({
    type = "shapeless",
    output = "electronic_materials:medium_motherboard",
    recipe = { "electronic_materials:medium_circuit_board", "electronic_materials:bios_chip" }
})

minetest.register_craftitem("electronic_materials:large_motherboard", {
    description = "Large Motherboard",
    inventory_image = "em_large_motherboard.png"
})

minetest.register_craft({
    type = "shapeless",
    output = "electronic_materials:large_motherboard",
    recipe = { "electronic_materials:large_circuit_board", "electronic_materials:bios_chip" }
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
    inventory_image = "em_hard_drive.png",
    storagedevice = {
        type = "hdd",
        capacity = 1073741824*500,
    }
})

minetest.register_craft({
    type = "shapeless",
    output = "electronic_materials:hard_drive_500gb",
    recipe = { "electronic_materials:hard_drive_enclosure", "electronic_materials:small_circuit_board", "electronic_materials:microcontroller_unit",
		"electronic_materials:hard_disk_platter" }
})

minetest.register_craftitem("electronic_materials:hard_drive_1tb", {
    description = "Hard Drive (1 TB)",
    inventory_image = "em_hard_drive.png",
    storagedevice = {
        type = "hdd",
        capacity = 1099511627776*1
    }
})

minetest.register_craft({
    type = "shapeless",
    output = "electronic_materials:hard_drive_1tb",
    recipe = { "electronic_materials:hard_drive_enclosure", "electronic_materials:small_circuit_board", "electronic_materials:microcontroller_unit",
		"electronic_materials:two_hard_disk_platters" }
})

minetest.register_craftitem("electronic_materials:hard_drive_1_5tb", {
    description = "Hard Drive (1.5 TB)",
    inventory_image = "em_hard_drive.png",
    storagedevice = {
        type = "hdd",
        capacity = 1099511627776*1.5
    }
})

minetest.register_craft({
    type = "shapeless",
    output = "electronic_materials:hard_drive_1_5tb",
    recipe = { "electronic_materials:hard_drive_enclosure", "electronic_materials:small_circuit_board", "electronic_materials:microcontroller_unit",
		"electronic_materials:three_hard_disk_platters" }
})

minetest.register_craftitem("electronic_materials:hard_drive_2tb", {
    description = "Hard Drive (2 TB)",
    inventory_image = "em_hard_drive.png",
    storagedevice = {
        type = "hdd",
        capacity = 1099511627776*2
    }
})

minetest.register_craft({
    type = "shapeless",
    output = "electronic_materials:hard_drive_2tb",
    recipe = { "electronic_materials:hard_drive_enclosure", "electronic_materials:small_circuit_board", "electronic_materials:microcontroller_unit",
		"electronic_materials:four_hard_disk_platters" }
})

minetest.register_craftitem("electronic_materials:hard_drive_2_5tb", {
    description = "Hard Drive (2.5 TB)",
    inventory_image = "em_hard_drive.png",
    storagedevice = {
        type = "hdd",
        capacity = 1099511627776*2.5
    }
})

minetest.register_craft({
    type = "shapeless",
    output = "electronic_materials:hard_drive_2_5tb",
    recipe = { "electronic_materials:hard_drive_enclosure", "electronic_materials:small_circuit_board", "electronic_materials:microcontroller_unit",
		"electronic_materials:five_hard_disk_platters" }
})

--SDs
minetest.register_craftitem("electronic_materials:silicon_wafer", {
    description = "Silicon Wafer",
    inventory_image = "em_silicon_wafer.png"
})

minetest.register_craft({
    type = "shaped",
    output = "electronic_materials:silicon_wafer",
    recipe = {
    {"", "electronic_materials:molten_silicon", ""},
    {"electronic_materials:molten_silicon", "electronic_materials:molten_silicon", "electronic_materials:molten_silicon"},
    {"", "electronic_materials:molten_silicon", ""}
  }
})

minetest.register_craftitem("electronic_materials:integrated_circuit", {
    description = "Integrated Circuit",
    inventory_image = "em_integrated_circuit.png"
})

minetest.register_craft({
    type = "shapeless",
    output = "electronic_materials:integrated_circuit 32",
    recipe = {"electronic_materials:silicon_wafer"}
})

minetest.register_craftitem("electronic_materials:2_integrated_circuits", {
    description = "2 Integrated Circuits",
    inventory_image = "multiple_integrated_circuits.png"
})

minetest.register_craft({
    type = "shapeless",
    output = "electronic_materials:2_integrated_circuits",
    recipe = {"electronic_materials:integrated_circuit", "electronic_materials:integrated_circuit"}
})

minetest.register_craftitem("electronic_materials:4_integrated_circuits", {
    description = "4 Integrated Circuits",
    inventory_image = "multiple_integrated_circuits.png"
})

minetest.register_craft({
    type = "shapeless",
    output = "electronic_materials:4_integrated_circuits",
    recipe = {"electronic_materials:2_integrated_circuits", "electronic_materials:2_integrated_circuits"}
})

minetest.register_craftitem("electronic_materials:8_integrated_circuits", {
    description = "8 Integrated Circuits",
    inventory_image = "multiple_integrated_circuits.png"
})

minetest.register_craft({
    type = "shapeless",
    output = "electronic_materials:8_integrated_circuits",
    recipe = {"electronic_materials:4_integrated_circuits", "electronic_materials:4_integrated_circuits"}
})

minetest.register_craftitem("electronic_materials:16_integrated_circuits", {
    description = "16 Integrated Circuits",
    inventory_image = "multiple_integrated_circuits.png"
})

minetest.register_craft({
    type = "shapeless",
    output = "electronic_materials:16_integrated_circuits",
    recipe = {"electronic_materials:8_integrated_circuits", "electronic_materials:8_integrated_circuits"}
})

minetest.register_craftitem("electronic_materials:sd_card_8gb", {
    description = "SD Card (8 GB)",
    inventory_image = "em_sd_card.png",
    storagedevice = {
        type = "sd",
        capacity = 1073741824*8,
    }
})

minetest.register_craft({
    type = "shapeless",
    output = "electronic_materials:sd_card_8gb",
    recipe = {"electronic_materials:integrated_circuit", "electronic_materials:microcontroller_unit", "electronic_materials:small_circuit_board",
              "electronic_materials:molten_plastic", "dye:black" }
})

minetest.register_craftitem("electronic_materials:sd_card_16gb", {
    description = "SD Card (16 GB)",
    inventory_image = "em_sd_card.png",
    storagedevice = {
        type = "sd",
        capacity = 1073741824*16,
    }
})

minetest.register_craft({
    type = "shapeless",
    output = "electronic_materials:sd_card_16gb",
    recipe = {"electronic_materials:2_integrated_circuits", "electronic_materials:microcontroller_unit", "electronic_materials:small_circuit_board",
              "electronic_materials:molten_plastic", "dye:black" }
})

minetest.register_craftitem("electronic_materials:sd_card_32gb", {
    description = "SD Card (32 GB)",
    inventory_image = "em_sd_card.png",
    storagedevice = {
        type = "sd",
        capacity = 1073741824*32,
    }
})

minetest.register_craft({
    type = "shapeless",
    output = "electronic_materials:sd_card_32gb",
    recipe = {"electronic_materials:4_integrated_circuits", "electronic_materials:microcontroller_unit", "electronic_materials:small_circuit_board",
              "electronic_materials:molten_plastic", "dye:black" }
})

minetest.register_craftitem("electronic_materials:sd_card_64gb", {
    description = "SD Card (64 GB)",
    inventory_image = "em_sd_card.png",
    storagedevice = {
        type = "sd",
        capacity = 1073741824*64,
    }
})

minetest.register_craft({
    type = "shapeless",
    output = "electronic_materials:sd_card_64gb",
    recipe = {"electronic_materials:8_integrated_circuits", "electronic_materials:microcontroller_unit", "electronic_materials:small_circuit_board",
              "electronic_materials:molten_plastic", "dye:black" }
})

minetest.register_craftitem("electronic_materials:sd_card_128gb", {
    description = "SD Card (128 GB)",
    inventory_image = "em_sd_card.png",
    storagedevice = {
        type = "sd",
        capacity = 1073741824*128,
    }
})

minetest.register_craft({
    type = "shapeless",
    output = "electronic_materials:sd_card_128gb",
    recipe = {"electronic_materials:16_integrated_circuits", "electronic_materials:microcontroller_unit", "electronic_materials:small_circuit_board",
              "electronic_materials:molten_plastic", "dye:black" }
})