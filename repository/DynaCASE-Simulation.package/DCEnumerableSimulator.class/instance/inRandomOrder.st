stepping
inRandomOrder
	"stepping settings
	before: priority
	after: select
	
	steps simulators in random (shuffled) order"

	stepIn := [ stepPriority value asOrderedCollection shuffle ]