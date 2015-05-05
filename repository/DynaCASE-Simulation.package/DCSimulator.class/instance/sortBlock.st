private - creation
sortBlock
	"answers sorting block for putting item with higher priority before one with lower priority"

	^ [ :e1 :e2 | e1 priority >= e2 priority ]