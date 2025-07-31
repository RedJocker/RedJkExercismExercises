Class {
	#name : #Isogram,
	#superclass : #Object,
	#category : #'Exercise@Isogram'
}

{ #category : #testing }
Isogram >> isIsogramPhrase: phrase [
|set|
set := Set new.

phrase asLowercase do: [ :ch |
	ch isLetter ifTrue: [ 
		(set includes: ch) 
			ifFalse: [set add: ch] 
			ifTrue: [^false]
	] 
].
^true
]
