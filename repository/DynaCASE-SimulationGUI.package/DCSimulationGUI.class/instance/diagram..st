accessing
diagram: aDiagram
	"creates and opens simulator"

	diagramSimulator := self simulatorClass model: aDiagram.
	self
		title: 'Simulation of ' , aDiagram name;
		openWithSpec.
	self window
		whenClosedDo: [ 
			diagramSimulator
				stop;
				loadState ]