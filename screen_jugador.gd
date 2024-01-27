extends Node2D

var states: Dictionary = {}
#@onready var carta_vida = $HBoxContainer/CartaVida
#@onready var carta_vida_2 = $HBoxContainer/CartaVida2
#@onready var carta_vida_3 = $HBoxContainer/CartaVida3
var vida1 : Array = []
var vida2 : Array = []
var palabra_sel : Array
const VDEs : String = "res://cartaVida.tscn"
var escena_instanciada = preload(VDEs)

enum EstadoSeleccionarCarta { SELECCIONADA, NOSELECCIONADA}
enum EstadoRepartir { Estado1, Estado2 }
var estadoRepartir = EstadoRepartir.Estado1
var estadoSelCarta = EstadoSeleccionarCarta.NOSELECCIONADA
enum estadoEspaciovidas {COMPLETAS, INCOMPLETAS}
var vidasCompletasEstado = estadoEspaciovidas.INCOMPLETAS 

# Called when the node enters the scene tree for the first time.
func _ready():

	# Llena los arrays con números en el rango del 60 al 350
	for i in range(60, 360, 15):
		vida1.append(i)
	for j in range(75, 375, 15):
		vida2.append(j)




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var uno = $Carriles/Carril1/EspVida
	var dos = $Carriles/Carril2/EspVida
	var tres = $Carriles/Carril3/EspVida
#	if uno.get_child_count() == 1:
#		if $VBoxContainer/HBoxContainer2/Node2D.vVida <= 0:
#			uno.get_child(0).free()
#	if dos.get_child_count() == 1:
#		if $VBoxContainer/HBoxContainer2/Node2D2.vVida <= 0:
#			dos.get_child(0).free()
#	if tres.get_child_count() == 1:
#		if $VBoxContainer/HBoxContainer2/Node2D3.vVida <= 0:
#			tres.get_child(0).free()

	match estadoSelCarta:
		EstadoSeleccionarCarta.SELECCIONADA:
			pass
		EstadoSeleccionarCarta.NOSELECCIONADA:
			for j in $containerVidas.get_children():
				j.texture_normal = null
				j.disabled = false
	match vidasCompletasEstado:
		estadoEspaciovidas.INCOMPLETAS:
			if uno.get_child_count() + dos.get_child_count() + tres.get_child_count() == 3:
				vidasCompletasEstado = estadoEspaciovidas.COMPLETAS
		estadoEspaciovidas.COMPLETAS:
			get_tree().call_group("CartaVidas", "set_disabled", true)
			for node in get_tree().get_nodes_in_group("espaciosVidas"):
				if node.get_child_count() == 0:
					vidasCompletasEstado = estadoEspaciovidas.INCOMPLETAS



func _on_almacen_envio_palabra(argu):
	var ls = LabelSettings.new()
	ls.set_font_color("Red")
	ls.set_font_size(20)
	
	argu.label_settings = ls
#	argu.horizontal_alignment(VERTICAL_ALIGNMENT_CENTER)
	var centrar = CenterContainer.new()
	centrar.add_child(argu)
	#$VBoxContainer/HBoxContainer/ColorRect.add_child(centrar)
	palabra_sel.append(centrar)

func palabra_en_juego(asd, asd2):
	var nodoOrigen = get_node(asd)
	var nodoCheck = get_node(asd2)
	if nodoCheck.get_child_count()>0:
		if palabra_sel.size() > 0:
			nodoOrigen.add_child(palabra_sel[0])
			palabra_sel.remove_at(0)


func _on_boton_area_ataque_pressed(extra_arg_0, extra_arg_1):
	palabra_en_juego(extra_arg_0,extra_arg_1)

func _on_button_2_pressed():
	var asd2 = $VBoxContainer/HBoxContainer2/EspVida1
	palabra_en_juego($VBoxContainer/HBoxContainer/Button2, asd2)

func _on_button_3_pressed():
	var asd2 = $VBoxContainer/HBoxContainer2/EspVida1
	palabra_en_juego($VBoxContainer/HBoxContainer/Button3, asd2)

var vidaSeleccionada = []

func _on_entrega_vida_pressed():
	var container = $containerVidas
	for i in container.get_children():
		if i.get_child_count()==0:
			print("tiene")
			print(i.get_child_count())
			var EsI = escena_instanciada.instantiate()
			EsI.get_node("TextureButton/Label").text = str(vida1.pick_random())
			EsI.scale.x= 1
			EsI.scale.y= 1
			i.add_child(EsI)
			break

func _on_carta_vida_envia_vida(argumento):
	vidaSeleccionada.append(argumento)
	print("elpepe")
 

#NOS QUEDAMOS ACA ABAJO
#separando carriles de screen_jugador
#opncion de separar conteiner vidas

func cartaAUbicacion(argu,argu2):
	var node = get_node(argu) #boton ubicacion
	var node2 = get_node(argu2)#barra vida
	if vidaSeleccionada.size()>0 and node.get_child_count()==0:
		var elel = vidaSeleccionada[0]
		for i in $containerVidas.get_children():
			for k in i.get_children():
				if k == elel:
					print(i.name)
					print(k.get_child(0).get_child(0).text)
					i.remove_child(elel)
					i.texture_normal = null
					node.add_child(elel)
					vidaSeleccionada.remove_at(0)
					node2.get_child(0).max_value = int(k.get_child(0).get_child(0).text)
					node2.vVida = k.get_child(0).get_child(0).text
					print( k.get_child(0).get_child(0).text)

func _on_esp_vida_1_pressed(argu, argu2):
	cartaAUbicacion(argu,argu2)
	estadoSelCarta = EstadoSeleccionarCarta.NOSELECCIONADA

func _on_container_vidas_child_exiting_tree(node):
	print(node)
	vidaSeleccionada.append(node)
	print("append logrado")
	print(vidaSeleccionada[0])
	

func genericaVidaPresed(arg1):
	var node = get_node(arg1)
	var nodeH = node.get_child(0)
	if vidaSeleccionada.size() == 0:
		vidaSeleccionada.append(nodeH)
		var mi_textura = load("res://Gold_Border.png")
		node.set_texture_normal(mi_textura)
	
		var elel = vidaSeleccionada[0]
#				estadoSelCarta = EstadoSeleccionarCarta.SELECCIONADA
		for i in $containerVidas.get_children():
			for k in i.get_children():
				if k != elel:
					i.disabled = true
			

func alternarEstado(arg):
	match estadoSelCarta:
		EstadoSeleccionarCarta.NOSELECCIONADA:
			genericaVidaPresed(arg)
			estadoSelCarta = EstadoSeleccionarCarta.SELECCIONADA
		EstadoSeleccionarCarta.SELECCIONADA:
			estadoSelCarta = EstadoSeleccionarCarta.NOSELECCIONADA
			vidaSeleccionada.remove_at(0)



func _on_vida_1_pressed(extra_arg_0):
	alternarEstado(extra_arg_0)
	
func _on_vida_2_pressed(extra_arg_0):
	alternarEstado(extra_arg_0)

func _on_vida_3_pressed(extra_arg_0):
	alternarEstado(extra_arg_0)


func _on_vida_4_pressed(extra_arg_0):
	alternarEstado(extra_arg_0)
		

func _on_vida_5_pressed(extra_arg_0):
	alternarEstado(extra_arg_0)


func _on_restar_pressed(extra_arg_0):
	var node = get_node(extra_arg_0)
	node.vVida -=10





func _on_carril_1_slot_vida_pressed():
	pass # Replace with function body.
