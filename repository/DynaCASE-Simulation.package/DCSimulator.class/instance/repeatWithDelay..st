actions
repeatWithDelay: delay
	"repeats step until finished or stopped, waits for given time between every step"

	| originalDelay |
	originalDelay := self delay.
	self
		delay: delay;
		repeat;
		delay: originalDelay