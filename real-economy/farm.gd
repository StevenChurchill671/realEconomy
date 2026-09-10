extends Location


func _ready() -> void:
	
	ownerIsEmployer = false
	slotsAvailable = 2
	maxSlotsAvailable = 2
	#workersToiling  
	
	
	workNeeded  = 2000
	maxWorkNeeded = 2000
	
func returnSkillType() -> skillNeeded:
	return skillNeeded.farmLabourSkill


func _on_work_area_body_entered(body: Node3D) -> void:
	if body is Person:
		
		body.inWorkArea = true
		#print ("skring")
