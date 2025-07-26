technic.register_grinder_recipe({input={"technic:stone_dust"},output="default:silver_sand"})

core.register_craft({
	type = "shapeless",
	output = "default:dirt_with_grass 1",
	recipe = {
		"default:grass_1",
		"default:dirt",
	},
})
if (core.get_modpath("dye") and core.get_modpath("bees")) then
	technic.register_separating_recipe({ input = {"bees:wax 1"}, output = {"basic_materials:oil_extract 2","dye:yellow 1"}})
end