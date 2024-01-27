extends CenterContainer
signal enviaVida(argumento)
#crear una var @export para manejar el label que es la cantidad de vida
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




func _on_texture_button_pressed():
	var palabra = $TextureButton/Label.text
	#$TextureButton/Label.text = ""
	#emit_signal("palabra_enviada", palabra)
	emit_signal("enviaVida", palabra)
	#print(palabra, "hola")
#	self.tree_exiting
