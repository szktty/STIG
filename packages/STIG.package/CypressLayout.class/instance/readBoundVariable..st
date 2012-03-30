readBoundVariable: variable

	variable directoryContentsDo: [:eachFile :eachTail |
		(eachFile isDirectory or: [ eachTail = CommentFile ]) ifFalse: [
			eachTail = PropertyFile
				ifTrue: [ (variable name endsWith: '.class')
						ifTrue: [self readClass: eachFile using: variable ]
						ifFalse: [self readNamespace: eachFile using: variable] ]
				ifFalse: [ self readSharedVariable: eachFile using: variable ] ] ].
	variable directory: 'class' contentsDo: [ :file :tail |
		file extension = '.st' ifTrue: [ self readMethod: file tail: tail instance: false using: variable ] ].
	variable directory: 'instance' contentsDo: [ :file :tail |
		file extension = '.st' ifTrue: [ self readMethod: file tail: tail instance: true using: variable ] ].
	^variable