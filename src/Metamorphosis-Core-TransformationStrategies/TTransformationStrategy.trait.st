Trait {
	#name : #TTransformationStrategy,
	#instVars : [
		'transformations'
	],
	#category : #'Metamorphosis-Core-TransformationStrategies'
}

{ #category : #adding }
TTransformationStrategy >> addTransformation: aTransformationClass [
	"Adds aTransformationClass's representation into this transformation strategy's collection of transformations"
	self subclassResponsibility
]

{ #category : #adding }
TTransformationStrategy >> addTransformations: aTransformationClassCollection [
	"Adds the representations of the transformation classes in aTransformationClassCollection into this transformation strategy's collection of transformations"
	aTransformationClassCollection do: [ :each | 
		self addTransformation: each	
	]
]

{ #category : #testing }
TTransformationStrategy >> hasTransformation: aTransformationClass [
	"Returns true if this transformation strategy contains a representation for aTransformationClass, false otherwise"
	self subclassResponsibility
]

{ #category : #accessing }
TTransformationStrategy >> transformations [
	"Returns this strategy's transformations"
	^ transformations
]

{ #category : #accessing }
TTransformationStrategy >> transformations: aTTransformationClassesCollection [
	"Sets aTTransformationClassesCollection as this strategy's collection of transformations"
	transformations := aTTransformationClassesCollection
]
