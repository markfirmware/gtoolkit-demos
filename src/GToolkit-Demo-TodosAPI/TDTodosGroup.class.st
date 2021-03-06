Class {
	#name : #TDTodosGroup,
	#superclass : #TDModel,
	#instVars : [
		'todos'
	],
	#category : #'GToolkit-Demo-TodosAPI-Core'
}

{ #category : #accessing }
TDTodosGroup >> gtTodosListFor: aView [
	<gtView>
	self todos ifEmpty: [^ aView empty].
	^ aView explicit
		title: 'Todos' translated;
		priority: 5;
		stencil: [
			| mainContainer scrollableContainer topEditorElement iconContainer tileContainer topTile bottomTile labelLook userButton |
			mainContainer := BlScrollableElement new
				constraintsDo: [ :c |
					c horizontal matchParent.
					c vertical matchParent ].
			scrollableContainer := BlElement new
				layout: BlLinearLayout vertical;
				padding: (BlInsets all: 5);
				constraintsDo: [ :c |
					c horizontal matchParent.
					c vertical fitContent ].
			self todos do: [ :each |			
				tileContainer := BlElement new
					layout: BlLinearLayout vertical;
					constraintsDo: [:c |
						c linear horizontal alignCenter.
						c vertical fitContent ];
					background: Color white;
					aptitude: BrShadowAptitude;
					padding: (BlInsets all: 5);
					margin: (BlInsets all: 5);
					width: 300.
				topTile := BlElement new
					layout: BlLinearLayout horizontal;
					constraintsDo: [:c |
						c horizontal matchParent.
						c vertical fitContent ].
				bottomTile := BlElement new
					layout: BlLinearLayout vertical;
					constraintsDo: [:c |
						c horizontal matchParent.
						c vertical fitContent ].
				iconContainer := BrButton new
					border: (BlBorder paint: Color black width: 1);
					margin: (BlInsets top: 10 right: 10 bottom: 0 left: 10);
					size: 16@16.
				(each completed) 
					ifTrue: [ 
						iconContainer icon: BrGlamorousVectorIcons accept.
						iconContainer aptitude: BrGlamorousButtonIconAptitude ].	
				topEditorElement := BrEditor new
					aptitude: (BrGlamorousRegularEditorAptitude new fontSize: 18);
					constraintsDo: [:c |
						c linear horizontal alignCenter ];
					margin: (BlInsets top: 0 right: 5 bottom: 0 left: 5);
					vFitContent;
					hMatchParent;
					beReadOnlyWithoutSelection;
					text: each title.
				topEditorElement
					when: BlClickEvent
					do: [:e | topEditorElement phlow spawnObject: each].
				labelLook := BrTextLabelAptitude new
					glamorousRegularFont;
					fontSize: 14;
					foreground: Color gray.
				userButton := BrButton new
					margin: (BlInsets top: 0 right: 5 bottom: 5 left: 47);
					label: 'User ', each userId asString;
					aptitude: (BrGlamorousLinkSquaredButtonWithLabelAptitude new fontSize: 12);
					action: [ :aButton |
						aButton phlow spawnObject: (each user)].

				topTile
					addChild: iconContainer;
					addChild: topEditorElement.
				bottomTile addChild: userButton.
				tileContainer 
					addChild: topTile;
					addChild: bottomTile.
				scrollableContainer addChild: tileContainer ].
			mainContainer addChild: scrollableContainer.
			mainContainer ].
]

{ #category : #accessing }
TDTodosGroup >> todos [
	^ todos ifNil: [OrderedCollection new].
]

{ #category : #accessing }
TDTodosGroup >> todos: aList [
	todos := aList.
]
