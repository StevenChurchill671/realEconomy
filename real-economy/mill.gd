extends Location

func _ready() -> void:
	
	ownerIsEmployer = false
	slotsAvailable = 1
	maxSlotsAvailable = 1
	  
	
	
	workNeeded  = 2000
	maxWorkNeeded = 2000
	
func returnSkillType() -> skillNeeded:
	return skillNeeded.millLabourSkill
