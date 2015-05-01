instance creation
diagramSimulator: aDiagramSimulator model: anElement
	^ self new
		diagramSimulator: aDiagramSimulator;
		model: anElement;
		yourself