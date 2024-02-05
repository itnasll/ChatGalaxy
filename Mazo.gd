extends Resource
class_name Mazo

const SAVE_MAZO_PATH := "user://save_mazo.tres"
@export var mazos = { "default" :[]}

func save_mazo(asd):
	if asd in mazos:
		asd = []
		
func write_savegame():
	ResourceSaver.save(self, SAVE_MAZO_PATH)
