I'm an object meant to run through simulated diagram.
Like all simulation items, I may be directly stepped.

Create my instance by providing element simulator to class-side method element: 
If this element does not know its diagramSimulator yet, provide also that.

    Instance Variables
	diagramSimulator:		simulator of diagram in which I am
	element:		simulator of element in which I am
	priority:		priority for step ordering or filtering