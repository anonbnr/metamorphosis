Trait {
	#name : #TStatefulModelManager,
	#instVars : [
		'stateImplementer',
		'states',
		'currentState'
	],
	#traits : 'TModelManager',
	#category : #'Metamorphosis-Core-ModelManagers'
}

{ #category : #'state management' }
TStatefulModelManager >> addState: aModel describedBy: aModelStateDescription [
	"Adds (aModel, aModelStateDescription) as a new state to the collection of states of this model manager's model"
	states add: (self createState: aModel describedBy: aModelStateDescription)
]

{ #category : #'state management' }
TStatefulModelManager >> createState: aModel describedBy: aModelStateDescription [
	"Creates the (aModel, aModelStateDescription) state"
	^ stateImplementer new
        model: aModel;
        description: aModelStateDescription;
        yourself.
]

{ #category : #accessing }
TStatefulModelManager >> currentState [
	"Returns the current state of the model managed by this stateful manager"
	^ currentState
]

{ #category : #visualization }
TStatefulModelManager >> displayStates [
	"Display the states of the model managed by this stateful model manager"
	states do: [ :state | 
		Transcript show: (state printString); cr.
	]
]

{ #category : #'state management' }
TStatefulModelManager >> getStateDescribedBy: aModelStateDescription [
	"If the model managed by this model manager has a model state described by aModelStateDescription, returns it, otherwise raises an exception"
	| collection |

	collection := states select: [ :state | state description = aModelStateDescription].
	(collection isNotEmpty)
		ifTrue: [ ^ collection at: 1]
		ifFalse: [Error new signal: (aModelStateDescription asString), ' is not a valid state of this model manager''s model' ]
]

{ #category : #testing }
TStatefulModelManager >> hasStateDescription: aModelStateDescription [
	"Returns true if this model manager's model has aModelStateDescription among the descriptions of its states, false otherwise"
	(states isEmpty)
		ifTrue: [ ^ false ]
		ifFalse: [
			^ (states
					select: [ :state | state description = aModelStateDescription ])
					isNotEmpty
		]
]

{ #category : #importing }
TStatefulModelManager >> importAndSaveStateDescribedBy: aModelStateDescription [
	"Imports the model at this manager's model path, then sets the (imported model, aModelStateDescription) state as the current state of this model manager's model, and adds it to its possible states (or updates it if it's already added)"
	self saveState: (self import) describedBy: aModelStateDescription.
	^ model
]

{ #category : #'state management' }
TStatefulModelManager >> loadStateDescribedBy: aModelStateDescription [
	"Loads the state of the model manager's model, as described by aModelStateDescription, if it already exists, as the current state of this model manager's model, otherwise raises an exception"
	(self hasStateDescription: aModelStateDescription)
		ifTrue: [ 
			currentState := (self getStateDescribedBy: aModelStateDescription). 
			model := currentState model 
		]
		ifFalse: [Error new signal: (aModelStateDescription asString), ' is not a valid state of this model manager''s model' ]
]

{ #category : #accessing }
TStatefulModelManager >> model: aModel [
	"Throws an exception, as a model managed by a stateful manager cannot be set directly"
	Error new signal: 'A model managed by a stateful manager cannot be set directly. Consider saving aModel with a model description in a new state instead'
]

{ #category : #exporting }
TStatefulModelManager >> saveAndExportState: aModel describedBy: aModelStateDescription [
	"Sets the (aModel, aModelStateDescription) state as the current state of this model manager's model, and adds it to its possible states (or updates it if it's already added), then exports it to this manager's model path"
	self
		saveState: aModel describedBy: aModelStateDescription;
		export.
]

{ #category : #'state management' }
TStatefulModelManager >> saveState: aModel describedBy: aModelStateDescription [
	"Sets the (aModel, aModelStateDescription) state as the current state of this model manager's model, and adds it to its possible states (or updates it if it's already added)"
	currentState := (self createState: aModel describedBy: aModelStateDescription).
	model := currentState model.
	self updateOrAddState: aModel describedBy: aModelStateDescription
]

{ #category : #accessing }
TStatefulModelManager >> stateImplementer [
	"Returns this stateful manager's model state implementor (i.e. the class using TModelState)"
	^ stateImplementer
]

{ #category : #accessing }
TStatefulModelManager >> stateImplementer: aModelStateImplementer [
	"Sets aModelStateImplemetor as this stateful manager's model state implementor (i.e. the class using TModelState)"
	stateImplementer := aModelStateImplementer
]

{ #category : #accessing }
TStatefulModelManager >> states [
	"Returns the collection of states of the model managed by this stateful model manager"
	^ states
]

{ #category : #'state management' }
TStatefulModelManager >> updateOrAddState: aModel describedBy: aModelStateDescription [
	"If the model managed by this model manager has a model state described by aModelStateDescription, then sets aModel as its new model, otherwise adds it to its possible states"
	(self hasStateDescription: aModelStateDescription)
		ifTrue: [ (self getStateDescribedBy: aModelStateDescription) model: aModel ]
		ifFalse: [ self addState: aModel describedBy: aModelStateDescription ]
]
