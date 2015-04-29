accessing
diagram: aDiagram
	"creates and opens simulator"

	diagramSimulator := self simulatorClass diagram: aDiagram.
	self openWithSpec