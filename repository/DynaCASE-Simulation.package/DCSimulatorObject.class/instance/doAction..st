stepping
doAction: anIndex
	"makes selected action"

	| itemsToAct action |
	itemsToAct := self valueForAction.
	action := actions at: anIndex.
	self announce: (DCSimulatorWillDoAction simulator: self action: action index: anIndex).
	itemsToAct do: action.
	self announce: (DCSimulatorDidAction simulator: self action: action index: anIndex)