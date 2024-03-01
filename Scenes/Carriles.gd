extends HBoxContainer

class_name  Carriles
var carriles:Array[Carril]

# Called when the node enters the scene tree for the first time.
func _ready():
	
	for nodo in self.get_children():
		carriles.append(nodo as Carril)
	deshabilitar_todo()

func habilitar_todo():
	for carril in carriles:
		carril.habilitar_todo()

func deshabilitar_todo():
	for carril in carriles:
		carril.deshabilitar_todo()


func habilitar_espacios_naves():
	for carril in carriles:
		var espacio_carta = carril.get_node("cartaVida")
		if !espacio_carta.tiene_carta:
			carril.habilitar_espacio_nave()
	pass
	
func deshabilitar_espacios_naves():
	for carril in carriles:
		carril.deshabilitar_espacio_nave()
	pass
	
func habilitar_espacios_disparos():
	for carril in carriles:
		var espacio_disparo = carril.get_node("cartaAtaque")
		var espacio_nave = carril.get_node("cartaVida")
		if !espacio_disparo.tiene_carta and espacio_nave.tiene_carta:
			carril.habilitar_espacio_disparo()
	pass	
func deshabilitar_espacios_disparos():
	for carril in carriles:
		carril.deahabilitar_espacio_disparo()
	pass
