actions
run
	shouldRun := true.
	[ shouldRun and: [ self isFinished not ] ]
		whileTrue: [ 
			self
				wait;
				step ]