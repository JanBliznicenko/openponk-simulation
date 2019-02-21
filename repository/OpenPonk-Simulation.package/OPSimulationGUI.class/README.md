I'm above Simulation layer and Controller layer which I connect together, like controller connects model and view.

I am responsible for integration into GUI of DynaCASE, for creating own GUI and for special animations only for simulation.

Make my instance only by using class-side method controller:
If there is not any instance for given controller, I create one and if there is one, I return that one.
=> I have singleton-like behavior for each diagramController.

All subclasses should contain simulatorClass method, which returns appropriate class of diagramSimulator.
For adding buttons into my GUI use buttonItems method, for adding own code for diagramController, use loadController method.

Internal Representation and Key Implementation Points.

    Instance Variables
	buttons:		contains collection of blocks used for adding buttons into my GUI
	diagramController:		controller of diagram
	diagramSimulator:		simulator of diagram