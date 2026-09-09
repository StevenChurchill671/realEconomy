extends Location


func _ready() -> void:
	
	ownerIsEmployer = false
	slotsAvailable = 3
	maxSlotsAvailable = 3
	#workersToiling  
	
	
	workNeeded  = 2000
	maxWorkNeeded = 2000
	
func returnSkillType() -> skillNeeded:
	return skillNeeded.farmLabourSkill


func _on_work_area_body_entered(body: Node3D) -> void:
	if body == Person:
		
		body.inWorkArea = true
		print ("skring")
