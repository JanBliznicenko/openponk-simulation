tests
testEnumeration
	self assert: (simulator elements allSatisfy: [ :each | each state = 1 ]).
	simulator elementsDo: [ :each | each saveState ].
	self assert: (simulator elements allSatisfy: [ :each | each state = 2 ]).
	simulator simulableElementsDo: [ :each | each saveState ].
	self assert: (simulator elements allSatisfy: [ :each | each isSimulable not or: [ each state = 3 ] ])