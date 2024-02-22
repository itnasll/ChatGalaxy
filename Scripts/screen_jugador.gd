extends Node2D
signal fin_turno
var states: Dictionary = {}
@onready var Consol_Box:RichTextLabel = $".".get_node("Consol Box")

var contador_de_turno:int = 0

var palabra_sel : Array
const VDEs : String = "res://Scenes/cartaVida.tscn"
var escena_instanciada = preload(VDEs)
var cartajugada =[]
var store_jugada_enemiga = []
var store_efectos =[]
var yo_jugue:bool=false
var el_jugo:bool=false

@onready var carriles = $Carriles.get_node(".")

#enum EstadoSeleccionarCarta { SELECCIONADA, NOSELECCIONADA}
#enum EstadoRepartir { Estado1, Estado2 }
#var estadoRepartir = EstadoRepartir.Estado1
#var estadoSelCarta = EstadoSeleccionarCarta.NOSELECCIONADA
#enum estadoEspaciovidas {COMPLETAS, INCOMPLETAS}
#var vidasCompletasEstado = estadoEspaciovidas.INCOMPLETAS 
var vida_Maxenemigo :int = 5000
var vida_Maxjugador :int = 5000
var vida_enemigo :int = 5000
var vida_jugador :int = 5000

# Called when the node enters the scene tree for the first time.
func _ready():
	$Vidaenemigo.vVMax = vida_Maxenemigo
	$Vidajugador.vVMax = vida_Maxjugador

	$Almacen.mazoP = MazoSel.get_selected_deck()

#	aca hay que ponerle disparos al almacen 2
	$Almacen2.mazoP = MazoSel.get_selected_deck()
	
	repartida_inicial()
	contador_de_turno=1

func _process(_delta):
	$Vidaenemigo.vVida = vida_enemigo
	$Vidajugador.vVida = vida_jugador
	$textoVidaEnemigo.text = str(vida_enemigo)+"/"+str(vida_Maxenemigo)
	$textoVidaJugador.text = str(vida_jugador)+"/"+str(vida_Maxjugador)
	
	if el_jugo and yo_jugue:
		mostrarJugadaEnemiga()
		aplicar_efectos()
		termino()
		contador_de_turno+=1
		$Almacen.habilitar_mano()
		$Almacen2.habilitar_mano()



"""aplicar efectos"""
func aplicar_efectos():
	for efecto in store_efectos:
		print(efecto)

func termino():
	if  $Vidaenemigo.vVida <=0 and $Vidajugador.vVida <=0:
		$"../WinOLose".empate()
	elif $Vidajugador.vVida <=0:
		$"../WinOLose".ganador(false)
	elif  $Vidaenemigo.vVida <=0:
		$"../WinOLose".ganador(true)
		
func add_line(line):
	Consol_Box.add_text("\n" +"t: " + str(contador_de_turno) + " - "+ line)

func repartida_inicial():
	pass

""" deshabilitar el boton de fin de turno"""
func _on_fin_turno_pressed():
	
	if 	yo_jugue :
		add_line("espera tu turno, gil")
		return
	
	if cartajugada.size() ==0:
		return
	add_line("jugaste" + str(cartajugada))
	emit_signal("fin_turno")
	yo_jugue = true
	add_line("esperando Jugada")



func jugadaEnemiga(numero, texto):
	add_line("recibiste una jugada")
	store_jugada_enemiga= [numero,texto]
	el_jugo=true
	pass


func mostrarJugadaEnemiga():
	var numero =store_jugada_enemiga[0]
	var texto =store_jugada_enemiga[1]
	match numero:
		"1":
			var ubicacion = $vistaEnemigo.carril1.cartaNave
			ubicacion.poner_carta(texto)
			var vida = ubicacion.get_child(0).Valor.text
			$vistaEnemigo.carril1.barraVida.vVMax = int(vida)
			$vistaEnemigo.carril1.barraVida.vVida = int(vida)
		"2":
			var ubicacion = $vistaEnemigo.carril2.cartaNave
			ubicacion.poner_carta(texto)
			var vida = ubicacion.get_child(0).Valor.text
			$vistaEnemigo.carril2.barraVida.vVMax = int(vida)
			$vistaEnemigo.carril2.barraVida.vVida = int(vida)
		"3":
			var ubicacion = $vistaEnemigo.carril3.cartaNave
			ubicacion.poner_carta(texto)
			var vida = ubicacion.get_child(0).Valor.text
			$vistaEnemigo.carril3.barraVida.vVMax = int(vida)
			$vistaEnemigo.carril3.barraVida.vVida = int(vida)
		"4":
			var ubicacion = $vistaEnemigo.carril1.cartaDisparo
			ubicacion.poner_carta(texto)
		"5":
			var ubicacion = $vistaEnemigo.carril2.cartaDisparo
			ubicacion.poner_carta(texto)
		"6":
			var ubicacion = $vistaEnemigo.carril3.cartaDisparo
			ubicacion.poner_carta(texto)
	el_jugo=false
	#limpio buffer de mi jugada
	cartajugada = []
	yo_jugue=false
	pass
	

"""a las 3 funciones agregarle un comando para deshabilitar todo"""
func _on_carril_1_cartajugada(carta):
	print(carta.get_child(0).Nombre.text.to_lower())
	cartajugada = ["1", carta.get_child(0).Nombre.text.to_lower()]
	deshabilitarTodo()
	$Almacen.desabilitar_mano()
	$Almacen2.desabilitar_mano()

func _on_carril_2_cartajugada(carta):
	cartajugada = ["2", carta.get_child(0).Nombre.text.to_lower()]
	deshabilitarTodo()
	$Almacen.desabilitar_mano()
	$Almacen2.desabilitar_mano()

func _on_carril_3_cartajugada(carta):
	cartajugada = ["3", carta.get_child(0).Nombre.text.to_lower()]
	deshabilitarTodo()
	$Almacen.desabilitar_mano()
	$Almacen2.desabilitar_mano()

func _on_carril_1_carta_disparojugada(carta):
	cartajugada = ["4", carta.get_child(0).Nombre.text.to_lower()]
	deshabilitarTodo()
	$Almacen.desabilitar_mano()
	$Almacen2.desabilitar_mano()

func _on_carril_2_carta_disparojugada(carta):
	cartajugada = ["5", carta.get_child(0).Nombre.text.to_lower()]
	deshabilitarTodo()
	$Almacen.desabilitar_mano()
	$Almacen2.desabilitar_mano()

func _on_carril_3_carta_disparojugada(carta):
	cartajugada = ["6", carta.get_child(0).Nombre.text.to_lower()]
	deshabilitarTodo()
	$Almacen.desabilitar_mano()
	$Almacen2.desabilitar_mano()
	
"""la carta deberia devolver a la mano segun el tipo no segun donde jugo"""
"""revisar esto"""
func _on_deshacer_pressed():
	var textureNave = preload("res://Assets/Imagenes/cartavacia-vida (Personalizado).png")
	var textureDisparo = preload("res://Assets/Imagenes/cartavacia - disparo (Personalizado).png")
	if cartajugada.size() >0:
		match cartajugada[0]:
			"1":
				$Carriles/Carril1.get_node("cartaVida").quitar_carta()
				$Carriles/Carril1.get_node("cartaVida").poner_textura(textureNave)
				$Carriles/Carril1.get_node("Barra de Vida").vVida = 0
				$Almacen.dar_carta(cartajugada[1])
			"2":
				$Carriles/Carril2.get_node("cartaVida").quitar_carta()
				$Carriles/Carril2.get_node("cartaVida").poner_textura(textureNave)
				$Carriles/Carril2.get_node("Barra de Vida").vVida = 0
				$Almacen.dar_carta(cartajugada[1])
			"3":
				$Carriles/Carril3.get_node("cartaVida").quitar_carta()
				$Carriles/Carril3.get_node("cartaVida").poner_textura(textureNave)
				$Carriles/Carril3.get_node("Barra de Vida").vVida = 0
				$Almacen.dar_carta(cartajugada[1])
			"4":
				$Carriles/Carril1.get_node("cartaAtaque").quitar_carta()
				$Carriles/Carril1.get_node("cartaAtaque").poner_textura(textureDisparo)
				$Almacen2.dar_carta(cartajugada[1])
			"5":
				$Carriles/Carril2.get_node("cartaAtaque").quitar_carta()
				$Carriles/Carril2.get_node("cartaAtaque").poner_textura(textureDisparo)
				$Almacen2.dar_carta(cartajugada[1])
			"6":
				$Carriles/Carril3.get_node("cartaAtaque").quitar_carta()
				$Carriles/Carril3.get_node("cartaAtaque").poner_textura(textureDisparo)
				$Almacen2.dar_carta(cartajugada[1])
#		habilitarTodo()
		cartajugada = []
		$Almacen.habilitar_mano()
		$Almacen2.habilitar_mano()
	pass # Replace with function body.

func deshabilitarTodo():
	$Carriles/Carril1.deshabilitar_todo()
	$Carriles/Carril2.deshabilitar_todo()
	$Carriles/Carril3.deshabilitar_todo()

func habilitarTodo():
	$Carriles/Carril1.habilitar_todo()
	$Carriles/Carril2.habilitar_todo()
	$Carriles/Carril3.habilitar_todo()


func _on_client_carta_recibida():
	cartajugada = []
	pass # Replace with function body.
