actions
runSteps: anInteger
	shouldRun := true.
	[ 
	anInteger
		timesRepeat: [ 
			(shouldRun not or: [ self isFinished ])
				ifFalse: [ 
					self
						step;
						wait ] ] ] fork