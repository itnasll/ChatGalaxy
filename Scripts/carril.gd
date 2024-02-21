extends VBoxContainer
signal Slot_vida_pressed
signal cartajugada(carta)
signal cartaDisparojugada(carta)
var texDisaNave = preload("res://Assets/Imagenes/cartadeshabilitada-vida.png")
var texDisaDisp = preload("res://Assets/Imagenes/carta deshabilitada - disparo.png")
var texDisaVac = preload("res://Assets/Imagenes/red_Border.png")
#
#@onready var espacioCartaVida = $EspacioCartaVida
#@onready var espacioCartaAtaque = $EspacioCartaAtaque
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if $cartaVida.get_child_count() == 1:
		$cartaVida.get_node("BotonDeCarta").texture_disabled = texDisaNave
	else:
		$cartaVida.get_node("BotonDeCarta").texture_disabled = texDisaVac
	if $cartaAtaque.get_child_count() == 1:
		$cartaAtaque.get_node("BotonDeCarta").texture_disabled = texDisaDisp
	else:
		$cartaAtaque.get_node("BotonDeCarta").texture_disabled = texDisaVac
	pass
#	if espacioCartaVida.get_child_count() == 2:
#		if $"Barra de Vida".vVida <= 0:
#				espacioCartaVida.get_child(1).free()
#				$EspVida.disabled = false
#	pass
#
#	if $EspYCarta.get_child_count() == 1:
#			if $"Barra de Vida".vVida <= 0:
#				$EspVida.get_child(0).free()
#
#
#	if $botonAreaAtaque.get_child_count() > 0 :
#		$botonAreaAtaque.disabled = true
#	else:
#		$botonAreaAtaque.disabled = false


func _on_accion_pressed():
	$cartaAtaque.borde_rojo()


	
func jugar_carta(ruta_mano, asd):
	var almacen = get_node(ruta_mano+"/Mano")
	for i in almacen.get_children():
		if i.estaSeleccionada:
			var testo_i = i.get_node("Card")
			asd.poner_carta(testo_i.Nombre.text.to_lower())
			
			"""solopara vida cambiar"""
			var valor = int(testo_i.Valor.text)
			
			var almacen2 = get_node(ruta_mano)
			almacen2.carta_jugada()
			return valor
			

func _on_carta_vida_carta_presionada(asd):
	var valor = jugar_carta("../../Almacen", asd)
	$"Barra de Vida".vVida = valor
	$"Barra de Vida".vVMax = valor
	emit_signal("cartajugada", asd)
	pass # Replace with function body.


func _on_carta_ataque_carta_presionada(asd):
	if $cartaVida.tiene_carta:
		jugar_carta("../../Almacen2", asd)
		print("ataque")
		emit_signal("cartaDisparojugada", asd)
	pass # Replace with function body.

func deshabilitar_todo():
	$cartaAtaque.borde_rojo()
	$cartaVida.borde_rojo()

func habilitar_todo():
	$cartaAtaque.habilitar()
	$cartaVida.habilitar()
	
	
	
