"
A DCSimulatorTest is a test class for testing the behavior of DCSimulator
"
Class {
	#name : #OPSimulatorTest,
	#superclass : #TestCase,
	#instVars : [
		'simulator'
	],
	#category : 'OpenPonk-ModelSimulation-Tests'
}

{ #category : #testing }
OPSimulatorTest class >> isAbstract [
	^ self == OPSimulatorTest
]

{ #category : #hooks }
OPSimulatorTest >> controllerClass [
	^ self subclassResponsibility
]

{ #category : #hooks }
OPSimulatorTest >> prepareOneNotSteppable [
	self prepareOneSimulable.
	simulator steppable: false
]

{ #category : #hooks }
OPSimulatorTest >> prepareOneSimulable [
	self subclassResponsibility
]

{ #category : #hooks }
OPSimulatorTest >> prepareOneSteppable [
	self prepareOneSimulable.
	simulator steppable: true
]

{ #category : #running }
OPSimulatorTest >> setUp [
	simulator := self controllerClass new
]

{ #category : #tests }
OPSimulatorTest >> testAnnounceStep [
	| will steps |
	self prepareOneNotSteppable.
	will := 0.
	steps := 0.
	simulator when: OPSimulatorWillStep do: [ will := will + 1 ].
	simulator when: OPSimulatorWillStep do: [ self assert: steps = 0 ].
	simulator when: OPSimulatorStepped do: [ steps := steps + 1 ].
	self assert: will = 0.
	self assert: steps = 0.

	simulator step.
	self assert: will = 0.
	self assert: steps = 0.

	simulator steppable: true.
	simulator step.
	self assert: will = 1.
	self assert: steps = 1
]

{ #category : #tests }
OPSimulatorTest >> testDoAction [
	| counter action1 action2 |
	counter := 0.
	action1 := [ :item | counter := counter + 1 ].
	action2 := [ :item | counter := counter + 10 ].
	self prepareOneSteppable.

	simulator addAction: action1.

	self assert: counter = 0.

	simulator doAction: 1.
	self assert: counter = 1.

	simulator addAction: action2.

	simulator doAction: 1.
	self assert: counter = 2.
	simulator doAction: 2.
	self assert: counter = 12.

	simulator addFirstAction: action2.
	simulator doAction: 1.
	simulator doAction: 3.
	self assert: counter = 32
]

{ #category : #tests }
OPSimulatorTest >> testInstanceCreation [
	self assert: simulator delay >= 0.
	self shouldnt: [ simulator addAction: [ :item |  ] ] raise: Exception
]
