building widgets
createWidgets
	buttons do: [ :item | self assign: item to: ('button' , item hash asString) asSymbol ]