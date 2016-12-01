as yet unclassified
parseSuiteChild
	(parser is: 'testcase')
		ifTrue: [^self parseTestcase].
	(parser is: 'system-out')
		ifTrue: [
			parser next.
			^suite systemOut: parser consumeText].
	(parser is: 'system-err')
		ifTrue: [
			parser next.
			^suite systemErr: parser consumeText].
	"Unknown.. just continue. Maybe parse until the end tag of it?"
	^parser next.