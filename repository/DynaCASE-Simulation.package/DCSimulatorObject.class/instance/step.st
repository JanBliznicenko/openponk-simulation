stepping
step
	"makes all actions"

	| itemsToAct |
	self isSteppable
		ifFalse: [ ^ self ].
	itemsToAct := self valueForAction.
	self announce: (DCSimulatorWillStep simulator: self).
	actions
		withIndexDo: [ :action :index | 
			self announce: (DCSimulatorWillDoAction simulator: self action: action index: index).
			itemsToAct do: action.
			self announce: (DCSimulatorDidAction simulator: self action: action index: index) ].
	self announce: (DCSimulatorStepped simulator: self)