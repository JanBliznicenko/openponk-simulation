private - creation
reversedSortBlock
	"answers sorting block for putting item with lower priority before one with higher priority"

	^ [ :e1 :e2 | e1 priority <= e2 priority ]