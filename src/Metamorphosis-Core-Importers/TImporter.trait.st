Trait {
	#name : #TImporter,
	#instVars : [
		'originsRootFolder',
		'dependenciesFolder',
		'originName',
		'modelsRootFolder',
		'modelName',
		'model',
		'parser'
	],
	#category : #'Metamorphosis-Core-Importers'
}

{ #category : #accessing }
TImporter >> dependenciesFolder [
	^ dependenciesFolder
]

{ #category : #accessing }
TImporter >> dependenciesFolder: aDependenciesFolder [
	dependenciesFolder := aDependenciesFolder
]

{ #category : #generating }
TImporter >> generate [
	"Generates this model importer's model from its origin into its configured model path, using its parser"
	self subclassResponsibility
]

{ #category : #importing }
TImporter >> import [
	"Imports this model importer's model from its configured model path"
	self subclassResponsibility
]

{ #category : #accessing }
TImporter >> model [
	"[Generates then] imports the model of this model importer's origin, possibly after having parsed its origin with its parser"
	model := self modelPath asFileReference exists
		ifTrue: [ self import]
		ifFalse: [ self generate; import].

	^ model
]

{ #category : #configuration }
TImporter >> modelName [
	"Returns the name of the model imported by this model importer"
	^ modelName
]

{ #category : #configuration }
TImporter >> modelName: aString [
	"Sets aString as the name of the model imported by this model importer"
	modelName := aString
]

{ #category : #configuration }
TImporter >> modelPath [
	"Returns the path of this model importer's imported model"
	^ modelsRootFolder, modelName
]

{ #category : #configuration }
TImporter >> modelsRootFolder [
	"Returns the path of the root folder used to store this model importer's imported/generated models"
	^ modelsRootFolder
]

{ #category : #configuration }
TImporter >> modelsRootFolder: aPathString [
	"Sets aPathString as the path of the root folder used to store this model importer's imported/generated models"
	modelsRootFolder := aPathString
]

{ #category : #configuration }
TImporter >> originName [
	"Returns the name of the origin whose model will be generated/imported by this model importer"
	^ originName
]

{ #category : #configuration }
TImporter >> originName: aString [
	"Sets aString as the name of the origin whose model will be generated/imported by this model importer"
	originName := aString
]

{ #category : #configuration }
TImporter >> originPath [
	"Returns the path of this model importer's origin"
	^ originsRootFolder, originName
]

{ #category : #configuration }
TImporter >> originsRootFolder [
	"Returns the path of the root folder used to store this model importer's origins"
	^ originsRootFolder
]

{ #category : #configuration }
TImporter >> originsRootFolder: aPathString [
	"Sets aPathString as the path of the root folder used to store this model importer's origins"
	originsRootFolder := aPathString
]

{ #category : #accessing }
TImporter >> parser [
	"Returns the parser used by this model importer"
	^ parser
]

{ #category : #accessing }
TImporter >> parser: aParser [
	"Sets aParser as the parser used by this model importer"
	parser := aParser
]
