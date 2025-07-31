Class {
	#name : #ReverseString,
	#superclass : #Object,
	#category : #'Exercise@ReverseString'
}

{ #category : #'as yet unclassified' }
ReverseString >> reverseValue: str [
	"reverse a string"	
	|rev|
	rev := ''.
	str do: [ :ch |
		rev := ch asString , rev
	].
	^rev
]
