as yet unclassified
testEmptyDocument
	| res |
	res := XUnitParser parse: ''.
	self assert: res isNil.