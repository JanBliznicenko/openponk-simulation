initialization
initialClassMapping
	^ super initialClassMapping
		at: OPDummyDCElement put: OPDummyDCElementSimulator;
		at: OPDummyDCEdge put: OPDummyDCEdgeSimulator;
		yourself