instance creation
controller: aDiagramController
	"answers existing simulatorGUI with aDiagramController or creates new one for it"

	| gui |
	gui := self allInstances
		detect: [ :anInstance | anInstance isOpen and: [ anInstance diagram = aDiagramController model ] ]
		ifNone: [ self newForController: aDiagramController ].
	gui activate.	"causes simulation GUI to get on top of screen"
	^ gui