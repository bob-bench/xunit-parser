as yet unclassified
testWrongInput
	self should: [XUnitParser parse: '<doc></doc>'] raise: XUnitNoTestsuiteError.