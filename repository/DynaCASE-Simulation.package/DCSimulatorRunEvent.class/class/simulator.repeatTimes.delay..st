instance creation
simulator: aSimulator repeatTimes: anInteger delay: milliseconds
	^ (super simulator: aSimulator)
		repeatTimes: anInteger;
		delay: milliseconds;
		yourself