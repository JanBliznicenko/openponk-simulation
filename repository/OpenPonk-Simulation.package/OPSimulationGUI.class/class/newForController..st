instance creation
newForController: aDiagramController
	^ self new
		diagramController: aDiagramController;
		open;
		yourself