private - creation
loadElements
	diagram elements do: [ :model | self loadElementFrom: model ].
	elements do: [ :element | element loadConnectedItems ]