extends Sprite2D

class_name Carta
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

var objetivo : Vida2

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

func atacar2(valor):
	objetivo -= valor

func establecer_objetivo(objetivo2: Vida2):
	if objetivo2.vVida <= 0:
		objetivo = self.get_parent().get_parent().get_parent().get_parent().get_node("Vidajugador")
		print(objetivo, "vidaas")
	else:
		objetivo = objetivo2
		print(objetivo, "sdf")

func atacar3(atacante : Carta, disparo : Carta, objetivo: Carta):
	var valor_ataque_inicial = int(disparo.Valor.text)
	var vida_objetivo = int(objetivo.Valor.text)
	var clase_atacante = atacante.tipo
	var clase_disparo = disparo.tipo
	var clase_objetivo = objetivo.tipo
	
	var modificador_uno = modificador(clase_atacante, clase_objetivo)
	var modificador_dos = modificador(clase_disparo, clase_objetivo)
	
	pass

func modificador(cl1, cl2):
	"""arrai_modificador = EstConf, AlGalá,  ImpeCel, OdeO, FeNeb"""
	var arrai_modificador
	match cl1:
		0:
			arrai_modificador = ["x1", "x2", "/2", "x3", "/3"]
			#return("Estelaris Confederados")
		1:
			arrai_modificador = ["/3", "x1", "x2", "/2", "x3"]
			#return("Alianza Galáctica")
		2:
			arrai_modificador = ["x3", "/3", "x1", "x2", "/2"]
			#return("Imperio Celestial")
		3:
			arrai_modificador = ["/2", "x3", "/3", "x1", "x2"]
			#return("Orden de Orion")
		4:
			arrai_modificador = ["x2", "/2", "x3", "/3", "x1"]
			#return("Federación Nebular")
	match  cl2:
		0:
			return arrai_modificador[0]
		1:
			return arrai_modificador[1]
		2:
			return arrai_modificador[2]
		3:
			return arrai_modificador[3]
		4:
			return arrai_modificador[4]
	pass
