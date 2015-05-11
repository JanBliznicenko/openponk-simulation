private - creation
createElementFrom: aModel
	"creates simulator element for model element"

	| simulatorClass |
	simulatorClass := self class classFor: aModel.
	elements add: (simulatorClass model: aModel diagramSimulator: self)