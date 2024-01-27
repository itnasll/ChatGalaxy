extends CenterContainer
signal palabra_enviada(argumento: String)

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_texture_button_pressed():
	var palabra = $Label.text
	#$Label.text = ""
	#emit_signal("palabra_enviada", palabra)
	emit_signal("palabra_enviada", palabra)
	#print(palabra, "hola")
