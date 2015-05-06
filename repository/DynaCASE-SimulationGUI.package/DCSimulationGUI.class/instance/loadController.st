private - hooks
loadController
	"creates simulator for current diagramController"

	diagramSimulator := self simulatorClass model: diagramController model.
	self
		title: 'Simulation of ' , diagramController model name;
		openWithSpec.
	self window whenClosedDo: [ self diagramSimulator close ]