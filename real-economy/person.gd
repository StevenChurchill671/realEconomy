extends CharacterBody3D
##A person in the world, could be
##a farmer, an employer, unemployed.
##[method addEmployee]
class_name Person
##Tracks owned locations such as farm
##could later be put in a seperate portfolio
##node alongside [member purse]? if that would be easier
@export
var ownedLocations :Array[Location] = []
##Tracks accumulated currencies - also see [member ownedLocations]
@export
var purse : Purse = Purse.new()
##The name of the person.
@export
var personName : String
##The current object the person is assigned to or null
@export
var currentTask : Location 
##[Faction] this person belongs to.
@export
var faction :Faction:
	set(thisFaction):
		if faction == thisFaction:
			return
		faction = thisFaction
		if thisFaction != null:
			thisFaction.addMember(self)
##List of employees ([Person]s employed) if they exist.
@export
var employees : Array[Person]= []

##Link to employer, if one exists. ([Person]) or later company.
@export
var employer : Person:
	set(localEmployer):
		employer = localEmployer
		if !localEmployer.employees.has(self):
			localEmployer.addEmployee(self)
var speed = 2
var target : Vector3 
##link to employmentType
@export
var employment : employmentType = employmentType.new()


func addOwnedLocation(thisLocation):
	ownedLocations.append(thisLocation)
func addEmployee(localEmployee : Person):
	employees.append(localEmployee)
##Set the [Faction] of this person.
func setFaction(thisFaction : Faction):
	self.faction =thisFaction 
func setupPerson(thisOwnedLocationList : Array, thisDollars: int ,thisPounds : int,thisFaction: Faction, ):
	ownedLocations = thisOwnedLocationList
	self.purse.setupPurse(thisDollars,thisPounds)
	self.faction =thisFaction

func _ready() -> void:
	target=self.global_position
	
	if faction != null:
		print(faction.factionName)
	else:
			print("faction not found")

func _process(delta: float) -> void:
	if !is_inside_tree():
		return
	assignEmployeesToWork()
	if currentTask != null:
		target = currentTask.global_position
		velocity = global_position.direction_to(target) * speed
		move_and_slide()
		return
	velocity = global_position.direction_to(target) * speed
	move_and_slide()

func assignEmployeesToWork():
	for localEmployee : Person in employees:
		localEmployee.currentTask = ownedLocations[0]
		localEmployee.currentTask.workersToiling.append(self)
