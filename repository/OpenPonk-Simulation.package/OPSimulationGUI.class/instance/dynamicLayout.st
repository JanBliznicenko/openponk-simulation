building widgets
dynamicLayout
	| keys |
	keys := self widgets keys.
	layout := SpecColumnLayout composed.
	layout newRow: [ :r | r add: #filler ] height: 2.
	keys size odd
		ifTrue: [ keys := keys copyWith: #filler ].
	keys
		pairsDo: [ :odd :even | 
			layout
				newRow: [ :r | 
					r
						add: odd;
						add: even ]
				height: self class buttonHeight ].
	layout newRow: [ :r |  ].
	^ layout