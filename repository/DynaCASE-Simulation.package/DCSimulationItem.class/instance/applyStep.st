private - actions
applyStep
	changes
		do: [ :change | change value ];
		removeAll.
	super applyStep