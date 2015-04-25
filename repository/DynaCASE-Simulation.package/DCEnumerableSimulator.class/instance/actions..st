stepping
actions: blocksCollection
	stepAction := [ 
	| selectCollection |
	selectCollection := stepSelect value.
	blocksCollection do: [ :action | selectCollection do: action ] ]