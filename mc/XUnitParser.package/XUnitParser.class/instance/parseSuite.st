as yet unclassified
parseSuite
	parser next.
	parser isEndDocument ifTrue: [^nil].
	(parser is: 'testsuite') ifFalse: [
		^XUnitNoTestsuiteError signal: 'Unknown expected tag'].
	suite := XUnitTestSuite new
		duration: (parser at: 'time') asNumber asSeconds;
		failures: (parser at: 'failures') asInteger;
		errors: (parser at: 'errors') asInteger;
		suiteName: (parser at: 'name');
		time: (DateAndTime readFrom: (parser at: 'timestamp') readStream);
		testCount: (parser at: 'tests') asInteger;
		yourself.

	parser next.
	[ parser current isEndDocument ] whileFalse: [
		self parseSuiteChild].
	^suite