stepping
actions: blocksCollection
	"stepping settings
	before: select
	after: step/repeat
	
	sets collection of actions for stepping"

	stepAction := [ 
	| selectCollection |
	selectCollection := stepSelect value.
	blocksCollection do: [ :action | selectCollection do: action ] ]