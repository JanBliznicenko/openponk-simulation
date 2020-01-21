"
I'm abstract event of simulators

    Instance Variables
	simulator:		simulator which did that
"
Class {
	#name : #OPSimulatorEvent,
	#superclass : #OPSimulationEvent,
	#instVars : [
		'simulator'
	],
	#category : 'OpenPonk-ModelSimulation-Events'
}

{ #category : #'instance creation' }
OPSimulatorEvent class >> simulator: aSimulator [
	^ self new
		simulator: aSimulator;
		yourself
]

{ #category : #accessing }
OPSimulatorEvent >> simulator [
	^ simulator
]

{ #category : #'private - accessing' }
OPSimulatorEvent >> simulator: aSimulator [
	simulator := aSimulator
]
