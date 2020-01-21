"
I'm abstract action-related event of simulators

    Instance Variables
	action:		block of related action
	index:		index of action in collection of actions
"
Class {
	#name : #OPSimulatorActionEvent,
	#superclass : #OPSimulatorEvent,
	#instVars : [
		'action',
		'index'
	],
	#category : 'OpenPonk-ModelSimulation-Events'
}

{ #category : #'instance creation' }
OPSimulatorActionEvent class >> simulator: aSimulator action: anAction index: anIndex [
	^ (super simulator: aSimulator)
		action: anAction;
		index: anIndex;
		yourself
]

{ #category : #accessing }
OPSimulatorActionEvent >> action [
	^ action
]

{ #category : #'private - accessing' }
OPSimulatorActionEvent >> action: anObject [
	action := anObject
]

{ #category : #accessing }
OPSimulatorActionEvent >> index [
	^ index
]

{ #category : #'private - accessing' }
OPSimulatorActionEvent >> index: anObject [
	index := anObject
]
