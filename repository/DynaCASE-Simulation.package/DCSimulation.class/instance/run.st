actions
run
	shouldRun := true.
	[ shouldRun and: [ self isFinished not ] ]
		whileTrue: [ 
			(Delay forMilliseconds: delay) wait.
			self step ]