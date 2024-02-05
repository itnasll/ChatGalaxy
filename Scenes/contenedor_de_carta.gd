extends Control

@onready var pre_carta = preload("res://Scenes/card.tscn")

@export var estaSeleccionada: bool = false

var original_scale = Vector2(1, 1)
##poner texturebutton aca con el cuadro rojo y dorado
func _ready():
	var carta_nueva = pre_carta.instantiate() 
	carta_nueva.Card = load("res://Recursos/probando.res")
	carta_nueva.cargar_data()
#	var carta_nueva = pre_carta.instantiate() 
	$BotonDeCarta.add_child(carta_nueva)
	original_scale = scale


func _on_mouse_entered():
	z_index = 1
	$BotonDeCarta.get_child(0).z_index = 2
	$BotonDeCarta.get_child(0).get_node("Imagen").z_index = 0
	scale = Vector2(1.3, 1.3)
	pass # Replace with function body.


func _on_mouse_exited():
	z_index = 0
	$BotonDeCarta.get_child(0).z_index = 0
	$BotonDeCarta.get_child(0).get_node("Imagen").z_index = -1
	scale = original_scale
	
	pass # Replace with function body.
