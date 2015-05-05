I'm a root class in simulators hierarchy above model.
I handle stepping and repeating steps and contains announcers.

Protocol stepping contains settings for steps, actions contain executing steps.

    Instance Variables
	actions:		collection of blocks of actions taken with each step
	announcer:		Announcer instance
	delayInMilliseconds:		integer containing delay between steps
	shouldRun:		boolean telling whether running should continue