Trait {
	#name : #TExporter,
	#instVars : [
		'modelsRootFolder',
		'modelName',
		'model'
	],
	#category : #'Metamorphosis-Core-Exporters'
}

{ #category : #samples }
TExporter >> export [
	"Exports this model's exporter model into its configured model path"
	self subclassResponsibility
]

{ #category : #accessing }
TExporter >> model [
	"Returns this model exporter's model"
	^ model
]

{ #category : #accessing }
TExporter >> model: aModel [
	"Sets aModel as this model exporter's model"
	model := aModel
]

{ #category : #accessing }
TExporter >> modelName [
	"Returns the name of the model exported by this model exporter"
	^ modelName
]

{ #category : #accessing }
TExporter >> modelName: aString [
	"Sets aString as the name of the model exported by this model exporter"
	modelName := aString
]

{ #category : #configuration }
TExporter >> modelPath [
	"Returns the path of this model exporter's exported model"
	^ modelsRootFolder, modelName
]

{ #category : #accessing }
TExporter >> modelsRootFolder [
	"Returns the path of the root folder used to store this model exporter's exported models"
	^ modelsRootFolder
]

{ #category : #accessing }
TExporter >> modelsRootFolder: aPathString [
	"Sets aPathString as the path of the root folder used to store this model exporter's exported models"
	modelsRootFolder := aPathString
]
