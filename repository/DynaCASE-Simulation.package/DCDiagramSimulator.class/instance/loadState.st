actions
loadState
	"loads state of model into simulator"

	self elementsDo: [ :element | element loadState ]