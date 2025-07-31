Class {
	#name : #Leap,
	#superclass : #Object,
	#category : #'Exercise@Leap'
}

{ #category : #'as yet unclassified' }
Leap >> leapYear: year [
	^(year % 400 == 0) | ((year % 4 == 0) & (year % 100 ~= 0)) 
]
