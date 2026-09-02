extends Resource
##A faction, which people ([Person]) belong to
class_name Faction
##Name of the faction
@export
var factionName : String = ""
##list of all members of the faction
var memberList : Array[Person] = []
##A list of all employers in this faction
var employersInFaction : Array[Person]= []
##leader of the faction
var leader
##The employer in question would trigger this to change
##to or from the employer list
func updateEmployers(employerToUpdate):
	pass
##Add a member ([Person]) to the faction.
func addMember(member : Person,):
	memberList.append(member)
	member.setFaction(self) 
func setupFaction(thisFactionName : String, ):
	factionName = thisFactionName
