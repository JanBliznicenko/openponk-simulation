stepping
repeatWithoutDelay
	"repeats step until finished or stopped"

	| originalDelay |
	originalDelay := self delay.
	self
		delay: 1;
		repeat;
		delay: originalDelay