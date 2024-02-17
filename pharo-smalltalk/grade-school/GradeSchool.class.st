Class {
	#name : #GradeSchool,
	#superclass : #Object,
	#instVars : [
		'students'
	],
	#category : #'Exercise@GradeSchool'
}

{ #category : #adding }
GradeSchool >> addStudents: newStudents [
	 students addAll: newStudents
]

{ #category : #adding }
GradeSchool >> desiredGrade: grade [
	^((students 
		select: [ :s | (s at: 2) = grade ] 
		thenCollect: [ :s | (s at: 1) ])
		sorted: [ :s1 :s2 | s1 < s2 ])
		asArray
]

{ #category : #initialization }
GradeSchool >> initialize [
	students := OrderedCollection new.
	super initialize.
]

{ #category : #adding }
GradeSchool >> roster [
	^((students sort: [ :a :b |
		(a at: 2) = (b at: 2) 
			ifTrue: 	[ (a at: 1) < (b at: 1) ]
			ifFalse: [ (a at: 2) < (b at: 2) ]
	]) collect: [ :a |
		a at: 1
	]) asArray
]
