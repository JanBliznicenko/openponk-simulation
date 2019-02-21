initialization
initializeMenuItems
	"adds context menu (right-click on element on canvas) item"

	self flag: #todo
	"self simulableControllerClasses
		do: [ :controllerClass | 
			controllerClass
				addMenuItemPrototype: [ :contextMenu :controller | contextMenu add: 'Step' action: (MessageSend receiver: self selector: #stepSimulatorOfController: argument: controller) ] ]"