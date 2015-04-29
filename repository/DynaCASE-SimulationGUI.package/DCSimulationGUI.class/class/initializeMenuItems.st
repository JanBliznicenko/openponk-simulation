class initialization
initializeMenuItems
	self simulableControllerClasses
		do: [ :controllerClass | 
			controllerClass
				addMenuItemPrototype: [ :contextMenu :controller | contextMenu add: 'Step' action: (MessageSend receiver: self selector: #stepSimulatorOfController: argument: controller) ] ]