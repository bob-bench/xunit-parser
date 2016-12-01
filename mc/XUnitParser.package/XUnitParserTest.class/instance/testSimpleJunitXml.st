as yet unclassified
testSimpleJunitXml
	| res tests |
	res := XUnitParser parse: self class simpleJunitXML readStream.
	self assert: res class equals: OrderedCollection.
	self assert: res size equals: 1.
	res := res first.
	self assert: res class equals: XUnitTestSuite.
	self assert: res errors equals: 1.
	self assert: res failures equals: 1.
	self assert: res suiteName equals: 'tests.ATest'.
	self assert: res testCount equals: 3.
	self assert: res duration equals: 0.069 asSeconds.
	self assert: res time equals: (DateAndTime year: 2009 month: 12 day: 19 hour: 17 minute: 58 second: 59).
	self assert: res systemOut asByteArray hex equals: '686572650d'.
	self assert: res systemErr asByteArray hex equals: ''.

	tests := res tests.
	self assert: tests size equals: 3.
	self assert: tests first testClassName equals: 'tests.ATest'.
	self assert: tests first duration equals: 0.006 asSeconds.
	self assert: tests first testName equals: 'error'.
	self assert: tests first hasError.
	self assert: tests first errors size equals: 1.
	self assert: tests first errors first type equals: 'java.lang.RuntimeException'.
	self assert: tests first errors first text asByteArray hex equals: '6a6176612e6c616e672e52756e74696d65457863657074696f6e0d0961742074657374732e41546573742e6572726f722841546573742e6a6176613a3131290d'.
	self deny: tests first hasFailure.
	
	self deny: tests second hasError.
	self assert: tests second hasFailure.
	self assert: tests second failures size equals: 1.
