class initialization
initializeMenuButtons
	self controllerClass
		addMenuButtonPrototype: [ :editorMenu :diagramController | editorMenu addButton: 'Simulation' description: 'Simulation' action: [ self controller: diagramController ] ]