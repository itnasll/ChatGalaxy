extends CenterContainer
signal enviaVida(argumento)
signal enviaCarta(argumento)
#crear una var @export para manejar el label que es la cantidad de vida
# Called when the node enters the scene tree for the first time.
@export var estaSeleccionada: bool = false
func _ready():
	pass # Replace with function body.




func _on_texture_button_pressed():
	var palabra = $TextureButton/Label.text
	#$TextureButton/Label.text = ""
	#emit_signal("palabra_enviada", palabra)
	emit_signal("enviaVida", palabra)#cambiar a self a ver que pasa
	emit_signal("enviaCarta",self)
	#print(palabra, "hola")
#	self.tree_exiting


func _on_boton_pressed():
	emit_signal("enviaCarta",self)
	pass # Replace with function body.
