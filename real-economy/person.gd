extends CharacterBody3D
##A person in the world, could be
##a farmer, an employer, unemployed.
##[method addEmployee]
class_name Person
##Tracks owned locations such as farm
##could later be put in a seperate portfolio
##node alongside [member purse]? if that would be easier
@export
var ownedLocations  = []
##Tracks accumulated currencies - also see [member ownedLocations]
@export
var purse : Purse = Purse.new()
##[Faction] this person belongs to.
@export
var faction :Faction
##List of employees ([Person]s employed) if they exist.
@export
var employees : Array[Person]= []
##Link to employer, if one exists. ([Person]) or later company.
@export
var employer : Person

var speed = 2
var target : Vector3 
##link to employmentType
var employment = employmentType.new()



func addEmployee():
	pass
##Set the [Faction] of this person.
func setFaction(thisFaction : Faction):
	self.faction =thisFaction 
func setupPerson(thisOwnedLocationList : Array, thisDollars: int ,thisPounds : int,thisFaction: Faction, ):
	ownedLocations = thisOwnedLocationList
	self.purse.setupPurse(thisDollars,thisPounds)
	self.faction =thisFaction

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
