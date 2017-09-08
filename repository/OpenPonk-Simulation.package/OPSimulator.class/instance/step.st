actions
step
	"makes all actions"

	| itemsToAct |
	self isSteppable
		ifFalse: [ ^ self ].
	itemsToAct := self itemsForAction.
	self announce: (OPSimulatorWillStep simulator: self).
	actions
		withIndexDo: [ :action :index | 
			self announce: (OPSimulatorWillDoAction simulator: self action: action index: index).
			itemsToAct do: action.
			self announce: (OPSimulatorDidAction simulator: self action: action index: index) ].
	self announce: (OPSimulatorStepped simulator: self)