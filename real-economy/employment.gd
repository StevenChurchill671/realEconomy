extends Node3D

var employmentLocation
var employmentType 
func _ready() -> void:
	var tempType = load("res://resources/employmentTypes.gd")
	employmentType = tempType.instantiate()
	
