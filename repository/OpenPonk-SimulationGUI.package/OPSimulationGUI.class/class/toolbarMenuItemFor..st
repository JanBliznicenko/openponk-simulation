toolbar
toolbarMenuItemFor: aBuilder
	^ (aBuilder item: 'Simulation')
		action: [ "aBuilder model is editor" self diagramController: aBuilder model diagramController ]