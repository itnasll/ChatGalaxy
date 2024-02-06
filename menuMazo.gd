extends Node2D

@onready var pre_carta = preload("res://Scenes/card.tscn")

@onready var mis_cartas = preload("res://Scenes/contenedor_de_carta.tscn")



func _ready():
	
#	var carta_nueva = pre_carta.instantiate() 
#	carta_nueva.Card = load("res://Recursos/probando.res")
#	carta_nueva.cargar_data()
##	var carta_nueva = pre_carta.instantiate() 
#	$"contenedor de carta".get_child(0).add_child(carta_nueva)
#	carta_nueva.position.x = 1000
#	carta_nueva.position.y = 250
	for x in range(155):
		var carta_nueva = pre_carta.instantiate() 
		carta_nueva.Card = load("res://Recursos/probando.res")
		carta_nueva.cargar_data()
		var carta = mis_cartas.instantiate()
		carta.add_child(carta_nueva)
		$TabContainer/TabBar/ScrollContainer/GridContainer.add_child(carta)
		carta.connect("CartaPresionada",al_tocar_carta )
# Called when the node enters the scene tree for the first time.
#func _ready():
#	var texture = preload("res://Assets/espacio vida.png")
#	var cartaNueva = pre_carta.instantiate()
#	cartaNueva.get_child(0).get_node("Imagen").set_texture(texture)
#	cartaNueva.scale *= 1
#	cartaNueva.position.x = 1000
#	cartaNueva.position.y = 500
#	$".".add_child(cartaNueva)
#
#	for x in range(155):
#		texture = preload("res://Assets/espacio vida.png")
#
#		cartaNueva = pre_carta.instantiate()
#		cartaNueva.get_child(0).get_node("Imagen").set_texture(texture)
#		cartaNueva.scale *= 5
#		cartaNueva.size.x = 500
#		cartaNueva.size.y = 300
#		cartaNueva.set("custom_constants/margin_top", 10)
#		cartaNueva.set("custom_constants/margin_bottom", 10)
#		cartaNueva.set("custom_constants/margin_left", 240)
#		cartaNueva.set("custom_constants/margin_right", 10)
#		$TabContainer/TabBar/ScrollContainer/GridContainer.add_child(cartaNueva)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func al_tocar_carta(asd):
	if asd.estaSeleccionada:
		asd.estaSeleccionada= false
		$"contenedor de carta central".get_child(1).queue_free()
	else:
		asd.estaSeleccionada= true
		var cartaSel = asd.get_child(1).duplicate()
		print(cartaSel)
		$"contenedor de carta central".add_child(cartaSel)


#func _on_nuevo_mazo_pressed():
#	var nuevoPestaña = Button.new()
#	nuevoPestaña.name = "erza"
#	var linea = LineEdit.new()
#	nuevoPestaña.add_child(linea)
#	$TabContainer2.add_child(nuevoPestaña)
#	pass # Replace with function body.


func _on_crear_mazo_pressed():
	var nombre_mazo = $"VistaMazos/nuevo mazo/NombreDelMazo".text
	var nuevo_mazo = preload("res://vista_mazo.tscn").instantiate()
	nuevo_mazo.name = nombre_mazo
	nuevo_mazo.set_scale(Vector2(0.8, 0.8))
	$VistaMazos.add_child(nuevo_mazo)
	var catindad_detab = $VistaMazos.get_tab_count()
	$VistaMazos.current_tab = catindad_detab-1
	pass # Replace with function body.
