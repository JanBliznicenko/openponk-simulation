building widgets
rebuildWidget
	self widgets removeAll.
	self createWidgets.
	self needFullRebuild: false.
	self buildWithSpecLayout: self dynamicLayout.
	self alignButtons.
	self extent: 360 @ (26 + (buttons size * self class buttonHeight / 2))