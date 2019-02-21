instance creation
simulator: aSimulator delay: milliseconds repeatTimes: anInteger
	^ (super simulator: aSimulator)
		repeatTimes: anInteger;
		delay: milliseconds;
		yourself