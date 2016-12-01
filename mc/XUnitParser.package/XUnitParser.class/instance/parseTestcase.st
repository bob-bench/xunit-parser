as yet unclassified
parseTestcase
	| testCase |

	(parser isStartTag: 'testcase')
		ifFalse: [^self error: 'Invalid state' ].

	testCase := XUnitTestCase new
		testClassName: (parser at: 'classname');
		testName: (parser at: 'name');
		duration: (parser at: 'time') asNumber asSeconds;
		yourself.
	
	[ parser next isEndTag: 'testcase' ] whileFalse: [
	(parser is: 'system-err')
		ifTrue: [
			parser next.
			testCase systemErr: parser consumeText].
	(parser is: 'system-out')
		ifTrue: [
			parser next.
			testCase systemOut: parser consumeText].
		(parser isStartTag: 'error') ifTrue: [
			| type |
			type := parser at: 'type'.
			parser next.
			testCase addError: type text: parser consumeText].
		(parser isStartTag: 'failure') ifTrue: [
			| type |
			type := parser at: 'type'.
			parser next.
			testCase addFailure: type text: parser consumeText]].
	suite addTestCase: testCase.