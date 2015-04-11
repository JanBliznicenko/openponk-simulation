actions
load
	diagram elements do: [ :model | diagram remove: model ].
	startingDiagram elements do: [ :model | diagram add: model ]