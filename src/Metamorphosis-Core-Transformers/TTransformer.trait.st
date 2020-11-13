Trait {
	#name : #TTransformer,
	#instVars : [
		'strategy',
		'modelManager'
	],
	#category : #'Metamorphosis-Core-Transformers'
}

{ #category : #execution }
TTransformer >> execute [
	"Executes this model transformer's strategy over its model manager's model"
	self subclassResponsibility
]

{ #category : #exporting }
TTransformer >> exportTarget [
	"Exports the target model of this model transformer, and names it similarly to its origin"
	^ self exportTargetWithModelName: self originName.
]

{ #category : #exporting }
TTransformer >> exportTargetWithModelName: aModelName [
	"Exports the target model of this model transformer, and names it aModelName"
	modelManager
		modelName: aModelName;
		export.
]

{ #category : #importing }
TTransformer >> importOrigin [
	"Imports the model of this model transformer's origin, and names it similarly to its origin"
	^ self importOriginWithModelName: (self originName, '.mse').
]

{ #category : #importing }
TTransformer >> importOriginWithModelName: aModelName [
	"Imports the model of this model transformer's origin, and names it aModelName"
	^ modelManager
		modelName: aModelName;
		import.
]

{ #category : #importing }
TTransformer >> importOriginWithModelName: aModelName withModelStateDescription: aModelStateDescription [
	"Imports the model of this model transformer's origin, and names it aModelName, while providing aModelStateDescription as a description of its state.
	Note: can only be used with stateful model managers"
	^ modelManager
		modelName: aModelName;
		importAndSaveStateDescribedBy: aModelStateDescription.
]

{ #category : #importing }
TTransformer >> importOriginWithModelStateDescription: aModelStateDescription [
	"Imports the model of this model transformer's origin, and names it similarly to its origin, while providing aModelStateDescription as a description of its state.
	Note: can only be used with stateful model managers"
	^ self importOriginWithModelName: (self originName, '.mse') withModelStateDescription: aModelStateDescription
]

{ #category : #'state management' }
TTransformer >> loadStateDescribedBy: aModelStateDescription [
	"Wrapper method of this model transformer's model manager's loadStateDescribedBy: method
	Note: can only be used with stateful model managers"
	modelManager loadStateDescribedBy: aModelStateDescription
]

{ #category : #accessing }
TTransformer >> model [
	"Wrapper method of this model transformer's model manager's model method"
	^ modelManager model
]

{ #category : #accessing }
TTransformer >> modelManager [
	"Returns the model manager used by this model transformer"
	^ modelManager
]

{ #category : #accessing }
TTransformer >> modelManager: aModelManager [
	"Sets aModelManager as the model manager used by this model transformer"
	modelManager := aModelManager
]

{ #category : #configuration }
TTransformer >> modelName [
	"Returns the name of the model obtained so far by this model transformer"
	^ modelManager modelName
]

{ #category : #configuration }
TTransformer >> modelName: aString [
	"Sets aString as the name of the model obtaineds so far by this model transformer"
	modelManager modelName: aString
]

{ #category : #configuration }
TTransformer >> modelsRootFolder [
	"Returns the path of the root folder used to store this model transformer's models"
	^ modelManager modelsRootFolder.
]

{ #category : #configuration }
TTransformer >> modelsRootFolder: aPathString [
	"Sets aPathString as the path of the root folder used to store this model transformer's models"
	modelManager modelsRootFolder: aPathString
]

{ #category : #configuration }
TTransformer >> originName [
	"Returns the name of the origin whose model will be transformed by this model transformer"
	^ modelManager originName
]

{ #category : #configuration }
TTransformer >> originName: aString [
	"Sets aString as the name of the origin whose model will be transformed by this model transformer"
	modelManager originName: aString
]

{ #category : #configuration }
TTransformer >> originPath [
	"Returns the path of this model transformer's origin"
	^ modelManager originPath
]

{ #category : #configuration }
TTransformer >> originsRootFolder [
	"Returns the path of the root folder used to store this model transformer's origins"
	^ modelManager originsRootFolder
]

{ #category : #configuration }
TTransformer >> originsRootFolder: aPathString [
	"Sets aPathString as the path of the root folder used to store this model transformer's origins"
	modelManager originsRootFolder: aPathString
]

{ #category : #exporting }
TTransformer >> saveAndExportTarget: aModel withModelName: aModelName withModelStateDescription: aModelStateDescription [
	"Saves the (aModel, aModelStateDescription) state in this model transformer's model manager's managed model states, names it aModelName, then exports it into this transformer's configured model path.
	Note: can only be used with stateful model managers"
	modelManager
		modelName: aModelName;
		saveAndExportState: aModel describedBy: aModelStateDescription
]

{ #category : #exporting }
TTransformer >> saveAndExportTarget: aModel withModelStateDescription: aModelStateDescription [
	"Same as saveAndExportTarget: withModelName: withModelStateDescription: but names the exported model similarly to its origin"
	^ self saveAndExportTarget: aModel withModelName: (self originName) withModelStateDescription: aModelStateDescription
]

{ #category : #'state management' }
TTransformer >> saveState: aModel describedBy: aModelStateDescription [
	"Wrapper method of this model transformer's model manager's saveState: describedBy: method
	Note: can only be used with stateful model managers"
	modelManager saveState: aModel describedBy: aModelStateDescription
]

{ #category : #accessing }
TTransformer >> strategy [
	"Returns this transformer's transformation strategy"
	^ strategy
]

{ #category : #accessing }
TTransformer >> strategy: aTransformationStrategy [
	"Sets aTransformationStrategy as this transformer's transformation strategy"
	strategy := aTransformationStrategy
]

{ #category : #visualization }
TTransformer >> visualize [
	"Wrapper method of this model transformer's model manager's visualize method"
	modelManager visualize.
]
