accesing
steppableElements
	"elements which can step right now"

	^ simulableElements select: [ :el | el isSteppable ]