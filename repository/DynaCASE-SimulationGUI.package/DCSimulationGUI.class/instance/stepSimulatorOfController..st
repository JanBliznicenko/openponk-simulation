actions
stepSimulatorOfController: anElementController
	"steps simulator of elementController"

	| elementSimulator |
	elementSimulator := diagramSimulator simulatorOf: anElementController model.
	elementSimulator step