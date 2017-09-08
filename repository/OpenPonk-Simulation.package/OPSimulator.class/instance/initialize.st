initialization
initialize
	super initialize.
	shouldRun := false.
	self
		delay: 1000;
		resetActions;
		setDefaultStepping.
	announcer := Announcer new