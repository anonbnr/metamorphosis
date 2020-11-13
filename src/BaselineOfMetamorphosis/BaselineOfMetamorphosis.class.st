Class {
	#name : #BaselineOfMetamorphosis,
	#superclass : #BaselineOf,
	#category : #BaselineOfMetamorphosis
}

{ #category : #baselines }
BaselineOfMetamorphosis >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ self defineDependencies: spec.
			self definePackages: spec.
			self defineGroups: spec ]
]

{ #category : #baselines }
BaselineOfMetamorphosis >> defineDependencies: spec [
	"No external dependencies"
]

{ #category : #baselines }
BaselineOfMetamorphosis >> defineGroups: spec [
	"No groups"
]

{ #category : #baselines }
BaselineOfMetamorphosis >> definePackages: spec [
	"Defines the packages of Metamorphosis and their interdependencies"
	spec
		package: 'Metamorphosis-Core-Parsers';
		package: 'Metamorphosis-Core-Importers'
			with: [ spec requires: #('Metamorphosis-Core-Parsers') ];
		package: 'Metamorphosis-Core-Exporters';
		package: 'Metamorphosis-Core-Visualizers';
		package: 'Metamorphosis-Core-ModelManagers'
			with: [ spec requires: #('Metamorphosis-Core-Importers' 'Metamorphosis-Core-Exporters' 'Metamorphosis-Core-Visualizers') ];
		package: 'Metamorphosis-Core-Transformations';
		package: 'Metamorphosis-Core-TransformationStrategies'
			with: [ spec requires: #('Metamorphosis-Core-Transformations') ];
		package: 'Metamorphosis-Core-Transformers'
			with: [ spec requires: #('Metamorphosis-Core-ModelManagers' 'Metamorphosis-Core-TransformationStrategies') ].
]
