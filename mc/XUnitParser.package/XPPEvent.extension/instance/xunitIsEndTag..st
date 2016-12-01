*XUnitParser-extension
xunitIsEndTag: aString 
	^self isEndDocument or: [self isEndTag: aString]