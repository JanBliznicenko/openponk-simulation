initialization
initialize
	super initialize.
	shouldRun := false.
	items := SortedCollection new.
	preAction := [  ].
	postAction := [  ].
	delay := 1000