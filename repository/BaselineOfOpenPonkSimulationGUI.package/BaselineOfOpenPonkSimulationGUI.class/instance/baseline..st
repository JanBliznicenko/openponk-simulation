accessing
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'OpenPonk'
				with: [ spec repository: 'github://openponk/openponk:v1.0.0/repository' ].
			spec
				baseline: 'OpenPonkSimulation'
				with: [ spec repository: 'github://JanBliznicenko/openponk-simulation/repository' ].
			spec
				package: 'OpenPonk-SimulationGUI'
				with: [ spec requires: #('OpenPonk' 'OpenPonkSimulation') ].
			spec group: 'default' with: #('OpenPonk-SimulationGUI') ]