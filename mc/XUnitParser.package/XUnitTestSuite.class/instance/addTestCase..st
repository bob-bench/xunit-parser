as yet unclassified
addTestCase: aTestCase 
	(tests ifNil: [tests := OrderedCollection new]) add: aTestCase