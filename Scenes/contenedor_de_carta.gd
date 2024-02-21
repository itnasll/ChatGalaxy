extends Control
signal CartaPresionada( asd )
@onready var pre_carta = preload("res://Scenes/card.tscn")

@export var estaSeleccionada: bool = false
var goldBorder =preload("res://Assets/Imagenes/Gold_Border.png")
var original_scale = Vector2(1, 1)
var tiene_carta = false

##poner texturebutton aca con el cuadro rojo y dorado
func _ready():
	original_scale = scale

func _process(_delta):
	#esto mismo hace que quede en dorado
#	if estaSeleccionada:
#		$BotonDeCarta.texture_normal = goldBorder
	pass
		#$BotonDeCarta.texture_normal = null

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
	emit_signal("CartaPresionada", self)
	pass # Replace with function body.


func poner_carta(texto):
	var carta = preload("res://Scenes/card.tscn").instantiate()
	carta.Card = load("res://Recursos/"+texto+".res")
	carta.cargar_data()
	$".".add_child(carta)
	$BotonDeCarta.texture_normal = null
	$".".move_child($Card, 0)
	tiene_carta = true
#	$TabContainer/Naves/ScrollContainer/GridContainer.add_child(carta)

func quitar_carta():
	if self.get_child_count() == 2:
		$".".remove_child($Card)
		tiene_carta = false

func borde_dorado():
	$BotonDeCarta.texture_normal =  goldBorder

func borde_rojo():
	$BotonDeCarta.disabled = true

func limpiar_textura():
	$BotonDeCarta.texture_normal = null
	$BotonDeCarta.disabled = false

func poner_textura(testura):
	$BotonDeCarta.texture_normal = testura

func habilitar():
	$BotonDeCarta.disabled = false
