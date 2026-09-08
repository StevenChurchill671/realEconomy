extends Location


func _ready() -> void:
	ownerIsEmployer = false
	amountOfProducedItem = 0
	slotsAvailable = 2
	maxSlotsAvailable = 2
	#workersToiling  
	
	itemProduced  = "Wheat"
	workNeeded  = 2000
	maxWorkNeeded = 2000
	typeOfWork = "farmLabourAbility"
func returnSkillType() -> skillNeeded:
	return skillNeeded.farmLabourSkill
