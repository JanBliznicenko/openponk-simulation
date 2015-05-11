updating
reloadController
	| controller |
	controller := self diagramController.
	self
		close;
		diagramController: controller