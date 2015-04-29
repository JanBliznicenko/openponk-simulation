private - hooks
buttonItems
	"creates collection of buttons for this GUI"

	^ OrderedCollection
		with: [ :item | 
			item
				name: 'Load';
				description: 'Load from model';
				action: [ self simulator loadState ] ]
		with: [ :item | 
			item
				name: 'Save';
				description: 'Save into model';
				action: [ self simulator saveState ] ]