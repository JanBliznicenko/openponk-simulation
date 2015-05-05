initialization
initialize
	super initialize.
	shouldRun := false.
	self
		delay: 1000;
		setDefaultStepping.
	announcer := Announcer new