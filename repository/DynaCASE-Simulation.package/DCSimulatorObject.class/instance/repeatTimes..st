stepping
repeatTimes: anInteger
	"repeats step anInteger times
	 stops also when finished or stopped
	 waits for delay between every step"

	shouldRun := true.
	[ 
	anInteger
		timesRepeat: [ 
			(shouldRun not or: [ self isFinished ])
				ifFalse: [ 
					self
						step;
						wait ] ] ] fork