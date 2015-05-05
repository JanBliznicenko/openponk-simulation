private - creation
createElementFrom: aModel
	"creates simulator element for model element"

	| simulatorClass |
	simulatorClass := self simulatorClassFor: aModel.
	elements add: (simulatorClass diagramSimulator: self model: aModel)