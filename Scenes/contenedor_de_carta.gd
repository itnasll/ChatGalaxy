extends Control
signal CartaPresionada
@onready var pre_carta = preload("res://Scenes/card.tscn")

@export var estaSeleccionada: bool = false
var goldBorder =preload("res://Assets/Imagenes/Gold_Border.png")
var original_scale = Vector2(1, 1)
##poner texturebutton aca con el cuadro rojo y dorado
func _ready():

	original_scale = scale

func _process(_delta):
	if estaSeleccionada:
		$BotonDeCarta.texture_normal = goldBorder
	else:
		$BotonDeCarta.texture_normal = null

func _on_mouse_entered():
#	z_index = 1
#	$BotonDeCarta.get_child(0).z_index = 2
#	$BotonDeCarta.get_child(0).get_node("Imagen").z_index = 0
#	scale = Vector2(1.3, 1.3)
	pass # Replace with function body.

#
func _on_mouse_exited():
#	z_index = 0
#	$BotonDeCarta.get_child(0).z_index = 0
#	$BotonDeCarta.get_child(0).get_node("Imagen").z_index = -1
#	scale = original_scale

	pass # Replace with function body.


func _on_boton_de_carta_pressed():
	emit_signal("CartaPresionada",self)
	pass # Replace with function body.


