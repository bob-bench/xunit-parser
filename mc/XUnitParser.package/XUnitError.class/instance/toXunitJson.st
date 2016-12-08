*XUnitParser-json
toXunitJson
	^Dictionary new
		at: 'text' put: text;
		at: 'type' put: type;
		yourself