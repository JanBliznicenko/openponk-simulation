accesing
elementOf: aModel
	^ elements detect: [ :element | element model = aModel ]