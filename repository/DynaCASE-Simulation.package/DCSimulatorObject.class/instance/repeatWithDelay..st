stepping
repeatWithDelay: delayInMilliseconds
	"repeats step until finished or stopped, waits for given time between every step"

	| originalDelay |
	originalDelay := self delay.
	self
		delay: delayInMilliseconds;
		repeat;
		delay: originalDelay