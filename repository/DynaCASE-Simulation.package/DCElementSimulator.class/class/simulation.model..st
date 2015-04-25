instance creation
simulation: aSimulation model: anElement
	^ self new
		diagram: aSimulation;
		model: anElement;
		yourself