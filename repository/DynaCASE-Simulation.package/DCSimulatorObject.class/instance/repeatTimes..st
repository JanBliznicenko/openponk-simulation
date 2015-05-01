stepping
repeatTimes: anInteger
	"repeats step anInteger times
	 stops also when finished or stopped
	 waits for delay between every step"

	shouldRun
		ifTrue: [ ^ self ].	"it is already running"
	shouldRun := true.
	[ 
	anInteger
		timesRepeat: [ 
			(shouldRun not or: [ self isFinished ])
				ifFalse: [ 
					self
						step;
						wait ] ].
	shouldRun := false ] fork