extends Node3D
class_name Town
##A list of all citizens living 
##in the location
@export
var locationCitizens : Array[Person] = []
##The faction which owns the location
@export
var factionOwner : Faction 
