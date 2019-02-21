running
setUp
	super setUp.
	simulator model: OPDummyDCElement new.
	simulator
		addToken: OPDummyDCToken new;
		addToken: OPDummyDCToken new