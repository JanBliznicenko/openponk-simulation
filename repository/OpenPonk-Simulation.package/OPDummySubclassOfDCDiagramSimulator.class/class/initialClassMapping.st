initialization
initialClassMapping
	^ self initialClassMapping
		at: OPDummyDCElement put: OPDummyDCElementSimulator;
		at: OPDummyDCEdge put: OPDummyDCEdgeSimulator;
		yourself