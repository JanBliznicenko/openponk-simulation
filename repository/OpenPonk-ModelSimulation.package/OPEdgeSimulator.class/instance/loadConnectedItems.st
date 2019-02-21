creation
loadConnectedItems
	"loads and/or connects appropriate tokens and elements"

	super loadConnectedItems.
	self
		source: (diagramSimulator simulatorOf: model source);
		target: (diagramSimulator simulatorOf: model target)