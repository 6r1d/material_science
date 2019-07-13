-- Init weights
items = {}
items['material_science:silicon_dioxide_dust'] = 0.282
items['material_science:alumina_dust'] = 0.0823
items['technic:iron_dust'] = 0.0563
items['material_science:calcium_oxide_dust'] = 0.0415
items['material_science:lye'] = 0.0236
items['material_science:magnesium_oxide_dust'] = 0.0233
items['material_science:potash'] = 0.0209
items['technic:coal_dust'] = 0.0002

-- Increment element probabilities, since these are less than one
-- and we don't use most of the periodic table
remainder = 1
item_counter = 0
for item, _ in pairs( items ) do
    item_counter = item_counter + 1
    remainder = remainder - items[item]
end
for item, _ in pairs( items ) do
    items[item] = items[item] + remainder / item_counter
end

 
num_trials = 99

-- Reset samples
samples = {}
for item, _ in pairs( items ) do
    samples[item] = 0
end

-- Randomize
math.randomseed( os.time() )
for i = 1, num_trials do
    z = math.random()
 
    for item, _ in pairs( items ) do
	if z < items[item] then
	    samples[item] = samples[item] + 1
	    break;
	else
 	    z = z - items[item]	
	end
    end
end

-- Show results
for item, _ in pairs( items ) do
    print( item, samples[item], items[item] )
end
