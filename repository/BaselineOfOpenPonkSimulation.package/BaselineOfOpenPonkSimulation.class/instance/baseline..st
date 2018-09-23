accessing
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'OpenPonkModel'
				with: [ spec repository: 'github://bliznjan/openponk-model/repository' ].
			spec package: 'OpenPonk-Simulation' with: [ spec requires: #('OpenPonkModel') ].
			spec group: 'default' with: #('OpenPonk-Simulation') ]