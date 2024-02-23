extends Sprite2D

@export var Card : CardData

@export_category("Card Elements")
@export var Background : Sprite2D
@export var Imagen : Sprite2D
@export var Nombre : Label
@export var Valor : Label
@export var Descripcion : RichTextLabel

@export var aide : String

@export var efectos : Array

const clas = preload("res://CardData.gd")
@export var clasificacion : clas.Clasificacion
@export var tipo : clas.Clases

@export var is_selected : bool = false

#cambiar a init...
func cargar_data():
	Background.texture = Card.base
	Imagen.texture = Card.imagen
	Nombre.text = Card.nombre
	Valor.text = str(Card.valor)
	Descripcion.text = Card.descripcion
	clasificacion = Card.clasificacion
	tipo = Card.clases
	efectos = Card.efecto
	aide = Card.id

func clases_String():
	match tipo:
		0:
			return("Estelaris Confederados")
		1:
			return("Alianza Galáctica")
		2:
			return("Imperio Celestial")
		3:
			return("Orden de Orion")
		4:
			return("Federación Nebular")

func clasificacion_String():
	match clasificacion:
		0:
			return("S")
		1:
			return("A")
		2:
			return("B")
		3:
			return("C")
		4:
			return("D")
			
func _ready():
	
	pass
	
func atacar():
	var valorDeAtaque = int(Valor.text)
	var padre = self.get_parent().get_parent()
	print(padre)
	print(padre.get_parent())
	var enemigos = self.get_parent().get_parent().get_parent().get_parent().get_node("vistaEnemigo")
	if padre.name == "Carril1":
		if enemigos.carril1.cartaNave.tiene_carta:
			enemigos.carril1.barraVida.vVida -= valorDeAtaque
		else:
			self.get_parent().get_parent().get_parent().get_parent().vida_jugador -= valorDeAtaque
	if padre.name == "Carril2":
		if enemigos.carril2.cartaNave.tiene_carta:
			enemigos.carril2.barraVida.vVida -= valorDeAtaque
		else:
			self.get_parent().get_parent().get_parent().get_parent().vida_jugador -= valorDeAtaque
	if padre.name == "Carril3":
		if enemigos.carril3.cartaNave.tiene_carta:
			enemigos.carril3.barraVida.vVida -= valorDeAtaque
		else:
			self.get_parent().get_parent().get_parent().get_parent().vida_jugador -= valorDeAtaque
#	if padre.get_parent().name =="CarrilEnemigo":
		
