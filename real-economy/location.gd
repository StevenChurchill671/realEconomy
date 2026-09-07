
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
var amountOfProducedItem : int= 0
var slotsAvailable : int
var maxSlotsAvailable : int
var workersToiling : Array[Person] = []

var itemProduced : String 
var workNeeded : int 
var maxWorkNeeded : int
var typeOfWork : String

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
	workersToiling.erase(thisWorker)
	slotsAvailable +=1
	if returnSkillType() == skillNeeded.farmLabourSkill:
		if workNeeded - thisWorker.farmLabourAbility > 0:
			workNeeded -= thisWorker.farmLabourAbility
	else:
		#workNeeded -= thisWorker.labourAblity
		workNeeded = (maxWorkNeeded + (workNeeded - thisWorker.farmLabourAbility ))
		amountOfProducedItem += 1
	if returnSkillType() == skillNeeded.millLabourSkill:
		if workNeeded - thisWorker.millLabourAbility > 0:
			workNeeded -= thisWorker.millLabourAbility
	else:
		#workNeeded -= thisWorker.labourAblity
		workNeeded = (maxWorkNeeded + (workNeeded - thisWorker.millLabourAbility ))
		amountOfProducedItem += 1
	print(str(workNeeded))
	print(str(slotsAvailable))
	thisTimer.queue_free()

func findBestWorker():
	pass
func returnSkillType() -> skillNeeded:
	return skillNeeded
	
