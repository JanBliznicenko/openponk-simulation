stepping
repeat
	"repeats step until finished or stopped, waits for delay between every step"

	shouldRun
		ifTrue: [ ^ self ].	"it is already running"
	shouldRun := true.
	[ 
	[ shouldRun and: [ self isSteppable ] ]
		whileTrue: [ 
			self
				step;
				wait ].
	shouldRun := false ] fork