actions
load
	diagram elements do: [ :element | diagram remove: element ].
	startingDiagram elements do: [ :element | diagram add: element ]