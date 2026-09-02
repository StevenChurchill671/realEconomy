extends Node

var fac : Faction

var factionList : Array[Faction]= [load("res://Faction List/exampleFaction.gd").new()]

func _ready() -> void:
	fac = factionList[0]
	fac.setupFaction("Example Faction")
	
