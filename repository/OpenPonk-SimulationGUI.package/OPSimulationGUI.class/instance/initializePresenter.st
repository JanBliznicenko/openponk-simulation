initialization
initializePresenter
	self title: 'Simulation'.
	self buttons addGroup: [ :group | self buttonItems do: [ :buttonItem | group addItem: buttonItem ] ].
	buttons applyTo: self