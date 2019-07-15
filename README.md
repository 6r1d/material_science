# Material science mod

This mod adds new materials and blocks into Minetest. It's in pre-alpha stage currently.

For now, there's a screenshot of a `decomposer` block, which decomposes stone dust to the minerals, connected to `filters` from [Pipeworks mod](https://forum.minetest.net/viewtopic.php?t=2155) and `blinky plants` from [Mesecons mod](http://mesecons.net/). Filters take items from `chests` and `blinky plants` set the timing for that, by the way. This way, stone dust from `chests` is decomposed to more useful things.

The idea is to give user different types of materials (often in raw, oxidized state, requiring further processing).

![](doc/images/screenshot_a.png)

Currently, it can output these types of dusts: silicon, aluminium, iron, calcium, sodium, magnesium, potassium, phosphorus, carbon, sulfur, chromium, zinc, copper, lead, tin, silver, gold. These elements are sorted by distribution in Earth's crust, your chance to get gold is far lower than your chance to get silicon.

I'll soon add Technic mod's HV power input.

Any advices about blocks using new elements (or old, too) are welcome. For instance, I want to add phosphorus with its temporary glow and phosphorus-doped glass with the same properties.

# TODO

- [ ] Electricity requirement for `decomposer` block
- [ ] Ways to convert alumina to aluminium
- [ ] [Verneuil process](https://en.wikipedia.org/wiki/Verneuil_process) to obtain sapphires and rubies
- [ ] Gas chemistry (get chlorine by applying electricity to the salt, then NaOH)
- [ ] Cellulose
