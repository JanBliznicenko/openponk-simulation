testing
isSimulable
	"could there be any possibility to step?"

	^ elements anySatisfy: [ :any | any isSimulable ]