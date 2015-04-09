private - creation
loadElementFrom: aModel
	elements add: ((classMapping at: aModel class) simulation: self model: aModel)