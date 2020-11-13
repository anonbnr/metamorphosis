Trait {
	#name : #TModularTransformer,
	#instVars : [
		'modules',
		'activeModule'
	],
	#traits : 'TTransformer',
	#classTraits : 'TTransformer classTrait',
	#category : #'Metamorphosis-Core-Transformers'
}

{ #category : #'modules - accessing' }
TModularTransformer >> activeModule [
	"Returns this modular transformer's active module"
	self identifyModuleToActivate.
	^ activeModule
]

{ #category : #'modules - adding' }
TModularTransformer >> addModule: aTransformerClass [
	"Adds aTransformerClass to this modular transformer's collection of modules"
	(modules includesKey: aTransformerClass name)
		ifFalse: [ modules at: (aTransformerClass name) put: aTransformerClass]
]

{ #category : #'modules - adding' }
TModularTransformer >> addModules: aTransformerClassCollection [
	"Adds the transformers in aTransformerClassCollection to this modular transformer's collection of modules"
	aTransformerClassCollection do: [ :module | self addModule: module ]
]

{ #category : #'modules - configuration' }
TModularTransformer >> configureActiveModuleModel [
	"Configures the model of this modular transformer's active module"
	(activeModule modelManager class allTraits includes: TStatefulModelManager)
		ifTrue: [ activeModule modelManager saveState: (self model) describedBy: (modelManager currentState description) ]
    	ifFalse: [ activeModule modelManager model: (self model) ]
]

{ #category : #'modules - configuration' }
TModularTransformer >> configureActiveModulePaths [
	"Configures the origin and model paths of this modular transformer's active module"
	activeModule
		originsRootFolder: self originsRootFolder;
    	originName: self originName;
    	modelsRootFolder: self modelsRootFolder;
    	modelName: self modelName.
]

{ #category : #'modules - deactivation' }
TModularTransformer >> deactivateActiveModule [
	"Deactivates this modular transformer's active module"
	activeModule := nil.
]

{ #category : #execution }
TModularTransformer >> execute [
	"Executes this model transformer's strategy over its model manager's model, using its active module"
	self
		identifyModuleToActivate;
    	configureActiveModulePaths;
    	configureActiveModuleModel.

	activeModule execute.

	self
		synchronizeStrategies;
    	synchronizeModelManagerTools;
    	synchronizeModelManagerStates;
    	deactivateActiveModule.
]

{ #category : #exporting }
TModularTransformer >> exportTargetWithModelName: aModelName [
	"Exports the target model of this model transformer, and names it aModelName, using its active module"
	self 
		identifyModuleToActivate;
    	configureActiveModulePaths;
    	configureActiveModuleModel.

	activeModule exportTargetWithModelName: aModelName.

	self 
		synchronizeModelManagerTools;
    	deactivateActiveModule.
]

{ #category : #'modules - identification' }
TModularTransformer >> identifyModuleToActivate [
	"Identifies this modular transformer's active module using its model to identify its context"
	self subclassResponsibility
]

{ #category : #importing }
TModularTransformer >> importOriginWithModelName: aModelName [
	"Imports the model of this model transformer's origin, and names it aModelName, using its active module"
	self 
		identifyModuleToActivate;
    	configureActiveModulePaths.
    
	activeModule importOriginWithModelName: aModelName.
  
	self 
		synchronizeModelManagerTools;
    	synchronizeModelManagerStates;
    	deactivateActiveModule.

	^ self model
]

{ #category : #importing }
TModularTransformer >> importOriginWithModelName: aModelName withModelStateDescription: aModelStateDescription [
	"Imports the model of this model transformer's origin, and names it aModelName, while providing aModelStateDescription as a description of its state, using its active module."
	self 
		identifyModuleToActivate;
    	configureActiveModulePaths.
    
	activeModule importOriginWithModelName: aModelName withModelStateDescription: aModelStateDescription.
  
  	self 
    	synchronizeModelManagerTools;
    	synchronizeModelManagerStates;
    	deactivateActiveModule.

	^ self model
]

{ #category : #initialization }
TModularTransformer >> initialize [
	modules := Dictionary new
]

{ #category : #'state management' }
TModularTransformer >> loadStateDescribedBy: aModelStateDescription [
	"Wrapper method of this model transformer's model manager's loadStateDescribedBy: method. It requires synchronization of the active module tools to properly manipulate the loaded state's model"
	modelManager loadStateDescribedBy: aModelStateDescription.

	self 
		identifyModuleToActivate;
    	synchronizeModelManagerTools;
    	deactivateActiveModule.
]

{ #category : #'modules - accessing' }
TModularTransformer >> modules [
	"Returns this modular transformer's collection of modules"
	^ modules
]

{ #category : #'modules - accessing' }
TModularTransformer >> modules: aTransformerCollection [
	"Sets aTransformerCollection as this modular transformer's collection of modules"
	modules := aTransformerCollection
]

{ #category : #exporting }
TModularTransformer >> saveAndExportTarget: aModel withModelName: aModelName withModelStateDescription: aModelStateDescription [
	"Saves the (aModel, aModelStateDescription) state in this model transformer's model manager's managed model states, names it aModelName, then exports it into this transformer's configured model path, using its active module."
	self 
		saveState: aModel describedBy: aModelStateDescription;
    	exportTargetWithModelName: aModelName.
]

{ #category : #'modules - synchronization' }
TModularTransformer >> synchronizeExporters [
	"Synchronizes the exporter of this modular transformer with that of its active module"
	modelManager exporter: activeModule modelManager exporter
]

{ #category : #'modules - synchronization' }
TModularTransformer >> synchronizeImporters [
	"Synchronizes the importer of this modular transformer with that of its active module"
	modelManager importer: activeModule modelManager importer
]

{ #category : #'modules - synchronization' }
TModularTransformer >> synchronizeModelManagerStates [
	"Synchronizes the states of this modular transformer's model with those of its active module's model"
	activeModule modelManager states
		do: [ :s | modelManager saveState: s model describedBy: s description ]
]

{ #category : #'modules - synchronization' }
TModularTransformer >> synchronizeModelManagerTools [
	"Synchronizes the importer, exporter, and visualizer of this modular transformer with those of its active module"
	self 
		synchronizeImporters;
		synchronizeExporters;
		synchronizeVisualizers.
]

{ #category : #'modules - synchronization' }
TModularTransformer >> synchronizeStrategies [
	"Synchronizes the strategy of this modular transformer with that of its active mdoule"
	self subclassResponsibility
]

{ #category : #'modules - synchronization' }
TModularTransformer >> synchronizeVisualizers [
	"Synchronizes the visualizer of this modular transformer with that of its active module"
	modelManager visualizer: activeModule modelManager visualizer
]

{ #category : #visualization }
TModularTransformer >> visualize [
	"Wrapper method of this model transformer's model manager's visualize method. It requires first to have the model manager synchronized with that of its corresponding active module, to use the proper visualizer"
	self 
		identifyModuleToActivate;
    	synchronizeModelManagerTools;
    	deactivateActiveModule.

	modelManager visualize.
]
