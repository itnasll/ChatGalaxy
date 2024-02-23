extends Node

var navesExistentes = ["probando","carlost"]
var disparosExistentes= [ "disparo1", "disparo2"]


func get_navesExistentes():
	return navesExistentes
	
func get_disparosExistentes():
	return disparosExistentes

func esDisparo(carta):
	if carta in disparosExistentes:
		return true
	else:
		return false

func esNave(carta):
	if carta in navesExistentes:
		return true
	else:
		return false
