as yet unclassified
parse: aReadStream
	parser := StAXParser new on: aReadStream.
	result := OrderedCollection new.
	[ parser next isEndDocument ] whileFalse: [
		(parser current isStartTagNamed: 'testsuites')
			ifTrue: [self parseSuites]
			ifFalse: [
				(parser current isStartTagNamed: 'testsuite')
					ifTrue: [result add: self parseSuite]
					ifFalse: [parser current isTag ifTrue: [XUnitNoTestsuiteError signal: parser current localName]]]].
	^result