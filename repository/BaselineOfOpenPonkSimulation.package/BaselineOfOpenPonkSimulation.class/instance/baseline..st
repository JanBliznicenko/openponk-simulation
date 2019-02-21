accessing
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'OpenPonk'
				with: [ spec repository: 'github://openponk/openponk:v1.0.0/repository' ].
			spec
				baseline: 'OpenPonkModelSimulation'
				with: [ spec repository: 'github://JanBliznicenko/openponk-simulation/repository' ].
			spec
				package: 'OpenPonk-Simulation'
				with: [ spec requires: #('OpenPonk' 'OpenPonkModelSimulation') ].
			spec group: 'default' with: #('OpenPonk-Simulation') ]