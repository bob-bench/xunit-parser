as yet unclassified
baseline: spec
	<baseline>
	
	spec for: #common do: [
		spec project: 'XMLPullParser' with: [
				spec
    					className: 'ConfigurationOfXMLPullParser';
    					version: '1.6';
    					repository: 'http://www.smalltalkhub.com/mc/hernan/XMLPullParser/main'].
		spec package: 'XUnitParser' with: [spec requires: #('XMLPullParser') ]
	]