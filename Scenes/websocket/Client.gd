extends Control

signal cartaRecibida

var estado

enum EstadosCliente{
	JUGANDO,
	EPERANDO_JUGADA
}

# Called when the node enters the scene tree for the first time.
func _ready():
	estado = EstadosCliente.JUGANDO
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

"""crear regex para identificar [numero, texto]"""
func _on_web_socket_client_text_received(_peer: WebSocketPeer, message: String):
#	print("recived from: " + peer.get_connected_host(), " message: " + message)
	var testo = message
	var testo2 = JSON.parse_string(testo)
#	print(testo2[0], " y ", testo2[1])
	$ScreenJugador.jugadaEnemiga(str(testo2[0]), testo2[1])
	estado = EstadosCliente.JUGANDO

func _on_button_pressed():
	$WebSocketClient.send_text("enviado desde cliente")
	pass # Replace with function body.


func _on_screen_jugador_fin_turno():
	
	if estado==EstadosCliente.EPERANDO_JUGADA:
		return
		
#	print($ScreenJugador.cartajugada)
	$WebSocketClient.send_text(str($ScreenJugador.cartajugada))
	emit_signal("cartaRecibida")
	
	estado = EstadosCliente.EPERANDO_JUGADA

	
	pass # Replace with function body.
