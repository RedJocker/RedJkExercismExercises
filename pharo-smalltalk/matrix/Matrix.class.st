Class {
	#name : #Matrix,
	#superclass : #Object,
	#category : #'Exercise@Matrix'
}

{ #category : #'as yet unclassified' }
Matrix >> input: matrixString atColumn: colIdx [
	^((matrixString  substrings: '
	') collect: [ :s | 
		s substrings collect: [ :n | n asInteger ]
	]) flatCollect: [ :row |
		row selectEvery:  [:i | i = colIdx ].
	]
]

{ #category : #'as yet unclassified' }
Matrix >> input: matrixString atRow: rowIdx [
	^((matrixString  substrings: '
	') collect: [ :s | 
		s substrings collect: [ :n | n asInteger ]
	]) at: rowIdx
]
