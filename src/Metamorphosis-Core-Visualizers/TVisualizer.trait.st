Trait {
	#name : #TVisualizer,
	#instVars : [
		'model'
	],
	#category : #'Metamorphosis-Core-Visualizers'
}

{ #category : #accessing }
TVisualizer >> model [
	"Returns this visualizer's model"
	^ model
]

{ #category : #accessing }
TVisualizer >> model: aModel [
	"Sets aModel as this visualizer's model"
	model := aModel
]

{ #category : #visualization }
TVisualizer >> visualize [
	"Visualizes this visualizer's model elements"
	self subclassResponsibility
]
