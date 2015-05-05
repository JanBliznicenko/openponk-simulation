actions
repeatTimes: anInteger
	"repeats step anInteger times
	 stops also when finished or stopped
	 waits for delay between every step"

	| delay |
	shouldRun
		ifTrue: [ ^ self ].	"it is already running"
	delay := self delay.
	self announce: (DCSimulatorWillRun simulator: self repeatTimes: anInteger delay: delay).
	shouldRun := true.
	[ 
	anInteger
		timesRepeat: [ 
			(shouldRun not or: [ self isFinished ])
				ifFalse: [ 
					self
						step;
						waitFor: delay ] ].
	shouldRun := false.
	self announce: (DCSimulatorStoppedRun simulator: self repeatTimes: anInteger delay: delay) ] fork