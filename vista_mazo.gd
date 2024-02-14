extends Control
@export var ubi_mazo = "res://Recursos/Mazo.tres"
var rec_mazos= load(ubi_mazo)
var tabmazo = preload("res://Scenes/Tab-mazo.tscn")
@onready var mazosss = rec_mazos.cargar_mazos()

func _ready():
	for mazo in mazosss:
		var newMazo = tabmazo.instantiate()
		newMazo.name = mazo
		$VistaMazos.add_child(newMazo)
		for cartas in mazosss[mazo]:
			var carta = load("res://Recursos/"+cartas[0].to_lower()+".res")
			var vistaCarta = preload("res://Scenes/una_carta_en_mazo.tscn").instantiate()
			vistaCarta.carta_rec = carta
			vistaCarta.cantidad = cartas[1]
			newMazo.get_child(0).scale = Vector2(0.8,0.8)
			newMazo.get_child(0).add_child(vistaCarta)
		pass

func _on_crear_mazo_pressed():
	var nombre_mazo = $"VistaMazos/nuevo mazo/NombreDelMazo".text
	var nuevo_mazo = preload("res://Scenes/Tab-mazo.tscn").instantiate()
	nuevo_mazo.name = nombre_mazo
	nuevo_mazo.set_scale(Vector2(0.8, 0.8))
	$VistaMazos.add_child(nuevo_mazo)
	mazosss[nombre_mazo] = []
	var catindad_detab = $VistaMazos.get_tab_count()
	$VistaMazos.current_tab = catindad_detab-1
	pass # Replace with function body.


func _on_boton_guardar_mazo_pressed():
	var mazos_actuales = {}
	for x in $VistaMazos.get_children():
		if x.name == "nuevo mazo":
			continue
		var DM = x.devolver_mazo()
		mazos_actuales[DM[0]] = DM[1]
	print(rec_mazos.mazos)
	mazosss = mazos_actuales
	print(mazosss)
	rec_mazos.mazos = mazosss
	rec_mazos.guardar_mazos()

	
	



func _on_eliminar_mazo_pressed():
	ventana_confirmacion()


func ventana_confirmacion():
	var confirmar_delete = AcceptDialog.new()
	confirmar_delete.dialog_text = "¿Esta segugo que quiere eliminar el mazo?"
	
	confirmar_delete.add_cancel_button("cancel")
	confirmar_delete.initial_position = Window.WINDOW_INITIAL_POSITION_CENTER_PRIMARY_SCREEN
	confirmar_delete.visible = true
	confirmar_delete.connect("confirmed", confirma)
	$"..".add_child(confirmar_delete)
	_on_boton_guardar_mazo_pressed()
	
func confirma ():
	var cual_mazo = $VistaMazos.current_tab
	$VistaMazos.get_child(cual_mazo).queue_free()
	return true


