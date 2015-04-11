private - creation
createElementFrom: aModel
	elements add: ((classMapping at: aModel class) simulation: self model: aModel)