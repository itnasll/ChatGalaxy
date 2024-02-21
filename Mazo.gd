extends Resource
class_name Mazo

const SAVE_MAZO_PATH := "user://save_mazo.tres"

@export var mazos ={ 
	"default" :[
		["carlost", 5],
		["probando",3]
	]
	}
#	"mazo1":[
#		["probando",4]
#	]}
#func _init():
#	print(mazos)
#	mazos = cargar_mazos()
#	print(mazos)
##	guardar_mazos()



func guardar_mazos():
	var archivo_guardar = FileAccess.open(SAVE_MAZO_PATH, FileAccess.WRITE_READ)
	var json_string = JSON.stringify(mazos)
	archivo_guardar.store_line(json_string)
	
func cargar_mazos():
	var archivo_leer = FileAccess.open(SAVE_MAZO_PATH, FileAccess.READ)
	#si no existe crealo
	if archivo_leer == null :
		var archivo_guardar = FileAccess.open(SAVE_MAZO_PATH, FileAccess.WRITE_READ)
		var json_string = JSON.stringify(mazos)
		archivo_guardar.store_line(json_string)
		archivo_leer = FileAccess.open(SAVE_MAZO_PATH, FileAccess.READ)
		
	var contenido = archivo_leer.get_line()
	var json = JSON.new()
	var _parse_result = json.parse(contenido)
	var mazos_recuperados = json.get_data()
	return mazos_recuperados

func crear_mazo(nombre,cartas):
	mazos[nombre] = cartas
	
func cargar_mazo(nombre):
	return mazos[nombre]
