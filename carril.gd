extends VBoxContainer
signal Slot_vida_pressed

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
		
	if $"EspVida".get_child_count() == 1:
			if $"Barra de Vida".vVida <= 0:
				$EspVida.get_child(0).free()
				
				
	if $botonAreaAtaque.get_child_count() > 0 :
		$botonAreaAtaque.disabled = true
	else:
		$botonAreaAtaque.disabled = false



func _on_esp_vida_pressed():
	var almacen = get_node("../../Almacen/Mano")
	for i in almacen.get_children():
		print("enmano:", i)
		if i.estaSeleccionada:
			#var elel = almacen.get_node(i)
			print("seleccionada", i)
#			almacen.remove_child(i)
#			var aasd = get_node("EspVida")
#			aasd.add_child(i)
			i.reparent($".")
			print("asd__",i)
	#print(almacen)
	#print(self)
	emit_signal("Slot_vida_pressed")
	pass # Replace with function body.


func _on_accion_pressed():
	print($EspVida.get_child_count())
	pass # Replace with function body.
