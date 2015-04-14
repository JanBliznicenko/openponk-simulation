actions
toFinish
	| originalDelay |
	originalDelay := self delay.
	self
		delay: 0;
		run;
		delay: originalDelay