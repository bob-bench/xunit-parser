as yet unclassified
testEmptyDocument
	self should: [XUnitParser parse: ''] raise: XMLWellFormednessException.