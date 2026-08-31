extends Node3D

##The location of the node needed to work
##the job.
var employmentLocation
var employmentType 
func _ready() -> void:
	var tempType = load("res://resources/employmentTypes.gd")
	employmentType = tempType.instantiate()
	
