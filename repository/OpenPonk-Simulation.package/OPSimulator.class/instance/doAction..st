actions
doAction: anIndex
	"makes selected action"

	| itemsToAct action |
	itemsToAct := self itemsForAction.
	action := actions at: anIndex.
	self announce: (OPSimulatorWillDoAction simulator: self action: action index: anIndex).
	itemsToAct do: action.
	self announce: (OPSimulatorDidAction simulator: self action: action index: anIndex)