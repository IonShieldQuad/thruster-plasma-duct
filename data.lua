
local item = table.deepcopy(data.raw["item"]["plasma-duct"])

item.name = "thruster-plasma-duct"
item.subgroup = "space-platform"
item.place_result = "thruster-plasma-duct"
item.order = "z[thruster-plasma-duct]"


local duct = table.deepcopy(data.raw["pipe"]["plasma-duct"])
duct.name = "thruster-plasma-duct"
duct.minable.result = "thruster-plasma-duct"
local pipe_connections = duct.fluid_box.pipe_connections
for _, conn in ipairs(pipe_connections) do
    conn.connection_category = "plasma-thruster"
end
duct.surface_conditions = {
    {
        property = "gravity",
        min = 0, max = 0
    }
}

local recipe = table.deepcopy(data.raw["recipe"]["plasma-duct"])
recipe.name = "thruster-plasma-duct"
recipe.results[1].name = "thruster-plasma-duct"


data:extend({item, duct, recipe})

local tech = data.raw["technology"]["plasma-duct"]
table.insert(tech.effects, {
    type = "unlock-recipe",
    recipe = "thruster-plasma-duct"
})