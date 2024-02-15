Class {
	#name : #TwoFer,
	#superclass : #Object,
	#category : #'Exercise@TwoFer'
}

{ #category : #'as yet unclassified' }
TwoFer >> who [ 
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	^'One for you, one for me.'
]

{ #category : #'as yet unclassified' }
TwoFer >> who: name [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	^'One for ', name, ', one for me.'
]
