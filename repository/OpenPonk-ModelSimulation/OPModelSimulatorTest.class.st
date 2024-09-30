"
A DCModelSimulatorTest is a test class for testing the behavior of DCModelSimulator
"
Class {
	#name : 'OPModelSimulatorTest',
	#superclass : 'OPSimulatorTest',
	#category : 'OpenPonk-ModelSimulation-Tests',
	#package : 'OpenPonk-ModelSimulation',
	#tag : 'Tests'
}

{ #category : 'testing' }
OPModelSimulatorTest class >> isAbstract [
	^ self == OPModelSimulatorTest
]

{ #category : 'tests' }
OPModelSimulatorTest >> testFromAllTokens [
	simulator fromAllTokens.
	self assert: simulator itemsForPriority size = simulator tokenCount
]

{ #category : 'tests' }
OPModelSimulatorTest >> testFromSelf [
	simulator fromSelf.
	self assert: simulator itemsForPriority size = 1.
	self assert: simulator itemsForPriority first = simulator
]

{ #category : 'tests' }
OPModelSimulatorTest >> testFromSimulableTokens [
	simulator fromSimulableTokens.
	self assert: simulator itemsForPriority size = simulator simulableTokens size
]

{ #category : 'tests' }
OPModelSimulatorTest >> testFromSteppableTokens [
	simulator fromSteppableTokens.
	self assert: simulator itemsForPriority size = simulator steppableTokens size
]

{ #category : 'tests' }
OPModelSimulatorTest >> testOrderAny [
	simulator
		fromAllTokens;
		priorityAny;
		orderAny.
	simulator tokens first priority: 1.
	self assert: simulator itemsForSelect size = simulator tokenCount.
	self assert: simulator itemsForSelect first priority = 1
]

{ #category : 'tests' }
OPModelSimulatorTest >> testOrderByPriority [
	simulator
		fromAllTokens;
		priorityAny;
		orderByPriority.
	simulator tokens last priority: 2.
	simulator tokens first priority: 1.
	self assert: simulator itemsForSelect size = simulator tokenCount.
	self assert: simulator itemsForSelect first priority = 2.
	self assert: simulator itemsForSelect second priority = 1
]

{ #category : 'tests' }
OPModelSimulatorTest >> testOrderByReversedPriority [
	simulator
		fromAllTokens;
		priorityAny;
		orderByReversedPriority.
	simulator tokens last priority: 1.
	simulator tokens first priority: 2.
	self assert: simulator itemsForSelect size = simulator tokenCount.
	self assert: simulator itemsForSelect last priority = 2.
	self assert: simulator itemsForSelect allButLast last priority = 1.
]

{ #category : 'tests' }
OPModelSimulatorTest >> testPriorityAny [
	simulator
		fromAllTokens;
		priorityAny.
	simulator tokens first priority: 1.
	self assert: simulator itemsForOrder size = simulator tokenCount
]

{ #category : 'tests' }
OPModelSimulatorTest >> testPriorityTop [
	simulator
		fromAllTokens;
		priorityTop.
	simulator tokens allButFirstDo: [ :token | token priority: 1 ].
	self assert: simulator itemsForOrder size = (simulator tokenCount - 1)
]

{ #category : 'tests' }
OPModelSimulatorTest >> testSelectAll [
	simulator
		fromAllTokens;
		priorityAny;
		orderByPriority;
		selectAll.
	simulator tokens first priority: 1.
	simulator tokens second priority: 2.
	self assert: simulator itemsForAction size = simulator tokenCount.
	self assert: simulator itemsForAction first priority = 2.
	self assert: simulator itemsForAction second priority = 1.
]

{ #category : 'tests' }
OPModelSimulatorTest >> testSelectFirst [
	simulator
		fromAllTokens;
		priorityAny;
		orderByPriority;
		selectFirst.
	simulator tokens first priority: 1.
	simulator tokens second priority: 2.
	self assert: simulator itemsForAction size = 1.
	self assert: simulator itemsForAction first priority = 2
]

{ #category : 'tests' }
OPModelSimulatorTest >> testSelectFirstN [
	simulator
		fromAllTokens;
		priorityAny;
		orderByPriority;
		selectFirst: 2.
	simulator tokens first priority: 1.
	simulator tokens last priority: 2.
	self assert: simulator itemsForAction size = 2.
	self assert: simulator itemsForAction first priority = 2.
	self assert: simulator itemsForAction second priority = 1
]

{ #category : 'tests' }
OPModelSimulatorTest >> testSelectFromTo [
	simulator
		fromAllTokens;
		priorityAny;
		orderByPriority;
		selectFrom: 1 to: 2.
	simulator tokens first priority: 1.
	simulator tokens second priority: 2.
	self assert: simulator itemsForAction size = 2.
	self assert: simulator itemsForAction first priority = 2.
	self assert: simulator itemsForAction second priority = 1
]

{ #category : 'tests' }
OPModelSimulatorTest >> testSelectLast [
	simulator
		fromAllTokens;
		priorityAny;
		orderByReversedPriority;
		selectLast.
	simulator tokens first priority: 1.
	simulator tokens second priority: 2.
	self assert: simulator itemsForAction size = 1.
	self assert: simulator itemsForAction first priority = 2
]

{ #category : 'tests' }
OPModelSimulatorTest >> testSelectLastN [
	simulator
		fromAllTokens;
		priorityAny;
		orderByReversedPriority;
		selectLast: 2.
	simulator tokens last priority: 1.
	simulator tokens first priority: 2.
	self assert: simulator itemsForAction size = 2.
	self assert: simulator itemsForAction first priority = 1.
	self assert: simulator itemsForAction second priority = 2
]

{ #category : 'tests' }
OPModelSimulatorTest >> testSelectOne [
	simulator
		fromAllTokens;
		priorityAny;
		orderByPriority;
		selectOne: 2.
	simulator tokens first priority: 1.
	simulator tokens second priority: 2.
	self assert: simulator itemsForAction size = 1.
	self assert: simulator itemsForAction first priority = 1
]
