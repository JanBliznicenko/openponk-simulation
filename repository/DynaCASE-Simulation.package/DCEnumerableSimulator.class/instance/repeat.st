stepping
repeat
	shouldRun := true.
	[ 
	[ self isFinished ]
		whileFalse: [ 
			self
				step;
				wait ] ] fork