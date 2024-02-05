extends Sprite2D

@export var Card : CardData

@export_category("Card Elements")
@export var Background : Sprite2D
@export var Imagen : Sprite2D
@export var Nombre : Label
@export var Valor : Label
@export var Descripcion : RichTextLabel

#@export var id : String
#@export var tipo : String
#@export var efecto : String
#@export var clasificacion : String

func cargar_data():
	Background.texture = Card.base
	Imagen.texture = Card.imagen
	Nombre.text = Card.nombre
	Valor.text = str(Card.valor)
	Descripcion.text = Card.descripcion
	var _clasificacion = Card.clasificacion
	var _tipo = Card.clases
	var _efectos = Card.efecto
	var _aide = Card.id


func _ready():
	
	pass
	
