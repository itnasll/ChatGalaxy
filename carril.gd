extends VBoxContainer
signal Slot_vida_pressed

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
		
	if $"EspVida".get_child_count() == 1:
			if $"Barra de Vida".vVida <= 0:
				$EspVida.get_child(0).free()
				
				
	if $botonAreaAtaque.get_child_count() > 0 :
		$botonAreaAtaque.disabled = true
	else:
		$botonAreaAtaque.disabled = false



func _on_esp_vida_pressed():
	emit_signal("Slot_vida_pressed")
	pass # Replace with function body.
