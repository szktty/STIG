initialize-release
initialize
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	self root: self class defaultRoot.
	directoryCache := Dictionary new