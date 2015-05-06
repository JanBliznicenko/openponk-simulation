instance creation
controller: aDiagramController
	"answers existing simulatorGUI with aDiagramController or creates new one for it"

	| gui |
	gui := self allInstances
		detect: [ :anyInstance | anyInstance isOpen and: [ anyInstance controller == aDiagramController ] ]
		ifNone: [ self newForController: aDiagramController ].
	gui activate.	"causes simulation GUI to get on top of screen"
	^ gui