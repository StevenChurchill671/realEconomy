extends Node3D

var employmentLocation
var employmentType
func _ready() -> void:
	var tempType = load("res://employment types/employment_farmer.tscn")
	employmentType = tempType.instantiate()
