as yet unclassified
baseline: spec
	<baseline>
	
	spec for: #common do: [
		spec project: 'XMLParserStAX' with: [
				spec
    					className: 'ConfigurationOfXMLParserStAX';
    					version: '1.2.6';
    					repository: 'http://www.smalltalkhub.com/mc/PharoExtras/XMLParserStAX/main'].
		spec package: 'XUnitParser' with: [spec requires: #('XMLParserStAX') ]
	]