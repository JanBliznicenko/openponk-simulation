initialization
initializeWithController
	"creates and prepares simulator for current diagramController"

	self loadSimulation.
	self diagram
		when: DCElementAdded do: [ self reloadController ];
		when: DCElementRemoved do: [ self reloadController ].
	self title: 'Simulation of ' , self diagram name