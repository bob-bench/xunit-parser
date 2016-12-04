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
		(current isStartTagNamed: 'system-err') ifTrue: [
				testCase systemErr: self textUntilEnd].
		(current isStartTagNamed: 'system-out') ifTrue: [
				testCase systemOut: self textUntilEnd].
		(current isStartTagNamed: 'error') ifTrue: [
			| type |
			type := current attributeAt: 'type'.
			testCase addError: type text: self textUntilEnd].
		(current isStartTagNamed: 'failure') ifTrue: [
			| type |
			type := current attributeAt: 'type'.
			testCase addFailure: type text: self textUntilEnd]].
	suite addTestCase: testCase.