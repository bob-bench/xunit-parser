as yet unclassified
parseSuites
	[ parser next xunitIsEndTag: 'testsuites' ] whileFalse: [
		(parser is: 'testsuite')
			ifTrue: [ result add: self parseSuite ]
			ifFalse: [XUnitNoTestsuiteError signal: parser current tag]].