Class {
	#name : #BaselineOfOpenPonkSimulation,
	#superclass : #BaselineOf,
	#category : #BaselineOfOpenPonkSimulation
}

{ #category : #accessing }
BaselineOfOpenPonkSimulation >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'OpenPonk'
				with: [ spec repository: 'github://openponk/openponk:v2.0.0/repository' ].
			spec
				baseline: 'OpenPonkModelSimulation'
				with: [ spec
						repository: 'github://JanBliznicenko/openponk-simulation:v2.0.0/repository' ].
			spec
				package: 'OpenPonk-Simulation'
				with: [ spec requires: #('OpenPonkModelSimulation') ].
			spec
				group: 'plugin' with: #('OpenPonk-Simulation');
				group: 'default' with: #('OpenPonk' 'plugin') ]
]
