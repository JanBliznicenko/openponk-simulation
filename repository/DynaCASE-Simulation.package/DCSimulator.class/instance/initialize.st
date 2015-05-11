initialization
initialize
	super initialize.
	shouldRun := false.
	actions := OrderedCollection new.
	self
		delay: 1000;
		setDefaultStepping.
	announcer := Announcer new