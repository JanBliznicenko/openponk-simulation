instance creation
simulation: aSimulation model: anElement
	^ self new
		simulation: aSimulation;
		model: anElement;
		yourself