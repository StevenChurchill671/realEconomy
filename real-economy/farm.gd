extends Node3D
class_name Location
##Who owns this node
@export
var ownerOf : Person
##Does the owner employ and thus pay workers
##to work the node. Owner can be a faction representative
## to represent state control
var ownerIsEmployer = false
var amountOfProducedItem = 0
var slotsAvailable = 4
var workersToiling : Array[Person] = []

var itemProduced : String = "Wheat"
var workNeeded : int = 2000

func addWorkerToThis(thisWorker):
	if! workersToiling.has(thisWorker):
		workersToiling.append(thisWorker)
		var thisTimer = Timer.new()
		self.add_child(thisTimer)
		thisTimer.timeout.connect(_on_working_time_timeout.bind(thisWorker, thisTimer))
		thisTimer.one_shot = true
		thisTimer.start(1)

func _on_working_time_timeout(thisWorker : Person, thisTimer:Timer) :
	workersToiling.erase(thisWorker)
	if workNeeded - thisWorker.labourAblity > 0:
		workNeeded -= thisWorker.labourAblity
	else:
		#workNeeded -= thisWorker.labourAblity
		workNeeded = (2000 + (workNeeded - thisWorker.labourAblity ))
		amountOfProducedItem += 1
	print(str(workNeeded))
	thisTimer.queue_free()
