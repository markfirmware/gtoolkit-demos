Class {
	#name : #GtWorkingWithAPlaceholderRestApi,
	#superclass : #Object,
	#category : #'GToolkit-Demo-TodosAPI-Presentation'
}

{ #category : #slides }
GtWorkingWithAPlaceholderRestApi >> albumsExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 21;
		newFadedText: 'Below you can inspect the result of a request for the album with id 4.';
		element: [ GtPlaygroundLiveSlide new
			snippets: {'TDClient new getAlbumWithId: 4.'};
			inspectSnippetAt: 1 ].
]

{ #category : #slides }
GtWorkingWithAPlaceholderRestApi >> albumsExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 20;
		newTextWithFormat: ('Albums' asRopedText bold; fontSize: 18);
		newTextWithFormat: self albumsSlideText;
		element: [ BlElement new
			background: Color white;
			aptitude: BrShadowAptitude;
			margin: (BlInsets right: 5);
			addChild: (GtPharoBehaviorCoder forClass: TDAlbum) asElement ].
]

{ #category : #accessing }
GtWorkingWithAPlaceholderRestApi >> albumsSlideText [
	^ 'An album is just a collection of photos. It has a title, an id, the list of photos composing the album and id of the user who created the album.' asRopedText
		glamorousRegularFont;
		fontSize: 18.
]

{ #category : #accessing }
GtWorkingWithAPlaceholderRestApi >> apiExamples [
	<gtExample>
	| firstExampleContainer secondExampleContainer thirdExampleContainer |
	
	firstExampleContainer := BlElement new
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c |
			c vertical matchParent.
			c horizontal matchParent];
		margin: (BlInsets all: 5);
		addChild: (BrButton new
			margin: (BlInsets all: 5);
			aptitude: (BrGlamorousLinkSquaredButtonWithLabelAptitude new fontSize: 16) + (BrGlamorousWithLabelTooltipAptitude new text: 'https://jsonplaceholder.typicode.com/todos');
			label: 'https://jsonplaceholder.typicode.com/todos';
			action: [ :aButton | WebBrowser openOn: 'https://jsonplaceholder.typicode.com/todos']);
		addChild: (BlElement new
			constraintsDo: [ :c |
				c vertical matchParent.
				c horizontal matchParent];
			margin: (BlInsets all: 5);
			aptitude: BrShadowAptitude;
			background: Color white;
			addChild: ((TDExamples new requestAllTodosRawExample gtJsonFor: GtPhlowView empty) asElementDo: [ :e | e ])).
	
	secondExampleContainer := BlElement new
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c |
			c vertical matchParent.
			c horizontal matchParent];
		margin: (BlInsets all: 5);
		addChild: (BrButton new
			margin: (BlInsets all: 5);
			aptitude: (BrGlamorousLinkSquaredButtonWithLabelAptitude new fontSize: 16) + (BrGlamorousWithLabelTooltipAptitude new text: 'https://jsonplaceholder.typicode.com/posts?userId=4');
			label: 'https://jsonplaceholder.typicode.com/posts?userId=4';
			action: [ :aButton | WebBrowser openOn: 'https://jsonplaceholder.typicode.com/posts?userId=4']);
		addChild: (BlElement new
			constraintsDo: [ :c |
				c vertical matchParent.
				c horizontal matchParent];
			margin: (BlInsets all: 5);
			aptitude: BrShadowAptitude;
			background: Color white;
			addChild: ((TDExamples new requestPostsForUserWithIdFourRawExample gtJsonFor: GtPhlowView empty) asElementDo: [ :e | e ])).
	
	thirdExampleContainer := BlElement new
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c |
			c vertical matchParent.
			c horizontal matchParent];
		margin: (BlInsets all: 5);
		addChild: (BrButton new
			margin: (BlInsets all: 5);
			aptitude: (BrGlamorousLinkSquaredButtonWithLabelAptitude new fontSize: 16) + (BrGlamorousWithLabelTooltipAptitude new text: 'https://jsonplaceholder.typicode.com/todos/8');
			label: 'https://jsonplaceholder.typicode.com/todos/8';
			action: [ :aButton | WebBrowser openOn: 'https://jsonplaceholder.typicode.com/todos/8']);
		addChild: (BlElement new
			constraintsDo: [ :c |
				c vertical matchParent.
				c horizontal matchParent];
			margin: (BlInsets all: 5);
			aptitude: BrShadowAptitude;
			background: Color white;
			addChild: ((TDExamples new requestTodoWithIdEightRawExample gtJsonFor: GtPhlowView empty) asElementDo: [ :e | e ])).
	
	^ BlElement new
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c |
			c vertical matchParent.
			c horizontal matchParent];
		margin: (BlInsets all: 5);
		addChildren: { firstExampleContainer. secondExampleContainer. thirdExampleContainer }.
]

{ #category : #slides }
GtWorkingWithAPlaceholderRestApi >> apiExamplesSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 6;
		newFadedText: (self apiExplanationText);
		element: [ self apiExamples ]
]

{ #category : #accessing }
GtWorkingWithAPlaceholderRestApi >> apiExplanationText [
	^ 'Below we see examples of the JSON responses for various requests to the API.' asRopedText
		glamorousRegularFont;
		fontSize: 16.
]

{ #category : #slides }
GtWorkingWithAPlaceholderRestApi >> clientExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 8;
		newTextWithFormat: ('The Client' asRopedText bold; fontSize: 18);
		newTextWithFormat: self clientSlideText;
		element: [ BlElement new
			background: Color white;
			aptitude: BrShadowAptitude;
			margin: (BlInsets right: 5);
			addChild: (GtPharoBehaviorCoder forClass: TDClient) asElement ].
]

{ #category : #accessing }
GtWorkingWithAPlaceholderRestApi >> clientSlideText [
	^ 'The client is the main component in this model. Using it we can make different requests to the API. The responses from the API, in the form of JSON files, are then parsed and stored inside corresponding objects so we can better visualize them.' asRopedText
	glamorousRegularFont;
	fontSize: 18.
]

{ #category : #slides }
GtWorkingWithAPlaceholderRestApi >> commentsExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 19;
		newFadedText: 'Requesting a comment will return you that comment with everything you need to know about it.';
		element: [ GtPlaygroundLiveSlide new
			snippets: {'TDClient new getCommentWithId: 5.'};
			inspectSnippetAt: 1 ].
]

{ #category : #slides }
GtWorkingWithAPlaceholderRestApi >> commentsExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 18;
		newTextWithFormat: ('Comments' asRopedText bold; fontSize: 18);
		newTextWithFormat: self commentsSlideText;
		element: [ BlElement new
			background: Color white;
			aptitude: BrShadowAptitude;
			margin: (BlInsets right: 5);
			addChild: (GtPharoBehaviorCoder forClass: TDComment) asElement ].
]

{ #category : #accessing }
GtWorkingWithAPlaceholderRestApi >> commentsSlideText [
	^ 'A comment is a message left by a user to a post. It can be identified by an id and it stores the text of that comment, the id of the post it was left on and the name and email of the user that left it.' asRopedText
	glamorousRegularFont;
	fontSize: 18.
]

{ #category : #accessing }
GtWorkingWithAPlaceholderRestApi >> coreSlideText [
	^ 'To store the information we create a structure of classes where each class will represent a type of information that can be requested from the API. At the same time, each class has its default variant for usual cases and its null variant for instances where the requested information is not found.' asRopedText
	glamorousRegularFont;
	fontSize: 18.
]

{ #category : #slides }
GtWorkingWithAPlaceholderRestApi >> dataStructuresExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 11;
		newTextWithFormat: ('Data Structures' asRopedText bold; fontSize: 18);
		newTextWithFormat: self coreSlideText;
		element: [ BlElement new
			background: Color white;
			aptitude: BrShadowAptitude;
			margin: (BlInsets right: 5);
			addChild: (GtPharoPackageTagCoder forPackageTag: ((GtPharoBehaviorCoder forClass: TDUser) packageTag)) asElement ].
]

{ #category : #accessing }
GtWorkingWithAPlaceholderRestApi >> getAllTodosMethodCoderWithExplanationTargets [
	<gtExample>
	| coder coderViewModel selectors literals variables |

	selectors := GtSelectorExplanationLinkStyler new.
	selectors addSelectors: #(#'requestForUrl:ifSuccessDo:ifErrorDo:' #'rawData:').
	variables := GtVariableExplanationLinkStyler new.
	variables addVariables: #(dictionaries dict TDTodo TDTodosGroup).
	literals := GtLiteralExplanationLinkStyler new.
	literals addLiteral: 'https://jsonplaceholder.typicode.com/todos' withIdentifier: #url.

	coder := GtPharoMethodCoder forMethod: TDClient>>#getAllTodos.
	coderViewModel := coder asCoderViewModel.
	coderViewModel addStylers: { selectors . variables . literals }.

	^ coderViewModel asElement
]

{ #category : #accessing }
GtWorkingWithAPlaceholderRestApi >> getAllTodosMethodExplanation [
	<gtExample>
	| aScripter |
	
	aScripter := BlDevScripter new.
	aScripter
		substep: 'Add Coder Element'
		do: [ :aStep | 
			aStep set
				label: 'Coder';
				element: [ self getAllTodosMethodCoderWithExplanationTargets ] ].
	aScripter wait forEmptySpaceTaskQueue.

	aScripter
		substep: 'Expand first method inside coder'
		do: [ :aStep | 
			aStep click
				label: 'Click on expand adornment';
				onBreadthFirstChildOfClass: GtSourceCoderExpandedContentElement;
				onBreadthFirstChildOfClass: GtSourceCoderEditorElement;
				onChildAt: 4;
				onChildAt: 6.
			aStep wait forEmptySpaceTaskQueue ].
	aScripter
		substep: 'Expand second method inside coder'
		do: [ :aStep | 
			aStep click
				label: 'Click on expand adornment';
				onBreadthFirstChildOfClass: GtSourceCoderExpandedContentElement;
				onBreadthFirstChildOfClass: GtSourceCoderEditorElement;
				onChildAt: 7;
				onChildAt: 7.
			aStep wait forEmptySpaceTaskQueue ].
	aScripter syncContinue.
	^ (aScripter elementWithoutParent)
		vMatchParent;
		hMatchParent.
]

{ #category : #accessing }
GtWorkingWithAPlaceholderRestApi >> getAllTodosMethodExplanationText [
	| text |
	text := 'To implement a request, first we send a GET ' asRopedText,
('request' asRopedText glamorousExplanationFor: #requestForUrl:),
' to the API using the specific ' asRopedText,
('url' asRopedText glamorousExplanationFor: #url),
' for it.
The response is then transformed into a ' asRopedText,
('list of dictionaries' asRopedText glamorousExplanationFor: #dictionaries),
', where ' asRopedText,
('each dictionary' asRopedText glamorousExplanationFor: #dict),
' represents a certain type of object. In this instance, each of them is a todo so for each of them we ' asRopedText,
('save the information' asRopedText glamorousExplanationFor: #rawData:),
' in a ' asRopedText,
('todo' asRopedText glamorousExplanationFor: #TDTodo),
'object thus obtaining a ' asRopedText,
('group of todos' asRopedText glamorousExplanationFor: #TDTodosGroup),
'as a result.' asRopedText.
	
	^ text
		glamorousRegularFont;
		fontSize: 18.
]

{ #category : #slides }
GtWorkingWithAPlaceholderRestApi >> introductionSlideFor: aSlide [
	<gtSlide>
	^ aSlide text
		priority: 5;
		newTextWithFormat:
			('In this slideshow, we exemplify how we can understand and browse an existing REST API containing users, posts, todos, comments, albums and photos.' asRopedText 
				glamorousRegularFont; 
				fontSize: 18).
]

{ #category : #slides }
GtWorkingWithAPlaceholderRestApi >> modelDescriptionIntroductionSlideFor: aSlide [
	<gtSlide>
	^ aSlide text
		priority: 7;
		newTextWithFormat: 
			('In the following we will take a look at how to make a user interface for the requests and how to display the resulted information in a more pleasing and understandable manner.' asRopedText 
				glamorousRegularFont;
				fontSize: 18).
]

{ #category : #slides }
GtWorkingWithAPlaceholderRestApi >> photosExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 23;
		newFadedText: 'Below is an example of a request for the image with id 9.';
		element: [ GtPlaygroundLiveSlide new
			snippets: {'TDClient new getImageWithId: 9.'};
			inspectSnippetAt: 1 ].
]

{ #category : #slides }
GtWorkingWithAPlaceholderRestApi >> photosExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 22;
		newTextWithFormat: ('Photos' asRopedText bold; fontSize: 18);
		newTextWithFormat: self photosSlideText;
		element: [ BlElement new
			background: Color white;
			aptitude: BrShadowAptitude;
			margin: (BlInsets right: 5);
			addChild: (GtPharoBehaviorCoder forClass: TDImage) asElement ].
]

{ #category : #accessing }
GtWorkingWithAPlaceholderRestApi >> photosSlideText [
	^ 'A photo is what composes the album. It has a title, an id, the id of the album where it is from and two urls. One for the thumbnail image and one for the actual image. To visualize the actual image, a request to the specific url is done. That request returns a byte array that is then transformed into a pharo image.' asRopedText
		glamorousRegularFont;
		fontSize: 18.
]

{ #category : #accessing }
GtWorkingWithAPlaceholderRestApi >> postsSlideText [
	^ 'Simple posts are the second type of posts a user can make. They are similar with todos, the difference being that the post contains a body of text instead of a status. It also has a list of comments left by other users to the specific post.' asRopedText
	glamorousRegularFont;
	fontSize: 18.
]

{ #category : #slides }
GtWorkingWithAPlaceholderRestApi >> requestMethodExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 10;
		newFadedText: 'So if we were to request all the todos we would get a group of todos, which you can see displayed by running the snippet below.';
		element: [ GtPlaygroundLiveSlide new
			snippets: {'TDClient new getAllTodos.'};
			inspectSnippetAt: 1 ].
]

{ #category : #slides }
GtWorkingWithAPlaceholderRestApi >> requestMethodExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 9;
		newTextWithFormat: (self getAllTodosMethodExplanationText);
		element: [ self getAllTodosMethodExplanation ].
]

{ #category : #slides }
GtWorkingWithAPlaceholderRestApi >> requestSnippetsExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 24;
		newFadedText: 'You can play around with the snippets below to better see the model at work.';
		element: [ GtPlaygroundLiveSlide new
			snippets: {
				'TDClient new getUserWithId: 5'.
				'TDClient new getTodoWithId: 4'.
				'TDClient new getPostWithId: 3'.
				'TDClient new getCommentWithId: 6'. 
				'TDClient new getAlbumWithId: 2.'.
				'TDClient new getImageWithId: 1.'.
				'TDClient new getAllTodos'.
				'TDClient new getAllPosts'.
				'TDClient new getAllAlbums.'};
			asElement ].
]

{ #category : #slides }
GtWorkingWithAPlaceholderRestApi >> simplePostsExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 17;
		newFadedText: 'Similar with todos, a request for a post will return you that post.';
		element: [ GtPlaygroundLiveSlide new
			snippets: {'TDClient new getPostWithId: 3.'};
			inspectSnippetAt: 1 ].
]

{ #category : #slides }
GtWorkingWithAPlaceholderRestApi >> simplePostsExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 16;
		newTextWithFormat: ('Posts' asRopedText bold; fontSize: 18);
		newTextWithFormat: self postsSlideText;
		element: [ BlElement new
			background: Color white;
			aptitude: BrShadowAptitude;
			margin: (BlInsets right: 5);
			addChild: (GtPharoBehaviorCoder forClass: TDPost) asElement ].
]

{ #category : #slides }
GtWorkingWithAPlaceholderRestApi >> titleSlideFor: aSlide [
	<gtSlide>
	^ aSlide title
		priority: 1;
		titleWithFormat: ('Working with a REST API' asRopedText
			fontSize: 70;
			glamorousRegularFont).
]

{ #category : #slides }
GtWorkingWithAPlaceholderRestApi >> todosExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 15;
		newFadedText: 'A request for a todo will return you that todo with all the information stored about it.';
		element: [ GtPlaygroundLiveSlide new
			snippets: {'TDClient new getTodoWithId: 8.'};
			inspectSnippetAt: 1 ].
]

{ #category : #slides }
GtWorkingWithAPlaceholderRestApi >> todosExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 14;
		newTextWithFormat: ('Todos' asRopedText bold; fontSize: 18);
		newTextWithFormat: self todosSlideText;
		element: [ BlElement new
			background: Color white;
			aptitude: BrShadowAptitude;
			margin: (BlInsets right: 5);
			addChild: (GtPharoBehaviorCoder forClass: TDTodo) asElement ].
]

{ #category : #accessing }
GtWorkingWithAPlaceholderRestApi >> todosSlideText [
	^ 'Next we have a todo. This is a type of post a user can make. It holds the following information: the user it is associated with, an id, a title and a status, namely if it was completed or not.' asRopedText
	glamorousRegularFont;
	fontSize: 18.
]

{ #category : #slides }
GtWorkingWithAPlaceholderRestApi >> userExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 13;
		newFadedText: 'Requesting a user will return that user with its information and the lists of posts, todos and albums associated with him.';
		element: [ GtPlaygroundLiveSlide new
			snippets: {'TDClient new getUserWithId: 4.'};
			inspectSnippetAt: 1 ].
]

{ #category : #slides }
GtWorkingWithAPlaceholderRestApi >> userExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 12;
		newTextWithFormat: ('Users' asRopedText bold; fontSize: 18);
		newTextWithFormat: self userSlideText;
		element: [ BlElement new
			background: Color white;
			aptitude: BrShadowAptitude;
			margin: (BlInsets right: 5);
			addChild: (GtPharoBehaviorCoder forClass: TDUser) asElement ].
]

{ #category : #accessing }
GtWorkingWithAPlaceholderRestApi >> userSlideText [
	^ 'The first, and main type of data is a user. Almost every other type of data is connect to a user. They can be identified by an id and they hold relevant information for the user such as the name, username, phone or email. But on top of that, each user has a list of posts, a list of todos and one of albums associated with him. Those lists are obtained through separate requests to the API, after the information for this user has been parsed and stored.' asRopedText
	glamorousRegularFont;
	fontSize: 18.
]
