actions
repeatWithoutDelay
	"repeats step until finished or stopped"

	| delay |
	shouldRun
		ifTrue: [ ^ self ].	"it is already running"
	delay := self delay.
	self announce: (DCSimulatorWillRun simulator: self unlimitedWithDelay: delay).
	shouldRun := true.
	[ 
	[ shouldRun and: [ self isSteppable ] ] whileTrue: [ self step ].
	shouldRun := false.
	self announce: (DCSimulatorStoppedRun simulator: self unlimitedWithDelay: delay) ] fork