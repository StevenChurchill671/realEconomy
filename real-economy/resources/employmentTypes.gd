extends Resource

class_name employmentType
var nameOfEmployment : String = "" 



func assignFarmer():
	var tempJob = load("res://resources/farmer.tres")
	nameOfEmployment = tempJob.nameOfEmployment
