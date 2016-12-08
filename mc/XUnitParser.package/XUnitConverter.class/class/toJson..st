as yet unclassified
toJson: aResult
	^aResult collect: [:each | each toXunitJson ]