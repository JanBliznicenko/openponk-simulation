class initialization
initialize
	super initialize.
	self = DCSimulationGUI
		ifTrue: [ ^ self ].	"guard clause - DCSimulationGUI is abstract, so code below does not make sense for it"
	self
		initializeMenuButtons;
		initializeMenuItems