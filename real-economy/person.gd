extends CharacterBody3D

##Tracks owned locations such as farm
##could later be put in a seperate portfolio
##node alongside [member purse]? if that would be easier
var ownedLocations = []
##Tracks accumulated currencies - also see [member ownedLocations]
var purse = {"dollars" : 100, "pounds" : 25}
##Faction this person belongs to.
var faction
##List of employees
var employees = []
##Link to employer
var employer 
var speed = 2
var target : Vector3 
var localMesh
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
