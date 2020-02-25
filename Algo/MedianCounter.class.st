Class {
	#name : #MedianCounter,
	#superclass : #Object,
	#instVars : [
		'left',
		'right',
		'median'
	],
	#category : #Algo
}

{ #category : #adding }
MedianCounter >> addNumber: aNumber [
(left isEmpty & right isEmpty) ifTrue: [ right add: aNumber. median := aNumber. ^median].

aNumber < median ifTrue: [
	    left add: aNumber. left sort.
	    left size - right size > 1 ifTrue: [ right addFirst: left last. left removeLast ].
	]
   ifFalse: [
	    right add: aNumber. right sort.
		right size - left size > 1 ifTrue: [ left addLast: right first. right removeFirst ].
	].
(left size > right size) ifTrue: [right addFirst: left last. left removeLast].

]

{ #category : #initialization }
MedianCounter >> initialize [ 
left := OrderedCollection new.
right := OrderedCollection new.
]

{ #category : #accessing }
MedianCounter >> median [
(left size = right size) ifTrue: [ ^ (left last + right first / 2) asFloat] ifFalse: [ ^ right first asFloat  ].
]
