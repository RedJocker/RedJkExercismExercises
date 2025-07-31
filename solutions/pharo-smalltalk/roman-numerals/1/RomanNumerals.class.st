Class {
	#name : #RomanNumerals,
	#superclass : #Object,
	#classVars : [
		'NumeralsMap'
	],
	#category : #'Exercise@RomanNumerals'
}

{ #category : #'class initialization' }
RomanNumerals class >> initialize [
	NumeralsMap := OrderedDictionary newFrom: { 
		1000 -> 'M'.
		900 -> 'CM'.
		500 -> 'D'.
		400 -> 'CD'.
		100 -> 'C'.
		90 -> 'XC'.
		50 -> 'L'.
		40 -> 'XL'.
		10 -> 'X'.
		9 -> 'IX'.
		5 -> 'V'.
		4 -> 'IV'.
		1 -> 'I'
	}.
]

{ #category : #initialization }
RomanNumerals >> initialize [
	NumeralsMap ifNil: [ self class initialize ]
]

{ #category : #operation }
RomanNumerals >> romanNumber: number [
	|n s|
	n := number.
	s := WriteStream with: String new.
	
	NumeralsMap keysDo: [ :k |
		[ n >= k ] whileTrue: [ 
			s nextPutAll: (NumeralsMap at: k). 
			n := n - k 
		]
	].
	^s contents 
	
]
