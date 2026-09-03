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
var workersToiling : Array[Person]
