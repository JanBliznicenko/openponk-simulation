private - accessing
diagram: aDiagram
	"sets and loads model"

	diagram := aDiagram.
	self
		loadItems;
		loadState