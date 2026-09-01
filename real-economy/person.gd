extends CharacterBody3D
class_name Person
##Tracks owned locations such as farm
##could later be put in a seperate portfolio
##node alongside [member purse]? if that would be easier
@export
var ownedLocations = []
##Tracks accumulated currencies - also see [member ownedLocations]
@export
var purse = {"dollars" : 100, "pounds" : 25}
##Faction this person belongs to.
@export
var faction =load("res://resources/faction.gd")
##List of employees
@export
var employees : Array[Person]= []
##Link to employer
@export
var employer : Person

var speed = 2
var target : Vector3 
##link to employmentType
var employment = employmentType.new()
func _ready() -> void:
	target=self.global_position
func _process(delta: float) -> void:
	if !is_inside_tree():
		return
	if 1== 1:
		target = self.global_position
		velocity = global_position.direction_to(target) * speed
		move_and_slide()
		return
	velocity = global_position.direction_to(target) * speed
	move_and_slide()
