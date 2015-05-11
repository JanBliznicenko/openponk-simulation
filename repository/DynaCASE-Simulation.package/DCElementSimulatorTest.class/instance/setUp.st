running
setUp
	super setUp.
	simulator model: DummyDCElement new.
	simulator
		addToken: DummyDCToken new;
		addToken: DummyDCToken new