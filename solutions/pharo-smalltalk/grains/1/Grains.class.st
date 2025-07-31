Class {
	#name : #Grains,
	#superclass : #Object,
	#category : #'Exercise@Grains'
}

{ #category : #accessing }
Grains >> atSquare: square [
	(square <= 0) | (square > 64) ifTrue: [^self error: 'square must be between 1 and 64']. 
	square = 1 
		ifTrue: [ ^1 ]
		ifFalse: [ 
			|rec|
			rec := self atSquare: (square - 1).
			^ rec + rec 
		]
			
			
	
]

{ #category : #accessing }
Grains >> total [
	^((1 to: 64) collect: [ :s | self atSquare: s]) sum
]
