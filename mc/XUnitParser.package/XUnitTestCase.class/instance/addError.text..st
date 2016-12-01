as yet unclassified
addError: aType text: aText 
	(errors ifNil: [errors := OrderedCollection new]) add: (XUnitError initWithType: aType text: aText)