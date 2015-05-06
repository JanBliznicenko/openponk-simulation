private - hooks
buttonItems
	"creates collection of buttons for this GUI"

	^ OrderedCollection
		with: [ :item | 
			item
				name: 'Full reload';
				description: 'Load state and recreate structure of elements';
				action: [ self reloadController ] ]
		with: [ :item | 
			item
				name: 'Load state';
				description: 'Load state from model from before simulate';
				action: [ self diagramSimulator loadState ] ]
		with: [ :item | 
			item
				name: 'Save state';
				description: 'Save current state into model';
				action: [ self diagramSimulator saveState ] ]