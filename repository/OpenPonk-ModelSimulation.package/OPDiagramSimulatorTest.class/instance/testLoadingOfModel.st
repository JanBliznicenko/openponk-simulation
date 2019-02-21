tests
testLoadingOfModel
	self assert: (simulator elements allSatisfy: [ :each | each loaded ]).
	self assert: simulator elements size = 4.
	self assert: (simulator elements count: [ :each | each class = OPDummyDCEdgeSimulator ]) = 1.
	self assert: (simulator elements count: [ :each | each class = OPDummyDCElementSimulator ]) = 3.

	self assert: (simulator simulatorOf: diagram elements last) class = OPDummyDCEdgeSimulator.
	self assert: (simulator elements allSatisfy: [ :each | each diagramSimulator = simulator ])