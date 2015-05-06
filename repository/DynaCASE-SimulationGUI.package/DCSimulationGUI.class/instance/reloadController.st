private - hooks
reloadController
	"creates new simulator for current diagramController"

	self diagramSimulator saveState.
	self window close.
	self loadController