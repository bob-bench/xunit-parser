as yet unclassified
parseSuite
	suite := XUnitTestSuite new
		duration: (parser at: 'time' ifNone: 0) asNumber asSeconds;
		failures: (parser at: 'failures') asInteger;
		errors: (parser at: 'errors') asInteger;
		suiteName: (parser at: 'name');
		testCount: (parser at: 'tests') asInteger;
		yourself.
	(parser at: 'timestamp' ifNone: nil) ifNotNil: [:time |
		suite time: (DateAndTime readFrom: time readStream)].

	[ parser next xunitIsEndTag: 'testsuite' ] whileFalse: [
		self parseSuiteChild].
	^suite