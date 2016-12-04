as yet unclassified
parseSuiteChild
	parser isText ifTrue: [^self].

	(parser current isStartTagNamed: 'testcase')
		ifTrue: [^self parseTestcase].
	(parser current isStartTagNamed: 'system-out')
		ifTrue: [
			suite systemOut: self textUntilEnd].
	(parser current isStartTagNamed: 'system-err')
		ifTrue: [
			suite systemErr: self textUntilEnd].
	"Unknown.. just continue. Maybe parse until the end tag of it?"