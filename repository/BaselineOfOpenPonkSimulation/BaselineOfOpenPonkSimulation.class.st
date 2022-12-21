Class {
	#name : #BaselineOfOpenPonkSimulation,
	#superclass : #BaselineOf,
	#category : #BaselineOfOpenPonkSimulation
}

{ #category : #accessing }
BaselineOfOpenPonkSimulation >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec
			baseline: 'OpenPonk'
			with: [ spec repository: 'github://openponk/openponk:dev-roassal3' ].
		spec baseline: 'OpenPonkModelSimulation' with: [ 
			spec repository:
				'github://JanBliznicenko/openponk-simulation' ].
		spec
			package: 'OpenPonk-Simulation'
			with: [ spec requires: #( 'OpenPonkModelSimulation' ) ].
		spec
			group: 'plugin' with: #( 'OpenPonk-Simulation' );
			group: 'default' with: #( 'OpenPonk' 'plugin' ) ]
]
