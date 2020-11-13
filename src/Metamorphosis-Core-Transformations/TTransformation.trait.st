Trait {
	#name : #TTransformation,
	#instVars : [
		'source',
		'target'
	],
	#category : #'Metamorphosis-Core-Transformations'
}

{ #category : #'target resize' }
TTransformation >> apply: aModelElement [
	"Executes all the pre-processing, processing, and post-processing operations of this transformation"
	self 
		source: aModelElement;
		preTransform: aModelElement.
	target := self transform: aModelElement.
	self postTransform: aModelElement.
		
	^ target.
]

{ #category : #'transformation - postprocessing' }
TTransformation >> postTransform: aModelElement [
	"Does some post transformation processing such as clean up the residues of this source transformation (e.g. removing some elements from the model after the transformation), or possibly export the obtained model to verify the results of the transformation, or etc."
	self subclassResponsibility
]

{ #category : #'transformation - preprocessing' }
TTransformation >> preTransform: aModelElement [
	"Does some source pre-transformation processing to prepare this transformation's state and environment for the actual source transformation into target"
	self subclassResponsibility
]

{ #category : #accessing }
TTransformation >> source [
	"Returns the source of this transformation"
	^ source
]

{ #category : #accessing }
TTransformation >> source: aModelElement [
	"Sets aModelElement as this transformation's source"
	source := aModelElement
]

{ #category : #accessing }
TTransformation >> target [
	"Returns this transformation's target"
	^ target
]

{ #category : #'transformation - processing' }
TTransformation >> transform: aModelElement [
	"Transforms this transformation's source into its target"
	self subclassResponsibility
]
