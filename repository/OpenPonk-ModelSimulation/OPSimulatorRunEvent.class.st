"
I'm abstract running-related event of simulators

    Instance Variables
	delay:		delay between steps
	limited:		boolean which tells whethere there is limited amount of steps
	repeatTimes:		amount of steps meant to be taken if limited, nil if not limited
"
Class {
	#name : #OPSimulatorRunEvent,
	#superclass : #OPSimulatorEvent,
	#instVars : [
		'repeatTimes',
		'delay'
	],
	#category : 'OpenPonk-ModelSimulation-Events'
}

{ #category : #'instance creation' }
OPSimulatorRunEvent class >> simulator: aSimulator delay: milliseconds [
	^ (super simulator: aSimulator)
		delay: milliseconds;
		yourself
]

{ #category : #'instance creation' }
OPSimulatorRunEvent class >> simulator: aSimulator delay: milliseconds repeatTimes: anInteger [
	^ (super simulator: aSimulator)
		repeatTimes: anInteger;
		delay: milliseconds;
		yourself
]

{ #category : #accessing }
OPSimulatorRunEvent >> delay [
	^ delay
]

{ #category : #'private - accessing' }
OPSimulatorRunEvent >> delay: anObject [
	delay := anObject
]

{ #category : #accessing }
OPSimulatorRunEvent >> isLimited [
	^ repeatTimes notNil
]

{ #category : #accessing }
OPSimulatorRunEvent >> repeatTimes [
	^ repeatTimes
]

{ #category : #'private - accessing' }
OPSimulatorRunEvent >> repeatTimes: anInteger [
	repeatTimes := anInteger
]
