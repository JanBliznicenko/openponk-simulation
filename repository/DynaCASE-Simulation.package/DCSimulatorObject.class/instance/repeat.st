stepping
repeat
	"repeats step until finished or stopped, waits for delay between every step"

	shouldRun := true.
	[ 
	[ shouldRun and: [ self isFinished not ] ]
		whileTrue: [ 
			self
				step;
				wait ].
	shouldRun := false ] fork