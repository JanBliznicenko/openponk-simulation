as yet unclassified
initializeClassMapping
	super initializeClassMapping.
	ClassMapping
		at: DummyDCElement put: DummyDCElementSimulator;
		at: DummyDCEdge put: DummyDCEdgeSimulator