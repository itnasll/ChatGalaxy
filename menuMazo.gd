extends Node2D

@onready var pre_carta = preload("res://Scenes/card.tscn")

@onready var mis_cartas = preload("res://Scenes/contenedor_de_carta.tscn")


func _ready():
	for x in range(5):
		var carta_nueva = pre_carta.instantiate() 
		carta_nueva.Card = load("res://Recursos/probando.res")
		carta_nueva.cargar_data()
		var carta = mis_cartas.instantiate()
		carta.add_child(carta_nueva)
		$TabContainer/Naves/ScrollContainer/GridContainer.add_child(carta)
		carta.connect("CartaPresionada",al_tocar_carta )
	for x in range(5):
		var carta_nueva = pre_carta.instantiate() 
		carta_nueva.Card = load("res://Recursos/carlost.res")
		carta_nueva.cargar_data()
		var carta = mis_cartas.instantiate()
		carta.add_child(carta_nueva)
		$TabContainer/Naves/ScrollContainer/GridContainer.add_child(carta)
		carta.connect("CartaPresionada",al_tocar_carta )

func _process(_delta):
	if $"contenedor de carta central".get_child_count() == 1 or $VistaMazo.get_child(0).current_tab == 0:
		$BotonAgregarAlMazo.disabled = true
	elif $"contenedor de carta central".get_child_count() == 2 and $VistaMazo.get_child(0).current_tab >0:
		$BotonAgregarAlMazo.disabled = false

func al_tocar_carta(asd):
	if asd.estaSeleccionada:
		asd.estaSeleccionada= false
		$"contenedor de carta central".get_child(1).queue_free()
		for carta in $TabContainer/Naves/ScrollContainer/GridContainer.get_children():
			if asd != carta:
				carta.get_child(0).disabled = false
	else:
		asd.estaSeleccionada= true
		var cartaSel = asd.get_child(1).duplicate()
		$"contenedor de carta central".add_child(cartaSel)
		for carta in $TabContainer/Naves/ScrollContainer/GridContainer.get_children():
			if asd != carta:
				carta.get_child(0).disabled = true

func _on_boton_agregar_al_mazo_pressed():
	var mazo_sel = $VistaMazo.get_child(0).get_child($VistaMazo.get_child(0).current_tab)
	var carta_sel = $"contenedor de carta central".get_child(1)
	var nombre_rec = carta_sel.Nombre.text
#	for x in mazo_sel:
	if !mazo_sel.esta_o_no_esta(nombre_rec):
		mazo_sel.nueva_carta("res://Recursos/"+nombre_rec+".res")
	#limpiar carta seleccionada y deseleccionar en tabcontainer
	pass # Replace with function body.
