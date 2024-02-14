extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_coleccion_pressed():
#	var next_scene = preload("res://menuMazo.tscn")
	get_tree().change_scene_to_file("res://menuMazo.tscn")
	# existe get_tree().change_scene_to_packed(next_scene)
	#para cargar escena preload
	


func _on_salir_pressed():
	get_tree().quit()
	pass # Replace with function body.
