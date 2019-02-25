private - hooks
buttonItems
	"creates collection of buttons for this GUI"

	^ OrderedCollection
		with:
			((self instantiate: ButtonModel)
				label: 'Save state';
				iconName: #smallSave;
				help: 'Save current state into model';
				action: [ self diagramSimulator saveState ])
		with:
			((self instantiate: ButtonModel)
				label: 'Stop + Load state';
				iconName: #smallUpdate;
				help: 'Load state from model from before simulate';
				action: [ self diagramSimulator loadState ])