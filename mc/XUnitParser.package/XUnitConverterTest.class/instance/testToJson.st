as yet unclassified
testToJson
	| tests res |
	tests := XUnitParser parse: XUnitParserTest simpleJunitXML readStream.
	"Simplify the result handling"
	tests first tests
		removeLast;
		removeLast.
	tests first
		systemOut: 'here'.
	(tests first tests first errors first)
		text: 'text';
		type: 'type'.
	res := XUnitConverter toJson: tests.
	self assert: res equals: {
		{
			'duration' -> 69000000.
			'time' -> (DateAndTime readFrom: '2009-12-19T17:58:59' readStream) asUTC asString.
			'errorCount' -> 1.
			'failureCount' -> 1.
			'testCount' -> 3.
			'suiteName' -> 'tests.ATest'.
			'systemErr' -> ''.
			'systemOut' -> 'here'.
			'tests' -> {
				{
					'duration' -> 6000000.
					'systemErr' -> nil.
					'systemOut' -> nil.
					'className' -> 'tests.ATest'.
					'testName' -> 'error'.
					'failures' -> nil.
					'errors' -> {
						{ 
							'text' -> 'text'.
							'type' -> 'type'.
						} asDictionary.
					 } asOrderedCollection.
				} asDictionary.
			} asOrderedCollection.
		} asDictionary.
	} asOrderedCollection