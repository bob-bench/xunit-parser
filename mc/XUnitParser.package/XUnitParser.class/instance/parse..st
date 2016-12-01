as yet unclassified
parse: aReadStream
	parser := XMLPullParser parse: aReadStream.
	result := OrderedCollection new.
	[ parser next isEndDocument ] whileFalse: [
		(parser is: 'testsuites')
			ifTrue: [self parseSuites]
			ifFalse: [
				(parser is: 'testsuite')
					ifTrue: [result add: self parseSuite]
					ifFalse: [XUnitNoTestsuiteError signal: parser current tag]]].
	^result