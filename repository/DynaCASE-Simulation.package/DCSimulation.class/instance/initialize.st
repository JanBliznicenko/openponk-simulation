initialization
initialize
	super initialize.
	shouldRun := false.
	elements := Set new.
	classMapping := Dictionary new.
	delay := 1000