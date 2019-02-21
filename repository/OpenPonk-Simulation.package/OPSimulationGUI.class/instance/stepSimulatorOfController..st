actions
stepSimulatorOfController: anElementController
	"steps simulator of elementController"

	| elementSimulator |
	elementSimulator := self diagramSimulator simulatorOf: anElementController model.
	elementSimulator step