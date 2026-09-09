
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
var runner : Person
var enoughItemsToConsume : bool = false
enum skillNeeded {millLabourSkill,farmLabourSkill}
func addWorkerToThis(thisWorker):
	if! workersToiling.has(thisWorker):
		workersToiling.append(thisWorker)
		slotsAvailable -= 1
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
	#print(str(workNeeded))
	#print(str(slotsAvailable))
	thisTimer.queue_free()
	thisWorker.currentTask = null


func returnSkillType() -> skillNeeded:
	return skillNeeded
	
func getRunner(thisItem : Item, thisRunner : Person,runnerTarget):
	
	thisRunner.currentTask = runnerTarget
