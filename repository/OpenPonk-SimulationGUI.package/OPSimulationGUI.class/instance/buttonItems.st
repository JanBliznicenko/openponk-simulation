private - hooks
buttonItems
	"creates collection of buttons for this GUI"

	^ OrderedCollection
		with: [ :item | 
			item
				name: 'Save state';
				description: 'Save current state into model';
				action: [ self diagramSimulator saveState ] ]
		with: [ :item | 
			item
				name: 'Stop + Load state';
				description: 'Load state from model from before simulate';
				action: [ self diagramSimulator loadState ] ]