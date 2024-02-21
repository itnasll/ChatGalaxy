extends Control

var peerJ :WebSocketPeer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_web_socket_server_client_connected(peer: WebSocketPeer, id, protocol):
	print("client" + str(id)+ "conected with protocol: " + protocol)
	#peer.send_text("hello Wold Welcome!")
	$esperando.visible = false
	$ScreenJugador.visible = true
	peerJ = peer 
	pass # Replace with function body.


func _on_web_socket_server_text_received(peer: WebSocketPeer, _id, message):
	print("Message from: " + peer.get_connected_host(), "message " + message)
	var testo = message
	var testo2 = JSON.parse_string(testo)
	print(testo2[0], " y ", testo2[1])
	$ScreenJugador.jugadaEnemiga(str(testo2[0]), testo2[1])
	pass # Replace with function body.


func _on_button_pressed():
	$WebSocketServer.send_text("enviado desde Servidor")
	pass # Replace with function body.


func _on_screen_jugador_fin_turno():
	print($ScreenJugador.cartajugada)
	$WebSocketServer.send_text(str($ScreenJugador.cartajugada))
	pass # Replace with function body.
