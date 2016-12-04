private
textUntilEnd
	| tagName string |
	"Consumes until the first end of the current tag. It ignores nesting"
	tagName := parser current localName.
	[ parser next isEndTagNamed: tagName ] whileFalse: [
		(parser current isText) ifTrue: [
			string := parser current string]].
	^string