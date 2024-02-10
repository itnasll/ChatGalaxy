extends ScrollContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func nueva_carta(asd):
	var lugar = $VBoxContainer
	var una_carta = preload("res://Scenes/una_carta_en_mazo.tscn").instantiate()
	
	una_carta.carta_rec = load(asd)
	lugar.add_child(una_carta)

func esta_o_no_esta(testo):
	for x in $VBoxContainer.get_children():
		if x.lbl_nombreCarta.text == testo:
			x.cantidad += 1
			return true
	return false

func devolver_mazo():
	var clave = self.name
	var valor = []
	for x in $VBoxContainer.get_children():
		valor.append([x.lbl_nombreCarta.text, x.cantidad])
	return [clave, valor]

func chequear_condiciones_de_mazo():
	#crear funcion para verificar que se cumplan las condiciones de cantidades y tipos de cartas
	#ejemplo 20 naves 10 disparos, no mas de 3 S
	pass
