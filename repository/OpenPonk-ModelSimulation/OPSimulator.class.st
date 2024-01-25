"
I'm a root class in simulators hierarchy above model.
I handle stepping and repeating steps and contains announcers.

Protocol stepping contains settings for steps, actions contain executing steps.

    Instance Variables
	actions:		collection of blocks of actions taken with each step
	announcer:		Announcer instance
	delayInMilliseconds:		integer containing delay between steps
	shouldRun:		boolean telling whether running should continue
"
Class {
	#name : #OPSimulator,
	#superclass : #Object,
	#instVars : [
		'shouldRun',
		'announcer',
		'actions',
		'delayInMilliseconds'
	],
	#category : #'OpenPonk-ModelSimulation-Simulators'
}

{ #category : #stepping }
OPSimulator >> addAction: block [
	"stepping settings
	source based on valueForAction method
	
	adds block to collection of actions for stepping"

	actions addLast: block
]

{ #category : #stepping }
OPSimulator >> addFirstAction: block [
	"stepping settings
	source based on valueForAction method
	
	adds block to collection of actions for stepping"

	actions addFirst: block
]

{ #category : #announcing }
OPSimulator >> announce: anAnnouncement [
	announcer announce: anAnnouncement
]

{ #category : #accessing }
OPSimulator >> delay [
	"pause between steps while repeating"

	^ delayInMilliseconds
]

{ #category : #accessing }
OPSimulator >> delay: milliSeconds [
	"pause between steps while repeating"

	delayInMilliseconds := milliSeconds
]

{ #category : #accessing }
OPSimulator >> diagram [
	^ self diagramSimulator model
]

{ #category : #accessing }
OPSimulator >> diagramSimulator [
	^ self subclassResponsibility
]

{ #category : #actions }
OPSimulator >> doAction: anIndex [
	"makes selected action"

	| itemsToAct action |
	itemsToAct := self itemsForAction.
	action := actions at: anIndex.
	self announce: (OPSimulatorWillDoAction simulator: self action: action index: anIndex).
	itemsToAct do: action.
	self announce: (OPSimulatorDidAction simulator: self action: action index: anIndex)
]

{ #category : #stepping }
OPSimulator >> fromSelf [
	"stepping settings
	before: none
	after: priority
	
	steps self"

	self subclassResponsibility
]

{ #category : #initialization }
OPSimulator >> initialize [
	super initialize.
	shouldRun := false.
	self
		delay: 1000;
		resetActions;
		setDefaultStepping.
	announcer := Announcer new
]

{ #category : #testing }
OPSimulator >> isFinished [
	"is there not any way to step anymore?"

	^ self isSteppable not
]

{ #category : #testing }
OPSimulator >> isSimulable [
	"could there be any possibility to step? - rigid: should return always true or always false"

	^ self subclassResponsibility
]

{ #category : #testing }
OPSimulator >> isSteppable [
	"can I step right now?"

	^ self subclassResponsibility
]

{ #category : #'private - accessing' }
OPSimulator >> itemsForAction [
	^ self subclassResponsibility
]

{ #category : #actions }
OPSimulator >> repeat [
	"repeats step until finished or stopped, waits for delay between every step"

	| delay |
	shouldRun
		ifTrue: [ ^ self ].	"it is already running"
	delay := self delay.
	self announce: (OPSimulatorWillRun simulator: self delay: delay).
	shouldRun := true.
	[ 
	[ shouldRun and: [ self isSteppable ] ]
		whileTrue: [ 
			self
				step;
				waitFor: delay ].
	shouldRun := false.
	self announce: (OPSimulatorStoppedRun simulator: self delay: delay) ] fork
]

{ #category : #actions }
OPSimulator >> repeatOnce [
	"steps once"

	self step
]

{ #category : #actions }
OPSimulator >> repeatTimes: anInteger [
	"repeats step anInteger times
	 stops also when finished or stopped
	 waits for delay between every step"

	| delay |
	shouldRun
		ifTrue: [ ^ self ].	"it is already running"
	delay := self delay.
	self announce: (OPSimulatorWillRun simulator: self delay: delay repeatTimes: anInteger).
	shouldRun := true.
	[ 
	anInteger
		timesRepeat: [ 
			(shouldRun not or: [ self isFinished ])
				ifFalse: [ 
					self
						step;
						waitFor: delay ] ].
	shouldRun := false.
	self announce: (OPSimulatorStoppedRun simulator: self delay: delay repeatTimes: anInteger) ] fork
]

{ #category : #actions }
OPSimulator >> repeatWithDelay: delay [
	"repeats step until finished or stopped, waits for given time between every step"

	| originalDelay |
	originalDelay := self delay.
	self
		delay: delay;
		repeat;
		delay: originalDelay
]

{ #category : #stepping }
OPSimulator >> resetActions [
	actions := OrderedCollection new
]

{ #category : #initialization }
OPSimulator >> setDefaultStepping [
	"sets default stepping settings"

	self fromSelf
]

{ #category : #actions }
OPSimulator >> step [
	"makes all actions"

	| itemsToAct |
	self isSteppable ifFalse: [ ^ self ].
	itemsToAct := self itemsForAction.
	self announce: (OPSimulatorWillStep simulator: self).
	actions withIndexDo: [ :action :index |
		self announce:
			(OPSimulatorWillDoAction
				 simulator: self
				 action: action
				 index: index).
		itemsToAct do: action.
		self announce:
			(OPSimulatorDidAction simulator: self action: action index: index) ].
	self announce: (OPSimulatorStepped simulator: self)
]

{ #category : #actions }
OPSimulator >> stop [
	"terminates running when current step is finished"

	shouldRun := false
]

{ #category : #'private - actions' }
OPSimulator >> waitFor: milliSeconds [
	(Delay forMilliseconds: milliSeconds) wait
]

{ #category : #announcing }
OPSimulator >> when: anEvent do: aBlock [
	announcer when: anEvent do: aBlock
]
