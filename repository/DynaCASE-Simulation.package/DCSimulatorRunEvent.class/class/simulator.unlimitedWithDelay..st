instance creation
simulator: aSimulator unlimitedWithDelay: milliseconds
	^ (super simulator: aSimulator)
		unlimited;
		delay: milliseconds;
		yourself