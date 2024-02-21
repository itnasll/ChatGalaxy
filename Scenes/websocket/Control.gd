extends Control

@export var mazo_S =[]

# Called when the node enters the scene tree for the first time.
func _ready():
	print(mazo_S)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_servidor_pressed():
	get_tree().change_scene_to_file("res://Scenes/websocket/server.tscn")
	pass # Replace with function body.


func _on_cliente_pressed():
	get_tree().change_scene_to_file("res://Scenes/websocket/client.tscn")
	pass # Replace with function body.
