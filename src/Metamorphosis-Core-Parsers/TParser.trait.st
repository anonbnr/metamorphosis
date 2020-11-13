Trait {
	#name : #TParser,
	#instVars : [
		'input',
		'output'
	],
	#category : #'Metamorphosis-Core-Parsers'
}

{ #category : #accessing }
TParser >> input [
	"Returns the input of this parser"
]

{ #category : #accessing }
TParser >> input: anObject [
	"Sets anObject as this parser's input"
	input := anObject
]

{ #category : #accessing }
TParser >> output [
	"Returns this parser's output obtained from its parsed input"
	^ output
]

{ #category : #parsing }
TParser >> parse [
	"Parses this parser's input to generate its corresponding parsed output"
	self subclassResponsibility
]
