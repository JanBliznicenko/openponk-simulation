instance creation
simulator: aSimulator delay: milliseconds
	^ (super simulator: aSimulator)
		delay: milliseconds;
		yourself