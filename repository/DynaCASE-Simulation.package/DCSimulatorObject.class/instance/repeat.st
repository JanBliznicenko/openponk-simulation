stepping
repeat
	"repeats step until finished or stopped, waits for delay between every step"

	| delay |
	shouldRun
		ifTrue: [ ^ self ].	"it is already running"
	delay := self delay.
	self announce: (DCSimulatorWillRun simulator: self unlimitedWithDelay: delay).
	shouldRun := true.
	[ 
	[ shouldRun and: [ self isSteppable ] ]
		whileTrue: [ 
			self
				step;
				waitFor: delay ].
	shouldRun := false.
	self announce: (DCSimulatorStoppedRun simulator: self unlimitedWithDelay: delay) ] fork