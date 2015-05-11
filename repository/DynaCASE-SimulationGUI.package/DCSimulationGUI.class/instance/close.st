windows
close
	self diagram announcer unsubscribe: self.
	self diagramSimulator loadState.
	diagramController := nil.
	diagramSimulator := nil