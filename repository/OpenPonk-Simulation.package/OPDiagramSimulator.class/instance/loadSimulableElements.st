private - creation
loadSimulableElements
	"selects elements which are simulable"

	simulableElements := elements select: [ :element | element isSimulable ]