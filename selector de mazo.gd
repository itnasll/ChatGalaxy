extends Control

var mazos = load("res://Recursos/Mazo.tres")
@onready var nombremazo = $HBoxContainer/CenterContainer/VBoxContainer/NombreMazo
var nro_mazo = 0
var jotason = mazos.cargar_mazos()
var llaves = jotason.keys()
var maximo = len(llaves)-1
@onready var cartainstancia = $HBoxContainer/CenterContainer/VBoxContainer/CartaRepresenta/Card
# Called when the node enters the scene tree for the first time.
func _ready():
	nombremazo.text =str( llaves[nro_mazo])
	print("la primer carta es :  ", jotason[llaves[nro_mazo]][0][0])
	var cartarecurso = load("res://Recursos/"+jotason[llaves[nro_mazo]][0][0].to_lower()+".res")
	cartainstancia.Card = cartarecurso
	cartainstancia.cargar_data()
	pass # Replace with function body.
#
#for mazo in mazosss:
#		var newMazo = tabmazo.instantiate()
#		newMazo.name = mazo
#		$VistaMazos.add_child(newMazo)
#		for cartas in mazosss[mazo]:
#			var carta = load("res://Recursos/"+cartas[0]+".res")
#			var vistaCarta = preload("res://Scenes/una_carta_en_mazo.tscn").instantiate()
#			vistaCarta.carta_rec = carta
#			vistaCarta.cantidad = cartas[1]
#			newMazo.get_child(0).scale = Vector2(0.8,0.8)
#			newMazo.get_child(0).add_child(vistaCarta)
#		pass

func _on_cambiarder_pressed():
	if nro_mazo == maximo:
		nro_mazo = 0
		nombremazo.text =str( llaves[nro_mazo])
		var cartarecurso = load("res://Recursos/"+jotason[llaves[nro_mazo]][0][0].to_lower()+".res")
		cartainstancia.Card = cartarecurso
		cartainstancia.cargar_data()
	else:
		nro_mazo += 1
		nombremazo.text =str( llaves[nro_mazo])
		var cartarecurso = load("res://Recursos/"+jotason[llaves[nro_mazo]][0][0].to_lower()+".res")
		cartainstancia.Card = cartarecurso
		cartainstancia.cargar_data()

func _on_cambiariz_pressed():
	if nro_mazo == 0:
		nro_mazo = maximo
		nombremazo.text =str( llaves[nro_mazo])
		var cartarecurso = load("res://Recursos/"+jotason[llaves[nro_mazo]][0][0].to_lower()+".res")
		cartainstancia.Card = cartarecurso
		cartainstancia.cargar_data()
	else:
		nro_mazo -= 1
		nombremazo.text =str( llaves[nro_mazo])
		var cartarecurso = load("res://Recursos/"+jotason[llaves[nro_mazo]][0][0].to_lower()+".res")
		cartainstancia.Card = cartarecurso
		cartainstancia.cargar_data()
