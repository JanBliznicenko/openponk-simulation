testing
isSteppable
	"can I step right now?"

	^ simulableElements anySatisfy: [ :any | any isSteppable ]