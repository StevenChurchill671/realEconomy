extends Resource
class_name Purse
@export
var dollars : int
@export
var pounds : int

var purseContents :Dictionary

func setupPurse(thisDollars : int, thisPounds : int):
	dollars = thisDollars
	pounds = thisPounds
	purseContents = {"dollars": dollars, "pounds": pounds}
