extends VBoxContainer
signal Slot_vida_pressed

@onready var espacioCartaVida = $EspacioCartaVida
@onready var espacioCartaAtaque = $EspacioCartaAtaque
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
#	if espacioCartaVida.get_child_count() == 2:
#		if $"Barra de Vida".vVida <= 0:
#				espacioCartaVida.get_child(1).free()
#				$EspVida.disabled = false
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
	jugar_carta("../../Almacen", espacioCartaVida)
	$EspacioCartaVida.get_child(0).visible = false
	$botonAreaAtaque.disabled = false
	var card = $EspacioCartaVida.get_child(1).get_child(1)
#	print(card.Valor)
	var valor = int(card.Valor.text)
	$"Barra de Vida".vVida = valor
	$"Barra de Vida".vVMax = valor
	"""hacer que desaparezca el boton vida mientras tenga una nave jugada """


func _on_accion_pressed():
	$"Barra de Vida".vVida -= 100

func _on_boton_area_ataque_pressed():
	jugar_carta("../../Almacen2",espacioCartaAtaque)
	$EspacioCartaAtaque.get_child(0).visible = false
	pass
	
func jugar_carta(ruta_mano, nodo_reparent):
	var almacen = get_node(ruta_mano+"/Mano")
	for i in almacen.get_children():
#		print("enmano:", i)
		if i.estaSeleccionada:
			var texture = preload("res://Assets/Imagenes/Border-vacio.png")
			i.get_child(0).set_texture_normal(texture)
			
			i.reparent(nodo_reparent)
			var card = $EspacioCartaVida.get_child(1).get_child(0)
			card.texture_normal = null
			get_node(ruta_mano).cambiar_no_seleccionada()
			$botonAreaAtaque.disabled = true
	



