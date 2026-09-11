
extends Node3D
##A workable location IE farm.
class_name Location
##Who owns this node
@export
var ownerOf : Person
##Does the owner employ and thus pay workers
##to work the node. Owner can be a faction representative
## to represent state control
var ownerIsEmployer :bool
var slotsAvailable : int
var maxSlotsAvailable : int
var workersToiling : Array[Person] = []
@export
var itemProduced : Item 
var workNeeded : int 
var maxWorkNeeded : int
@export
var itemConsumed : Item
@export
var runner : Person
var enoughItemsToConsume : bool = false
enum skillNeeded {millLabourSkill,farmLabourSkill}
func addWorkerToThis(thisWorker : Person):
	if thisWorker.isRunner:
		getRunner(itemProduced,thisWorker,getLocationThatConsumes(itemProduced))
	slotsAvailable -=1
	thisWorker.currentTask = self
func setWorkerWorking(thisWorker:Person):
	if! workersToiling.has(thisWorker):
		workersToiling.append(thisWorker)
		var thisTimer = Timer.new()
		self.add_child(thisTimer)
		thisTimer.timeout.connect(_on_working_time_timeout.bind(thisWorker, thisTimer))
		thisTimer.one_shot = true
		thisTimer.start(1)
func _on_working_time_timeout(thisWorker : Person, thisTimer:Timer) :
	if itemConsumed != null:
		if itemConsumed.amount>0:
			itemConsumed.amount -=1
			enoughItemsToConsume = true
			if workNeeded - thisWorker.skillBeingUsed > 0:
				workNeeded -= thisWorker.skillBeingUsed
			else:
				
				workNeeded = (maxWorkNeeded + (workNeeded - thisWorker.skillBeingUsed ))
				itemProduced.amount += 1
		else :
			enoughItemsToConsume = false
	
	
	else:
		if workNeeded - thisWorker.skillBeingUsed > 0:
			workNeeded -= thisWorker.skillBeingUsed
		else:
			
			workNeeded = (maxWorkNeeded + (workNeeded - thisWorker.skillBeingUsed ))
			itemProduced.amount += 1
			
	workersToiling.erase(thisWorker)
	slotsAvailable +=1
	print(str(workNeeded))
	#print(str(slotsAvailable))
	thisTimer.queue_free()
	if itemProduced.amount > 5:
		print(str(itemProduced.amount))
		getRunner(itemProduced, runner, getLocationThatConsumes(itemProduced))
	else:
		thisWorker.currentTask = null


func returnSkillType() -> skillNeeded:
	return skillNeeded
	
func getRunner(thisItem : Item, thisRunner : Person, runnerTarget : Location):
	
	thisRunner.currentTask = runnerTarget
func getLocationThatConsumes(thisItem : Item) -> Location:
	var currentDistance : float
	var bestDistance : float = 100000000000
	var bestLocation : Location  = null
	for theLocation in ownerOf.ownedLocations:
		
		if theLocation.itemConsumed == thisItem:
			currentDistance =self.global_transform.origin.distance_to(theLocation.global_position) 
			if currentDistance < bestDistance:
				bestDistance = currentDistance
				bestLocation = theLocation
			
	return bestLocation
