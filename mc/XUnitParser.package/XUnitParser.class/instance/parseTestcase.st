as yet unclassified
parseTestcase
	| current testCase |

	current := parser current.
	(current isStartTagNamed: 'testcase')
		ifFalse: [^self error: 'Invalid state' ].

	testCase := XUnitTestCase new
		testClassName: (current attributeAt: 'classname');
		testName: (current attributeAt: 'name');
		duration: (current attributeAt: 'time') asNumber asSeconds;
		yourself.
	
	[ parser next xunitIsEndTag: 'testcase' ] whileFalse: [
		current := parser current.
		(current isStartTagNamed: 'system-err')
			ifTrue: [
				parser next.
				testCase systemErr: parser current string.
				parser next].
		(current isStartTagNamed: 'system-out')
			ifTrue: [
				parser next.
				testCase systemOut: parser current string.
				parser next].
		(current isStartTagNamed: 'error') ifTrue: [
			| type |
			type := current attributeAt: 'type'.
			parser next.
			testCase addError: type text: parser current string.
			parser next].
		(current isStartTagNamed: 'failure') ifTrue: [
			| type |
			type := current attributeAt: 'type'.
			parser next.
			testCase addFailure: type text: parser current string.
			parser next]].
	suite addTestCase: testCase.