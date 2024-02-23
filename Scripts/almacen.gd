extends Node2D

enum ALMACEN_TIPOS {
	NAVES,
	DISPAROS
}

@export var tipo_de_almacen:ALMACEN_TIPOS
#@onready var p_1 = $Mano/P1
#@onready var pre_carta = preload("res://Scenes/cartaVida.tscn")
signal envioPalabra(argu:Node)
var palabra_sel : Array
enum EstadoSeleccionarCarta { SELECCIONADA, NOSELECCIONADA, DESHABILITADAS}
enum EstadoRepartir { Estado1, Estado2 }
var estadoRepartir = EstadoRepartir.Estado1
var estadoSelCarta = EstadoSeleccionarCarta.NOSELECCIONADA
@export var mazoP = ["probando", "carlost","probando", "carlost","probando", "carlost"]

@onready var pre_carta = preload("res://Scenes/card.tscn")
@onready var mis_cartas = preload("res://Scenes/contenedor_de_carta.tscn")
# Called when the node enters the scene tree for the first time.

func _process(_delta):
	$Mano.columns = $Mano.get_child_count() + 1
	match estadoSelCarta:
		EstadoSeleccionarCarta.SELECCIONADA:
			for j in $Mano.get_children():
				if j.estaSeleccionada:
					j.borde_dorado()
				else:
					j.get_child(0).texture_normal = null
					j.get_child(0).disabled = true
			var cartasEnGrupo = get_tree().get_nodes_in_group("almacenes")
			for carta in cartasEnGrupo:
				if carta != self:
					carta.estadoSelCarta = EstadoSeleccionarCarta.DESHABILITADAS
			#el otro almacen deberia cambiar el estado a deshabilitadas
		EstadoSeleccionarCarta.NOSELECCIONADA:
			for j in $Mano.get_children():
				j.get_child(0).texture_normal = null
				j.get_child(0).disabled = false
		EstadoSeleccionarCarta.DESHABILITADAS:
			for j in $Mano.get_children():
				j.get_child(0).texture_normal = null
				j.get_child(0).disabled = true
func _ready():
	#$GridContainer/P1.connect("palabra_enviada",  Callable(self, "_on_palabra_enviada"))
	pass

func desabilitar_mano():
	estadoSelCarta = EstadoSeleccionarCarta.DESHABILITADAS

func habilitar_mano():
	estadoSelCarta = EstadoSeleccionarCarta.NOSELECCIONADA

func cambiar_no_seleccionada():
	var cartasEnGrupo = get_tree().get_nodes_in_group("almacenes")
	for carta in cartasEnGrupo:
			carta.estadoSelCarta = EstadoSeleccionarCarta.NOSELECCIONADA
	


func dar_carta(nombre):
	var carta_nueva = pre_carta.instantiate() 
	carta_nueva.Card = load("res://Recursos/"+nombre.to_lower()+".res")
	carta_nueva.cargar_data()
	var carta = mis_cartas.instantiate()
	carta.add_child(carta_nueva)
	carta.add_to_group("manoDeeCartasGrupo")
	carta.connect("CartaPresionada",_on_botun_presed)
	$Mano.add_child(carta)
#funcion que elimina la carta selecionada
func carta_jugada():
	var cartasEnGrupo = get_tree().get_nodes_in_group("almacenes")
	for al in cartasEnGrupo:
		for carta in al.get_child(0).get_children():
			if carta.estaSeleccionada:
				carta.queue_free()
				for x in cartasEnGrupo:
					x.estadoSelCarta = EstadoSeleccionarCarta.NOSELECCIONADA
#	estadoSelCarta = EstadoSeleccionarCarta.NOSELECCIONADA

func _on_botun_presed(asd):
	if asd.get_parent().get_name() == "Mano":
		carta_seleccionada()
#		print("el padreses__", asd.get_parent())
		if asd.estaSeleccionada:
			asd.estaSeleccionada = false
			estadoSelCarta = EstadoSeleccionarCarta.NOSELECCIONADA
			var cartasEnGrupo = get_tree().get_nodes_in_group("almacenes")
			for carta in cartasEnGrupo:
				if carta != self:
					carta.estadoSelCarta = EstadoSeleccionarCarta.NOSELECCIONADA
		else:
			asd.estaSeleccionada = true
			estadoSelCarta = EstadoSeleccionarCarta.SELECCIONADA
			
			
func carta_seleccionada():
	if tipo_de_almacen == ALMACEN_TIPOS.NAVES:
		$"../Carriles".habilitar_espacios_naves()
		pass
	elif tipo_de_almacen == ALMACEN_TIPOS.DISPAROS:
		$"../Carriles".habilitar_espacios_disparos()
		pass
		
	pass
		
