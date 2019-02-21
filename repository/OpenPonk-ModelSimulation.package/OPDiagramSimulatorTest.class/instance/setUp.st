running
setUp
	| edge |
	super setUp.
	diagram := OPDummyDCDiagram new.
	diagram addElements: 3.
	edge := OPDummyDCEdge new
		source: diagram elements first;
		target: diagram elements second;
		yourself.
	diagram add: edge.
	simulator model: diagram