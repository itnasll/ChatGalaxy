extends Node

@onready var mazo_sel = ["probando","probando","probando","probando","disparo1"]
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func set_selected_deck(deck):
	mazo_sel = deck

func get_selected_deck():
		
	return mazo_sel
