as yet unclassified
parseSuite
	| current |
	current := parser current.

	suite := XUnitTestSuite new
		duration: (current attributeAt: 'time' ifAbsent: 0) asNumber asSeconds;
		failures: (current attributeAt: 'failures') asInteger;
		errors: (current attributeAt: 'errors') asInteger;
		suiteName: (current attributeAt: 'name');
		testCount: (current attributeAt: 'tests') asInteger;
		yourself.
	(current attributeAt: 'timestamp' ifAbsent: nil) ifNotNil: [:time |
		suite time: (DateAndTime readFrom: time readStream)].

	[ parser next xunitIsEndTag: 'testsuite' ] whileFalse: [
		self parseSuiteChild].
	^suite