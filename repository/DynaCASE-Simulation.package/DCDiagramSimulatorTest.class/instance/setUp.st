running
setUp
	| edge |
	super setUp.
	diagram := DummyDCDiagram new.
	diagram addElements: 3.
	edge := DummyDCEdge new
		source: diagram elements first;
		target: diagram elements second;
		yourself.
	diagram add: edge.
	simulator model: diagram