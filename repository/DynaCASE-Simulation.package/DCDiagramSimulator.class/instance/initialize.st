initialization
initialize
	super initialize.
	shouldRun := false.
	elements := Set new.
	simulatedElements := SortedCollection sortBlock: [ :e1 :e2 | e1 priority >= e2 priority ].
	self delay: 1000