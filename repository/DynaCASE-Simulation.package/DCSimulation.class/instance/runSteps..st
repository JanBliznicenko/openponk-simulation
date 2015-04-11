actions
runSteps: anInteger
	shouldRun := true.
	anInteger
		timesRepeat: [ 
			(shouldRun not or: [ self isFinished ])
				ifTrue: [ ^ self ].
			self
				wait;
				step ]