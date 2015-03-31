actions
run
	shouldRun := true.
	(self isFinished not and: shouldRun)
		whileTrue: [ 
			Delay forMilliseconds: delay.
			self step ]