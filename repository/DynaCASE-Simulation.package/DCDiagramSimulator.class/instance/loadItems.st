private - creation
loadItems
	"creates simulators for model elements"

	model elements do: [ :modelElement | self createElementFrom: modelElement ].
	self
		elementsDo: [ :element | element loadConnectedItems ];
		loadSimulableElements