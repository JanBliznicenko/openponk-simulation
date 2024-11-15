Class {
	#name : 'BaselineOfOpenPonkModelSimulation',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfOpenPonkModelSimulation',
	#package : 'BaselineOfOpenPonkModelSimulation'
}

{ #category : 'accessing' }
BaselineOfOpenPonkModelSimulation >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'OpenPonkModel'
				with: [ spec repository: 'github://OpenPonk/openponk-model:v4.0.x' ].
			spec package: 'OpenPonk-ModelSimulation' with: [ spec requires: #('OpenPonkModel') ].
			spec group: 'default' with: #('OpenPonk-ModelSimulation') ]

]
