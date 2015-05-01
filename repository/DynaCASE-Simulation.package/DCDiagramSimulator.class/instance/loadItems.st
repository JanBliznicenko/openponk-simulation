private - creation
loadItems
	"creates simulators for model elements"

	model elements do: [ :model | self createElementFrom: model ].
	self
		elementsDo: [ :element | element loadConnectedItems ];
		loadSimulableElements