building widgets
alignButtons
	"align content of all buttons to left"

	buttons
		select: [ :each | each widget isNotNil ]
		thenDo: [ :each | each widget widget submorphs first listCentering: #topLeft ]