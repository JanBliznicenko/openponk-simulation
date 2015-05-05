I'm abstract class representing handler for simulation with direct connection to model object. I also contain other items.

Protocol stepping contains settings for steps, actions contain executing steps.
Stepping settings are divided into categories, each of these categories produces block which returns collection based on previous category.

    Instance Variables
	model:		Simulated object in model layer.
	stepFrom:		stepping settings block - sets source of collection
	stepIn:		stepping settings block - sets order of items in collection
	stepPriority:		stepping settings block - sets filtering based on priority
	stepSelect:		stepping settings block - enables to pick only certain amount of items