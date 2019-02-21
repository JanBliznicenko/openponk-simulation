updating
reloadController
	"reloads elements from diagramController"

	| controller |
	controller := self diagramController.
	self
		closed;
		diagramController: controller;
		activate