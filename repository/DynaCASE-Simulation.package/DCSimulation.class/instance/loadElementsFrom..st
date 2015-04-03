private
loadElementsFrom: anElement
	| simulated |
	(elements anySatisfy: [ :any | any model = anElement ])
		ifTrue: [ ^ self ].	"this one is already added"
	simulated := (classMapping at: anElement class) model: anElement.
	elements add: simulated.
	simulated connectedModels do: [ :element | self loadElementsFrom: element ].
	elements addAll: simulated createTokens