as yet unclassified
addFailure: aType text: aText 
	(failures ifNil: [failures := OrderedCollection new]) add: (XUnitError initWithType: aType text: aText)