actions
step
	super step.
	self tokensDo: [ :token | token step ]