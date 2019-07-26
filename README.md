# Material science mod

This mod adds new materials and blocks into Minetest. It's in pre-alpha stage currently.

For now, there's a screenshot of a `decomposer` block, which decomposes stone dust to the minerals, connected to `filters` from [Pipeworks mod](https://forum.minetest.net/viewtopic.php?t=2155) and `blinky plants` from [Mesecons mod](http://mesecons.net/). Filters take items from `chests` and `blinky plants` set the timing for that, by the way. This way, stone dust from `chests` is decomposed to more useful things.

The idea is to give user different types of materials (often in raw, oxidized state, requiring further processing).

![](doc/images/screenshot_a.png)

Currently, it can output these types of dusts:

- silicon dioxide
- aluminium oxide
- rust
- calcium oxide
- sodium hydroxide
- potassium hydroxide
- magnesium oxide
- phosphorus
- carbon
- sulfur
- chromium
- zinc
- copper
- lead
- tin
- uranium
- silver
- gold

These elements are sorted by distribution in Earth's crust,
your chance to get gold is far lower than your chance to get silicon.

Any advices about blocks using new elements (or old, too) are welcome. For instance, I want to add phosphorus with its temporary glow and phosphorus-doped glass with the same properties.

# TODO

- [x] Coal dust from charcoal
- [x] Electricity requirement for a `decomposer` block
- [x] Way to convert alumina to aluminium
- [x] Aluminium granules instead of dust (dust actually is very combustible)
- [x] Quartz glass
- - [x] Wield image
- - [x] Inventory image
- - [x] Glass sounds
- [x] Aluminium blocks
- - [x] Move aluminium block configs into a separate file
- - [x] Saw / CNC support for aluminium
- - - [x] Saw support for colored aluminium
- - - [ ] Better textures
- - - [ ] Config to enable / disable aluminium blocks (color, saw, cnc)
- [ ] Aluminium dyeing unit
- - [ ] Electrochemical anodizing requirement (sulfuric acid)
- [x] Wet alumina
- - [ ] Alumina case (a case for lasers and stuff)
- - [ ] Alumina balls
- - [ ] Unbaked alumina balls
- - [ ] Unbaked alumina case
- [x] Phosphorus block
- - [ ] Labels when digging a charged block
- [ ] Phosphorus glass
- - [ ] Labels when digging a charged block
- [ ] [Add sounds](https://freesound.org/browse/tags/sound-effects/)
- [ ] Phosphorus glass
- [ ] Silicon block
- - [ ] Silicon block processor
- [ ] Alkali metal extractor (NaOH to Na using electricity)
- [ ] Ball mill
- [ ] Fluoropolymers
- [ ] Gas tubes
- [ ] Gas extraction furnace (makes hydrogen fluoride and by-products)
- [ ] Gas compressor
- [ ] Fluorine cylinder
- [ ] Hydrogen cylinder
- [ ] Exhaust tubes
- [ ] Block, separating water to hydrogen and oxygen
- [ ] Toxic gas leaks
- [ ] Acids
- - [ ] Sand to SiO2
- [ ] Gas chemistry (get chlorine by applying electricity to the salt, then NaOH)
- - [ ] Aluminium furnace with fluorine input (The majority of aluminium fluoride is produced by treating alumina with hydrogen fluoride gas at 700 °C)
- [ ] [Verneuil process furnace](https://en.wikipedia.org/wiki/Verneuil_process)
- - [ ] Sapphires
- - [ ] Rubies
- [ ] Tree pulp
- - [ ] Cellulose (pulp-bleaching by chlorine)
- - - [ ] Cellulose-based paper
- [ ] Burning cellulose to coal dust
- [ ] Oil vacuum pump
- [ ] Electric arc furnace (graphite rods + HV)
- [ ] Vacuum manifolds
- [ ] Vacuum arc furnace (beam)
- [ ] Turbomolecular pump
- [ ] Zone melting furnace
- [ ] Better ways to obtain aluminium (http://www.popadancev.net/poluchenie-alyuminiya/)
- [ ] Fireworks
- [ ] Ball-mill with heating and gas inputs
- [ ] Add a mix of aluminium granules and coal dust for safe grinding
- [x] Obsidian shard making (use nine flints, some coal dust and alloy furnace?)
- - [ ] Make switchable
- [ ] Transparent ceramics
- [ ] By-product exhaust system
- [ ] Femtosecond laser coloring ([Chunlei Guo](http://www2.optics.rochester.edu/workgroups/guo/publications.html))
- [ ] Bucket charger
- [ ] Explaination dialog for decomposer, coating machine, etc.

# Dependencies

- moreblocks
- mesecons
- pipeworks
- technic
- charcoal
