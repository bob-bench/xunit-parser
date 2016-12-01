as yet unclassified
parseSuites
	[ parser next isEndTag: 'testsuites' ] whileFalse: [
		(parser is: 'testsuite')
			ifTrue: [ result add: self parseSuite ]
			ifFalse: [XUnitNoTestsuiteError signal: parser current tag]].