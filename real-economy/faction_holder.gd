extends Node

var fac = preload("res://Faction List/exampleFaction.gd")
@export 
var factionList : Array[Resource]= [fac.instantiate()]
