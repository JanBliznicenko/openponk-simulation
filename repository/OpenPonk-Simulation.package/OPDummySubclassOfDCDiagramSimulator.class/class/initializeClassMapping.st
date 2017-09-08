as yet unclassified
initializeClassMapping
	super initializeClassMapping.
	ClassMapping
		at: OPDummyDCElement put: OPDummyDCElementSimulator;
		at: OPDummyDCEdge put: OPDummyDCEdgeSimulator