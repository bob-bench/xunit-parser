as yet unclassified
parseSuites
	[ parser next xunitIsEndTag: 'testsuites' ] whileFalse: [
		| current |
		current := parser current.
		(current isStartTagNamed: 'testsuite')
			ifTrue: [ result add: self parseSuite ]
			ifFalse: [current isTag ifTrue: [XUnitNoTestsuiteError signal: parser current localName]]].