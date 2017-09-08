actions
saveState
	"saves state after simulation into model"

	self elementsDo: [ :element | element saveState ]