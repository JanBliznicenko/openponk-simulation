initialization
initializeWithController
	"creates and prepares simulator for current diagramController"

	self loadSimulation.
	self diagram when: OPElementAdded do: [ self reloadController ].
	self diagram when: OPElementRemoved do: [ self reloadController ].
	self title: 'Simulation of ' , self diagram name.
	self addButtons