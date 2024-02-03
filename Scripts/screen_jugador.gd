extends Node2D

var states: Dictionary = {}
#@onready var carta_vida = $HBoxContainer/CartaVida
#@onready var carta_vida_2 = $HBoxContainer/CartaVida2
#@onready var carta_vida_3 = $HBoxContainer/CartaVida3
var vida1 : Array = []
var vida2 : Array = []
var palabra_sel : Array
const VDEs : String = "res://Scenes/cartaVida.tscn"
var escena_instanciada = preload(VDEs)

enum EstadoSeleccionarCarta { SELECCIONADA, NOSELECCIONADA}
enum EstadoRepartir { Estado1, Estado2 }
var estadoRepartir = EstadoRepartir.Estado1
#var estadoSelCarta = EstadoSeleccionarCarta.NOSELECCIONADA
enum estadoEspaciovidas {COMPLETAS, INCOMPLETAS}
#var vidasCompletasEstado = estadoEspaciovidas.INCOMPLETAS 

# Called when the node enters the scene tree for the first time.
func _ready():

	# Llena los arrays con números en el rango del 60 al 350
	for i in range(60, 360, 15):
		vida1.append(i)
	for j in range(75, 375, 15):
		vida2.append(j)
