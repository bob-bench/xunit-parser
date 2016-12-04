*XUnitParser-extension
xunitIsEndTag: aString 
	^self isEndDocument or: [self isEndTagNamed: aString]