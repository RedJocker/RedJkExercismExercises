Class {
	#name : #Allergies,
	#superclass : #Object,
	#classVars : [
		'AllergiesMap'
	],
	#category : #'Exercise@Allergies'
}

{ #category : #'class initialization' }
Allergies class >> initialize [ 
	AllergiesMap := Dictionary new
		at: 'eggs'put: 1;
		at: 'peanuts' put: 2;
		at: 'shellfish' put: 4;
		at: 'strawberries' put: 8;
		at: 'tomatoes' put: 16;
		at: 'chocolate' put: 32;
		at: 'pollen' put: 64;
		at: 'cats' put: 128;
		yourself.
	superclass initialize.
]

{ #category : #accessing }
Allergies >> allergicToItem: allergy forScore: score [
	^AllergiesMap at: allergy 
		ifPresent: [ :allergyCode | 
			(allergyCode & score) ~= 0.
		]
		ifAbsent: [ false ].
]

{ #category : #accessing }
Allergies >> allergyListForScore: score [
	^((AllergiesMap associationsSelect: [ :assoc |
		(self allergicToItem: (assoc key) forScore: score) 
	]) associations sorted: [ :a1 :a2 |
		a1 value < a2 value
	]) collect: [ :a | a key ]
	
	
]

{ #category : #initialization }
Allergies >> initialize [
	AllergiesMap ifNil: self class initialize.
]
