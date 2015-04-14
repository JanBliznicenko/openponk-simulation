private - actions
randomElementDo: aBlock
	aBlock value: (self steppableElements ifEmpty: [ ^ self ]) atRandom