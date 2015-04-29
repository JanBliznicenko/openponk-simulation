instance creation
stepSimulatorOfController: anElementController
	"answers existing simulatorGUI with aDiagramController or creates new one for it and steps simulator of elementController"

	| myInstance |
	myInstance := self controller: anElementController diagramController.
	myInstance stepSimulatorOfController: anElementController