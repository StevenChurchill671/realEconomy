extends Resource

class_name employmentType
var nameOfEmployment : String = "" 



func assignFarmer():
	var tempJob = load("res://resources/farmer.tres")
	nameOfEmployment = tempJob.get_meta(nameOfEmployment)

func assignMiner():
	var tempJob = load("res://resources/miner.tres")
	nameOfEmployment = tempJob.get_meta(nameOfEmployment)

func assignEmployer():
	pass
