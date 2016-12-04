as yet unclassified
noFailTextXML
	"https://github.com/notnoop/hudson-tools/blob/master/toJunitXML/sample-junit.xml"
	^'<?xml version="1.0" encoding="UTF-8" ?>
<testsuite errors="1" failures="1" hostname="mahmood-alis-macbook-pro.local"
    name="tests.ATest" tests="3" time="0.069" timestamp="2009-12-19T17:58:59">
  <testcase classname="tests.ATest" name="error" time="0.0060">
    <error type="java.lang.RuntimeException" />
  </testcase>
  <testcase classname="tests.ATest" name="fail" time="0.0020">
    <failure type="junit.framework.AssertionFailedError">junit.framework.AssertionFailedError: 
	at tests.ATest.fail(ATest.java:9)
</failure>
  </testcase>
  <testcase classname="tests.ATest" name="sucess" time="0.0" />
  <system-out><![CDATA[here
]]></system-out>
  <system-err><![CDATA[]]></system-err>
</testsuite>'