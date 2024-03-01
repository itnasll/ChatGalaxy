extends Control
class_name BarraVida
@export var vVida : int
@export var vColor : Color = "green"
@export var vVMax : int = 100
#@onready
# Called when the node enters the scene tree for the first time.
func _ready():
#	$Vida.modulate(vColor)
	var sb = StyleBoxFlat.new()
	$Vida.add_theme_stylebox_override("fill", sb)
	sb.bg_color = vColor
	$Vida.max_value = vVMax



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$Vida.value = vVida
	$Vida.max_value = vVMax
	var sb = StyleBoxFlat.new()
	$Vida.add_theme_stylebox_override("fill", sb)
	sb.bg_color = vColor

func quitar_vida(numero:int):
	vVida -= numero
	return numero
