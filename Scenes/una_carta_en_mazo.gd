extends HBoxContainer

@onready var carta = $Panel/Card
@onready var lbl_nombreCarta = $Etiquetas/nombreCarta
@onready var lbl_cantidad = $Etiquetas/cantidad
@onready var lbl_tipo = $Etiquetas2/lbl_tipo
@onready var lbl_clasificacion = $Etiquetas2/lbl_clasificacion

# Called when the node enters the scene tree for the first time.
@export var cantidad : int = 1
@export var carta_rec = preload("res://Recursos/probando.res")

func _ready():
	carta.Card = carta_rec
	carta.cargar_data()
	lbl_nombreCarta.text = carta.Nombre.text
	lbl_tipo.text = carta.clases_String()
	lbl_clasificacion.text = carta.clasificacion_String()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	lbl_cantidad.text = str(cantidad )
	
	if cantidad == 0:
		self.queue_free()
	pass



func _on_menos_pressed():
	if cantidad > 0:
		cantidad -= 1
	pass # Replace with function body.


func _on_mas_pressed():
	cantidad += 1
	pass # Replace with function body.


