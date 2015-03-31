accessing
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ 
			spec baseline: 'DynaCASEModel' with: [ spec repository: 'github://dynacase/dynacase-model/repository' ].
			spec package: 'DynaCASE-Simulation' with: [ spec requires: #('DynaCASEModel') ].
			spec group: 'default' with: #('DynaCASE-Simulation') ]