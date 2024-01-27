extends Node2D
@onready var p_2 = $GridContainer/P2
@onready var p_3 = $GridContainer/P3
@onready var p_4 = $GridContainer/P4
@onready var p_5 = $GridContainer/P5
@onready var p_1 = $GridContainer/P1
signal envioPalabra(argu:Node)
var mazoP = [
	'Perro', 'Casa', 'Jardín', 'Montaña', 'Libro', 'Computadora',
	'Felicidad', 'Playa', 'Viaje', 'Amistad', 'Guitarra', 'Café',
	'Aventura', 'Arte', 'Tiempo', 'Sueño', 'Chocolate', 'Estrella',
	'Mariposa', 'Silencio'
]
# Called when the node enters the scene tree for the first time.
func _ready():
	#$GridContainer/P1.connect("palabra_enviada",  Callable(self, "_on_palabra_enviada"))
	pass
	
#func _on_palabra_enviada():
#	print("palabra")
#	print("chau")
# Called every frame. 'delta' is the elapsed time since the previous frame.



func _on_entrega_palabra_pressed():
	if p_1.get_node("Label").text == "":
		p_1.get_node("Label").text = mazoP.pick_random()
	elif p_2.get_node("Label").text == "":
		p_2.get_node("Label").text = mazoP.pick_random()
	elif p_3.get_node("Label").text == "":
		p_3.get_node("Label").text = mazoP.pick_random()
	elif p_4.get_node("Label").text == "":
		p_4.get_node("Label").text = mazoP.pick_random()
	elif p_5.get_node("Label").text == "":
		p_5.get_node("Label").text = mazoP.pick_random()
	else:
		$EntregaPalabra.disabled = true

func jugarPalabra(argu):
	#crear un nodo label ingresar text argumento y devolverlo en la señal de este
	var nLabel = Label.new()
	nLabel.text = argu
	emit_signal("envioPalabra", nLabel)


func _on_p_1_palabra_enviada(argumento):
	jugarPalabra(argumento)


func _on_p_2_palabra_enviada(argumento):
	jugarPalabra(argumento)

func _on_p_3_palabra_enviada(argumento):
	jugarPalabra(argumento)

func _on_p_4_palabra_enviada(argumento):
	jugarPalabra(argumento)


func _on_p_5_palabra_enviada(argumento):
	jugarPalabra(argumento)
