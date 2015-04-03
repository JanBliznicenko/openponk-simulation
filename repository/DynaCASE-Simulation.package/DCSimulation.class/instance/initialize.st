initialization
initialize
	super initialize.
	shouldRun := false.
	elements := SortedCollection new.
	classMapping := Dictionary new.
	delay := 1000