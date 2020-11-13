Trait {
	#name : #TModelManager,
	#instVars : [
		'originsRootFolder',
		'originName',
		'modelsRootFolder',
		'modelName',
		'model',
		'importer',
		'exporter',
		'visualizer'
	],
	#category : #'Metamorphosis-Core-ModelManagers'
}

{ #category : #exporting }
TModelManager >> export [
	"Exports the model managed by this model manager using its model exporter"
	exporter
		modelsRootFolder: modelsRootFolder;
		modelName: modelName;
		model: model;
		export.
]

{ #category : #exporting }
TModelManager >> exporter [
	"Returns the model exporter used by this model manager"
	^ exporter
]

{ #category : #exporting }
TModelManager >> exporter: aModelExporter [
	"Sets aModelExporter as the model exporter used by this model manager"
	exporter := aModelExporter
]

{ #category : #importing }
TModelManager >> import [
	"Imports the model of this model manager's origin using its model importer"
	importer
		originsRootFolder: originsRootFolder;
		originName: originName;
		modelsRootFolder: modelsRootFolder;
		modelName: modelName.
	
	(self modelPath asFileReference exists)
		ifFalse: [ importer generate ].
	
	model := importer import.
	^ model
]

{ #category : #importing }
TModelManager >> importer [
	"Returns the model importer used by this model manager"
	^ importer
]

{ #category : #importing }
TModelManager >> importer: aModelImporter [
	"Sets aModelImporter as the model importer used by this model manager"
	importer := aModelImporter
]

{ #category : #accessing }
TModelManager >> model [
	"Returns the model managed by this model manager"
	^ model
]

{ #category : #accessing }
TModelManager >> model: aModel [
	"Sets aModel as the model managed by this model manager"
	model := aModel
]

{ #category : #configuration }
TModelManager >> modelName [
	"Returns the name of this model manager's model"
	^ modelName
]

{ #category : #configuration }
TModelManager >> modelName: aString [
	"Sets aString as the name of this model manager's model"
	modelName := aString
]

{ #category : #configuration }
TModelManager >> modelPath [
	"Returns the path of this model manager's model"
	^ modelsRootFolder, modelName
]

{ #category : #configuration }
TModelManager >> modelsRootFolder [
	"Returns the path of the root folder used to store this model manager's imported/exported models"
	^ modelsRootFolder
]

{ #category : #configuration }
TModelManager >> modelsRootFolder: aPathString [
	"Sets aPathString as the path of the root folder used to store this model manager's imported/exported models
	e.g. mse/"
	modelsRootFolder := aPathString
]

{ #category : #configuration }
TModelManager >> originName [
	"Returns the name of the origin whose model will be generated/imported by this model manager's model importer"
	^ originName
]

{ #category : #configuration }
TModelManager >> originName: aString [
	"Sets aString as the name of the origin whose model will be generated/imported by this model manager's model importer"
	originName := aString
]

{ #category : #configuration }
TModelManager >> originPath [
	"Returns the path of this model manager's origin"
	^ originsRootFolder, originName
]

{ #category : #configuration }
TModelManager >> originsRootFolder [
	"Returns the path of the root folder used to store this model manager's origins"
	^ originsRootFolder
]

{ #category : #configuration }
TModelManager >> originsRootFolder: aPathString [
	"Sets aPathString as the path of the root folder used to store this model manager's origins
	e.g. src/"
	originsRootFolder := aPathString
]

{ #category : #visualization }
TModelManager >> visualize [
	"Visualizes this model manager's model by using its model visualizer"
	visualizer 
		model: model;
		visualize.
]

{ #category : #visualization }
TModelManager >> visualizer [
	"Returns the model visualizer used by this model manager"
	^ visualizer
]

{ #category : #visualization }
TModelManager >> visualizer: aModelVisualizer [
	"Sets aModelVisualizer as the model visualizer used by this model manager"
	visualizer := aModelVisualizer
]
