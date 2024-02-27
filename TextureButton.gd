extends TextureButton

enum tipo{
	NAVE,
	DISPARO
}

@export var tipo_de_mazo: tipo
var mazo
var texture 
var mazo2 =[]
# Called when the node enters the scene tree for the first time.
func _ready():
	mazo = MazoSel.get_selected_deck()
	if tipo_de_mazo == tipo.NAVE :
		texture = preload("res://Assets/Imagenes/cartaTraseraNave.png")
		for x in mazo:
			if CartasColeccion.esNave(x):
				mazo2.append(x)
	else:
		texture = preload("res://Assets/Imagenes/cartaTraseraDisparo.png")
		for x in mazo:
			if CartasColeccion.esDisparo(x):
				mazo2.append(x)
	var posiX = 0
	for carta in mazo2:
		var imagen_carta = TextureRect.new()
		imagen_carta.texture = texture
		$".".add_child(imagen_carta)
		imagen_carta.position.y = posiX
		posiX += 5
	mazo2.shuffle()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if mazo2.size() == 0:
		$".".disabled = true
		if tipo_de_mazo == tipo.DISPARO:
			var texxture = preload("res://Assets/Imagenes/carta deshabilitada - disparo.png")
			$".".texture_normal = texxture
		else:
			var texxture = preload("res://Assets/Imagenes/cartadeshabilitada-vida.png")
			$".".texture_normal = texxture
	pass


func _on_pressed():
	$".".get_child(0).queue_free()
	$"..".dar_carta(mazo2[0])
	mazo2.remove_at(0)
	pass # Replace with function body.
