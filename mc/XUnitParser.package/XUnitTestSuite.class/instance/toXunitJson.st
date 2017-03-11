*XUnitParser-json
toXunitJson
	^Dictionary new
		at: 'duration' put: (duration ifNotNil: [duration asNanoSeconds]);
		at: 'time' put: (time ifNotNil: [time asUTC asString]);
		at: 'errorCount' put: errors;
		at: 'failureCount' put: failures;
		at: 'testCount' put: testCount;
		at: 'suiteName' put: suiteName;
		at: 'systemErr' put: systemErr;
		at: 'systemOut' put: systemOut;
		at: 'tests' put: (self tests collect: [:each | each toXunitJson]);
		yourself.