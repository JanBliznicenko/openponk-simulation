accessing
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ 
			spec baseline: 'DynaCASE' with: [ spec repository: 'github://dynacase/dynacase/repository' ].
			spec package: 'DynaCASE-Simulation' with: [ spec requires: #('DynaCASE') ].
			spec group: 'default' with: #('DynaCASE-Simulation') ]