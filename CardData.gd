extends Resource

class_name CardData

@export var id : String
@export var nombre : String
@export var clases : Clases
@export var imagen : Texture
@export var base : Texture
@export var valor : int
@export var descripcion : String
@export var efecto: Array
@export var clasificacion : Clasificacion
@export var NaveODistparo : Que_es

enum Que_es{
	NAVE,
	DISPARO
}

enum Clasificacion{
	S,
	A,
	B,
	C,
	D
}

enum Clases{
	Estelaris_Confederados,
	Alianza_Galáctica,
	Imperio_Celestial,
	Orden_de_Orion,
	Federación_Nebular
}

