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


func _on_jugar_pressed():
	print($"selector de mazo".entregar_mazo())
	var mazo_seleccionado = $"selector de mazo".entregar_mazo()
	var mazo_procesado = []
	for x in mazo_seleccionado:
		for i in range(x[1]):
			mazo_procesado.append(x[0].to_lower())
	print("este es el fin: " , mazo_procesado)
	mazo_procesado.shuffle()
	var next_scene = preload("res://Scenes/websocket/control.tscn")
	MazoSel.set_selected_deck(mazo_procesado)
	get_tree().change_scene_to_packed(next_scene)
	
	pass # Replace with function body.
