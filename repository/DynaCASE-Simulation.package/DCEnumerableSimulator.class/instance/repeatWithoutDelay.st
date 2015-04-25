stepping
repeatWithoutDelay
	| originalDelay |
	originalDelay := self delay.
	self
		delay: 1;
		repeat;
		delay: originalDelay