extends Location


func _ready() -> void:
	
	ownerIsEmployer = false
	slotsAvailable = 2
	maxSlotsAvailable = 2
	#workersToiling  
	
	
	workNeeded  = 200
	maxWorkNeeded = 200
	
func returnSkillType() -> skillNeeded:
	return skillNeeded.farmLabourSkill


func _on_work_area_body_entered(body: Node3D) -> void:
	if body is Person:
		
		body.inWorkArea = true
		#print ("skring")
