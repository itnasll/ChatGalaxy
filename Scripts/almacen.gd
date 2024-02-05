extends Node2D

#@onready var p_1 = $Mano/P1
@onready var pre_carta = preload("res://Scenes/cartaVida.tscn")
signal envioPalabra(argu:Node)
var palabra_sel : Array
enum EstadoSeleccionarCarta { SELECCIONADA, NOSELECCIONADA, DESHABILITADAS}
enum EstadoRepartir { Estado1, Estado2 }
var estadoRepartir = EstadoRepartir.Estado1
var estadoSelCarta = EstadoSeleccionarCarta.NOSELECCIONADA
@export var mazoP = [
	'Perro', 'Casa', 'Jardín', 'Montaña', 'Libro', 'Computadora',
	'Felicidad', 'Playa', 'Viaje', 'Amistad', 'Guitarra', 'Café',
	'Aventura', 'Arte', 'Tiempo', 'Sueño', 'Chocolate', 'Estrella',
	'Mariposa', 'Silencio'
]
# Called when the node enters the scene tree for the first time.

func _process(_delta):
	$Mano.columns = $Mano.get_child_count() + 1
	match estadoSelCarta:
		EstadoSeleccionarCarta.SELECCIONADA:
			for j in $Mano.get_children():
				if j.estaSeleccionada:
					var mi_textura = load("res://Assets/Gold_Border.png")
					j.get_child(0).set_texture_normal(mi_textura)
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
	
#func _on_palabra_enviada():
#	print("palabra")
#	print("chau")
# Called every frame. 'delta' is the elapsed time since the previous frame.

func cambiar_no_seleccionada():
	var cartasEnGrupo = get_tree().get_nodes_in_group("almacenes")
	for carta in cartasEnGrupo:
			carta.estadoSelCarta = EstadoSeleccionarCarta.NOSELECCIONADA
	

func _on_entrega_palabra_pressed():
	var texture = preload("res://Assets/Imagenes/corazon.svg")
	var cartaNueva = pre_carta.instantiate()
	cartaNueva.add_to_group("manoDeeCartasGrupo")
	cartaNueva.get_child(0).get_node("Imagen").set_texture(texture)
	cartaNueva.size.x = 90
	cartaNueva.size.y = 10
	
	cartaNueva.connect("enviaCarta",_on_botun_presed)
	$Mano.add_child(cartaNueva)

func _on_botun_presed(asd):
	if asd.get_parent().get_name() == "Mano":
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
		
