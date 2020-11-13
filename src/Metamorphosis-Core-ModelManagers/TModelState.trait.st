Trait {
	#name : #TModelState,
	#instVars : [
		'model',
		'description'
	],
	#category : #'Metamorphosis-Core-ModelManagers'
}

{ #category : #accessing }
TModelState >> description [
	"Returns this model state's description"
	^ description
]

{ #category : #accessing }
TModelState >> description: aModelStateDescription [
	"Sets aModelStateDescription as this model state's description"
	description := aModelStateDescription
]

{ #category : #accessing }
TModelState >> model [
	"Returns this model state's model"
	^ model
]

{ #category : #accessing }
TModelState >> model: aModel [
	"Sets aModel as this model state's model"
	model := aModel
]
