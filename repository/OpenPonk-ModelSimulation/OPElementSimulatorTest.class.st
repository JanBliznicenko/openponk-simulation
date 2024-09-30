"
A DCElementSimulatorTest is a test class for testing the behavior of DCElementSimulator
"
Class {
	#name : 'OPElementSimulatorTest',
	#superclass : 'OPModelSimulatorTest',
	#category : 'OpenPonk-ModelSimulation-Tests',
	#package : 'OpenPonk-ModelSimulation',
	#tag : 'Tests'
}

{ #category : 'hooks' }
OPElementSimulatorTest >> controllerClass [
	^ OPDummySubclassOfDCElementSimulator
]

{ #category : 'hooks' }
OPElementSimulatorTest >> prepareOneSimulable [
	simulator fromSelf
]

{ #category : 'running' }
OPElementSimulatorTest >> setUp [
	super setUp.
	simulator model: OPDummyDCElement new.
	simulator
		addToken: OPDummyDCToken new;
		addToken: OPDummyDCToken new
]

{ #category : 'tests' }
OPElementSimulatorTest >> testAccessing [
	| assertTokens |
	assertTokens := [ :amount | 
	self assert: simulator tokenCount = amount.
	self assert: simulator tokens size = amount.
	self assert: simulator steppableTokens size = 0.
	self assert: simulator simulableTokens size = amount.
	self assert: (simulator tokens allSatisfy: [ :token | token element = simulator ]) ].

	simulator addToken: OPDummyDCToken new.
	assertTokens value: 3.
	simulator addToken: OPDummyDCToken new.
	assertTokens value: 4.
	simulator removeToken: simulator tokens first.
	assertTokens value: 3.
	simulator removeAllTokens.
	assertTokens value: 0
]

{ #category : 'tests' }
OPElementSimulatorTest >> testConnected [
	self assert: simulator outgoing size = 0.
	self assert: simulator incoming size = 0.
	simulator addIncoming: self controllerClass new.
	self assert: simulator incoming size = 1.
	simulator addOutgoing: self controllerClass new.
	self assert: simulator outgoing size = 1.
	self assert: simulator incoming first outgoing first = simulator.
	self assert: simulator outgoing first incoming first = simulator.
	self assert: simulator outgoing first outgoing size = 0.
	self assert: simulator incoming first incoming size = 0
]

{ #category : 'tests' }
OPElementSimulatorTest >> testStates [
	self assert: simulator model state = 1.
	simulator saveState.
	self assert: simulator model state = 2.
	simulator loadState.
	self assert: simulator model state = 1
]

{ #category : 'tests' }
OPElementSimulatorTest >> testStep [
	simulator
		fromSelf;
		orderAny;
		priorityAny;
		selectAll;
		addAction: [ :item | item saveState ].

	self assert: simulator model state = 1.
	simulator step.
	self assert: simulator model state = 1.
	simulator steppable: true.
	simulator step.
	self assert: simulator model state = 2
]
