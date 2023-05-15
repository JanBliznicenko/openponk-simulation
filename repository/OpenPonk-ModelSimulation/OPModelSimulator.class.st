"
I'm abstract class representing handler for simulation with direct connection to model object. I also contain other items.

Protocol stepping contains settings for steps, actions contain executing steps.
Stepping settings are divided into categories, each of these categories produces block which returns collection based on previous category.

    Instance Variables
	model:		Simulated object in model layer.
	stepFrom:		stepping settings block - sets source of collection
	stepIn:		stepping settings block - sets order of items in collection
	stepPriority:		stepping settings block - sets filtering based on priority
	stepSelect:		stepping settings block - enables to pick only certain amount of items
"
Class {
	#name : #OPModelSimulator,
	#superclass : #OPSimulator,
	#instVars : [
		'model',
		'stepItemsFrom',
		'stepItemsOrder',
		'stepItemsPriority',
		'stepItemsSelect'
	],
	#category : #'OpenPonk-ModelSimulation-Simulators'
}

{ #category : #'instance creation' }
OPModelSimulator class >> model: aDiagram [
	^ self new
		model: aDiagram;
		yourself
]

{ #category : #stepping }
OPModelSimulator >> fromAllTokens [
	"stepping settings
	before: none
	after: priority
	
	steps all tokens"

	stepItemsFrom := [ self tokens ]
]

{ #category : #stepping }
OPModelSimulator >> fromSelf [
	"stepping settings
	before: none
	after: priority
	
	steps self"

	stepItemsFrom := OrderedCollection with: self
]

{ #category : #stepping }
OPModelSimulator >> fromSimulableTokens [
	"stepping settings
	before: none
	after: priority
	
	steps simulable tokens"

	stepItemsFrom := [ self simulableTokens ]
]

{ #category : #stepping }
OPModelSimulator >> fromSteppableTokens [
	"stepping settings
	before: none
	after: priority
	
	steps steppable tokens"

	stepItemsFrom := [ self steppableTokens ]
]

{ #category : #'private - accessing' }
OPModelSimulator >> itemsForAction [
	^ stepItemsSelect value
]

{ #category : #'private - accessing' }
OPModelSimulator >> itemsForOrder [
	^ stepItemsPriority value
]

{ #category : #'private - accessing' }
OPModelSimulator >> itemsForPriority [
	^ stepItemsFrom value
]

{ #category : #'private - accessing' }
OPModelSimulator >> itemsForSelect [
	^ stepItemsOrder value
]

{ #category : #actions }
OPModelSimulator >> loadState [
	"loads state of model into simulator"

	self subclassResponsibility
]

{ #category : #accessing }
OPModelSimulator >> model [
	^ model
]

{ #category : #accessing }
OPModelSimulator >> model: aModel [
	model := aModel
]

{ #category : #stepping }
OPModelSimulator >> orderAny [
	"stepping settings
	before: priority
	after: select
	
	steps simulators in undetermined order - takes least time"

	stepItemsOrder := [ self itemsForOrder ]
]

{ #category : #stepping }
OPModelSimulator >> orderByPriority [
	"stepping settings
	before: priority
	after: select
	
	steps simulators ordered by priority"

	stepItemsOrder := [ 
	(SortedCollection sortBlock: self sortBlock)
		addAll: self itemsForOrder;
		yourself ]
]

{ #category : #stepping }
OPModelSimulator >> orderByReversedPriority [
	"stepping settings
	before: priority
	after: select
	
	steps simulators ordered by priority from least to top"

	stepItemsOrder := [ 
	(SortedCollection sortBlock: self reversedSortBlock)
		addAll: self itemsForOrder;
		yourself ]
]

{ #category : #stepping }
OPModelSimulator >> orderRandomized [
	"stepping settings
	before: priority
	after: select
	
	steps simulators in random (shuffled) order"

	stepItemsOrder := [ self itemsForOrder asOrderedCollection shuffle ]
]

{ #category : #stepping }
OPModelSimulator >> priorityAny [
	"stepping settings
	before: from
	after: in
	
	steps simulators with any priority"

	stepItemsPriority := [ self itemsForPriority ]
]

{ #category : #stepping }
OPModelSimulator >> priorityTop [
	"stepping settings
	before: from
	after: in
	
	steps only simulators with top priority"

	stepItemsPriority := [ 
	| maxPriority fromCol |
	fromCol := self itemsForPriority.
	fromCol
		ifNotEmpty: [ 
			maxPriority := fromCol inject: fromCol anyOne priority into: [ :max :item | item priority max: max ].
			fromCol select: [ :item | item priority = maxPriority ] ] ]
]

{ #category : #'private - creation' }
OPModelSimulator >> reversedSortBlock [
	"answers sorting block for putting item with lower priority before one with higher priority"

	^ [ :e1 :e2 | e1 priority <= e2 priority ]
]

{ #category : #actions }
OPModelSimulator >> saveState [
	"loads state of model into simulator"

	self subclassResponsibility
]

{ #category : #stepping }
OPModelSimulator >> selectAll [
	"stepping settings
	before: in
	after: action
	
	steps all simulators"

	stepItemsSelect := [ self itemsForSelect ]
]

{ #category : #stepping }
OPModelSimulator >> selectFirst [
	"stepping settings
	before: in
	after: action
	
	steps only the first one simulator"

	self selectFirst: 1
]

{ #category : #stepping }
OPModelSimulator >> selectFirst: amount [
	"stepping settings
	before: in
	after: action
	
	steps only first amount of simulators"

	self selectFrom: 1 to: amount
]

{ #category : #stepping }
OPModelSimulator >> selectFrom: firstIndex to: lastIndex [
	"stepping settings
	before: in
	after: action
	
	steps simulators within range"

	stepItemsSelect := [ 
	| collection |
	collection := self itemsForSelect.
	collection copyFrom: firstIndex to: (lastIndex min: collection size) ]
]

{ #category : #stepping }
OPModelSimulator >> selectLast [
	"stepping settings
	before: in
	after: actions
	
	steps only the last one simulator"

	self selectLast: 1
]

{ #category : #stepping }
OPModelSimulator >> selectLast: amount [
	"stepping settings
	before: in
	after: action
	
	steps only last amount of simulators"

	stepItemsSelect := [ 
	| collection |
	collection := self itemsForSelect.
	collection last: (amount min: collection size) ]
]

{ #category : #stepping }
OPModelSimulator >> selectOne: anIndex [
	"stepping settings
	before: in
	after: action
	
	steps only one simulator at anIndex"

	self selectFrom: anIndex to: anIndex
]

{ #category : #initialization }
OPModelSimulator >> setDefaultStepping [
	"sets default stepping settings"

	super setDefaultStepping.
	self
		priorityAny;
		orderByPriority;
		selectAll
]

{ #category : #accessing }
OPModelSimulator >> simulableTokens [
	"collection of tokens which are simulable"

	^ self subclassResponsibility
]

{ #category : #'private - creation' }
OPModelSimulator >> sortBlock [
	"answers sorting block for putting item with higher priority before one with lower priority"

	^ [ :e1 :e2 | e1 priority >= e2 priority ]
]

{ #category : #accessing }
OPModelSimulator >> steppableTokens [
	"collection of tokens which are steppable"

	^ self subclassResponsibility
]

{ #category : #accessing }
OPModelSimulator >> tokenCount [
	"amount of tokens"

	^ self subclassResponsibility
]

{ #category : #accessing }
OPModelSimulator >> tokens [
	"collection of tokens"

	^ self subclassResponsibility
]
