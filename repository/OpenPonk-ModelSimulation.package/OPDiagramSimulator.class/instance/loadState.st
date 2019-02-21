actions
loadState
	"loads state of model into simulator"

	self stop.
	self elementsDo: [ :element | element loadState ]