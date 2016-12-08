*XUnitParser-json
toXunitJson
	^Dictionary new
		at: 'duration' put: (duration ifNotNil: [duration asNanoSeconds]);
		at: 'errors' put: (errors ifNotNil: [errors collect: [:each | each toXunitJson]]);
		at: 'failures' put: (failures ifNotNil: [failures collect: [:each | each toXunitJson]]);
		at: 'systemErr' put: systemErr;
		at: 'systemOut' put: systemOut;
		at: 'className' put: testClassName;
		at: 'testName' put: testName;
		yourself.