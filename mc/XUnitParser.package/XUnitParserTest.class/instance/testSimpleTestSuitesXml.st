as yet unclassified
testSimpleTestSuitesXml
	| res tests |
	res := XUnitParser parse: self class simpleTestSuitesXml readStream.
	self assert: res class equals: OrderedCollection.
	self assert: res size equals: 2.
	res := res first.
	self assert: res class equals: XUnitTestSuite.
	self assert: res errors equals: 0.
	self assert: res failures equals: 0.
	self assert: res suiteName equals: 'my test suite'.
	self assert: res testCount equals: 1.
	self assert: res duration equals: 0 asSeconds.
	self assert: res time equals: nil.
	self assert: res systemOut isNil.
	self assert: res systemErr isNil.

	tests := res tests.
	self assert: tests size equals: 1.
	self assert: tests first testClassName equals: 'some.class.name'.
	self assert: tests first duration equals: 123.345000 asSeconds.
	self assert: tests first testName equals: 'Test1'.
	self assert: tests first systemErr asByteArray hex equals: '4920616d20737464657272210d202020202020202020202020'.
	self assert: tests first systemOut asByteArray hex equals: '4920616d207374646f7574210d202020202020202020202020'.
	self deny: tests first hasError.
	self deny: tests first hasFailure.