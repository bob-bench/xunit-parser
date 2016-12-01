as yet unclassified
parse: aReadStream 
	parser := XMLPullParser parse: aReadStream.
	^self parseSuite