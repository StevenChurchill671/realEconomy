extends Node3D
class_name Location
##Who owns this node
@export
var ownerOf : Person
##Does the owner employ and thus pay workers
##to work the node. Owner can be a faction representative
## to represent state control
var ownerIsEmployer = false

var slotsAvailable = 4
var workersToiling : Array[Person] = []

var itemProduced : String = "Wheat"
var workNeeded : int = 4000

func addWorkerToThis(thisWorker):
	if! workersToiling.has(thisWorker):
		workersToiling.append(thisWorker)
		$workingTime.timeout.connect(_on_working_time_timeout.bind(thisWorker))
		$workingTime.start(thisWorker)

func _on_working_time_timeout(thisWorker) :
	workersToiling.get(thisWorker)
