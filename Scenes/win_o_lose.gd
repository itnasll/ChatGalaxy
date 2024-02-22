extends TextureRect


var testoWin = "¡Ganaste!"
var testoPerdiste = "¡Perdiste!"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func ganador(Wol:bool):
	if Wol:
		$WoL.text = testoWin
		
	else:
		$WoL.text = testoPerdiste
	$".".visible = true

func empate():
	$WoL.text = "¡¡Empataron!!"
	$".".visible = true

func _on_revancha_pressed():
	pass # Replace with function body.


func _on_boton_volver_al_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menu_principal.tscn")
	pass # Replace with function body.
