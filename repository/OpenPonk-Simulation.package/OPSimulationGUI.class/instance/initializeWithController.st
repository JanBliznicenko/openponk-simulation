initialization
initializeWithController
	"creates and prepares simulator for current diagramController"

	self loadSimulation.
	self diagram
		when: OPElementAdded do: [ self reloadController ];
		when: OPElementRemoved do: [ self reloadController ].
	self title: 'Simulation of ' , self diagram name.
	self addButtons.
	self openWithSpec.
	self window whenClosedDo: [ self closed ]