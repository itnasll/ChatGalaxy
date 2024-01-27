extends Node2D

@onready var host = $Host
@onready var join = $Join
@onready var username = $Username
@onready var send = $Send
@onready var message = $Message
@onready var messages = $Messages
@onready var en_msg = $EnMSG
@onready var my_msg = $MyMSG

var usrnm : String
var msg : String
			
func _ready():
	$vidaE.vColor = "Red"
	$vidaM.vColor = "Green"

func _process(delta):
	$TLeft.text = "%s" % roundf($Timer.time_left)

func _on_host_pressed():
	var peer = ENetMultiplayerPeer.new()
	peer.create_server(1027)
	get_tree().set_multiplayer(SceneMultiplayer.new(), self.get_path())
	multiplayer.multiplayer_peer = peer
	joined()



func _on_join_pressed():
	var peer = ENetMultiplayerPeer.new()
	peer.create_client("127.0.0.1",1027)
	get_tree().set_multiplayer(SceneMultiplayer.new(), self.get_path())
	multiplayer.multiplayer_peer = peer
	joined()

	
func _on_send_pressed():
	rpc("msg_rpc",usrnm, message.text)
	message.text = ""
	
	
@rpc("any_peer","call_local")
func msg_rpc(usrnm,data):
	messages.text += str(usrnm, ":", data,"\n")
	messages.scroll_vertical = INF
	if usrnm == username.text:
		my_msg.text += str(data, "\n")
		my_msg.scroll_vertical = INF
		for i in data:
			$vidaE.vVida -= 1
	else:
		en_msg.text += str(data, "\n")
		en_msg.scroll_vertical = INF
		for i in data:
			$vidaM.vVida -= 1

var players = []

func joined():
	host.hide()
	join.hide()
	#username.hide()
	usrnm = username.text
	
	


func _on_timer_timeout():
	rpc("msg_rpc",usrnm, message.text)
	message.text = ""
	
