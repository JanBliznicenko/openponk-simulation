class initialization
initialize
	self = OPSimulationGUI
		ifTrue: [ ^ self ].	"guard clause - OPSimulationGUI is abstract, so code below does not make sense for it"
	self
		initializeMenuButtons;
		initializeMenuItems