extends HBoxContainer

var carriles:Array[Node]

# Called when the node enters the scene tree for the first time.
func _ready():
	carriles = get_children()
	carriles=get_children()
	deshabilitar_todo()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

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
