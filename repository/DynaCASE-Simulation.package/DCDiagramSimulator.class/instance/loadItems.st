private - creation
loadItems
	diagram elements do: [ :model | self createElementFrom: model ].
	self
		elementsDo: [ :element | element loadConnectedItems ];
		loadSimulableElements