as yet unclassified
parseSuiteChild
	parser isText ifTrue: [^self].

	(parser current isStartTagNamed: 'testcase')
		ifTrue: [^self parseTestcase].
	(parser current isStartTagNamed: 'system-out')
		ifTrue: [
			suite systemOut: parser next string.
			parser next].
	(parser current isStartTagNamed: 'system-err')
		ifTrue: [
			suite systemErr: parser next string.
			parser next].
	"Unknown.. just continue. Maybe parse until the end tag of it?"