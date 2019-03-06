accessing
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'OpenPonkModel'
				with: [ spec repository: 'github://OpenPonk/openponk-model/repository' ].
			spec package: 'OpenPonk-ModelSimulation' with: [ spec requires: #('OpenPonkModel') ].
			spec group: 'default' with: #('OpenPonk-ModelSimulation') ]
