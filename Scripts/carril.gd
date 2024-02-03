extends VBoxContainer
signal Slot_vida_pressed

@onready var espacioCartaVida = $EspacioCartaVida
@onready var espacioCartaAtaque = $EspacioCartaAtaque
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if espacioCartaVida.get_child_count() == 2:
		if $"Barra de Vida".vVida <= 0:
				espacioCartaVida.get_child(1).free()
				$EspVida.disabled = false
#	pass
#
#	if $EspYCarta.get_child_count() == 1:
#			if $"Barra de Vida".vVida <= 0:
#				$EspVida.get_child(0).free()
#
#
#	if $botonAreaAtaque.get_child_count() > 0 :
#		$botonAreaAtaque.disabled = true
#	else:
#		$botonAreaAtaque.disabled = false



func _on_esp_vida_pressed():
	#agregar un if que chequee
	var almacen = get_node("../../Almacen/Mano")
	for i in almacen.get_children():
#		print("enmano:", i)
		if i.estaSeleccionada:
			i.reparent(espacioCartaVida)
#			$".".move_child(i, 3)
			var valor = i.get_node("Boton/Label").text
			$"Barra de Vida".vVida = valor
			$"Barra de Vida".vVMax = valor
			i.get_child(0).texture_normal = null
			get_node("../../Almacen").cambiar_no_seleccionada()
			$EspVida.disabled = true
			$botonAreaAtaque.disabled = false
	#print(almacen)
	#print(self)
#	emit_signal("Slot_vida_pressed")
	


func _on_accion_pressed():
	$"Barra de Vida".vVida -= 50

func _on_boton_area_ataque_pressed():
	var almacen = get_node("../../Almacen2/Mano")
	for i in almacen.get_children():
#		print("enmano:", i)
		if i.estaSeleccionada:
			i.reparent(espacioCartaAtaque)
			#$".".move_child(i, 1)
			i.get_child(0).texture_normal = null
			get_node("../../Almacen2").cambiar_no_seleccionada()
			$botonAreaAtaque.disabled = true
	



