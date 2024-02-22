extends RichTextLabel

@onready var screen_jugdor = $".."

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	set_text ( "Turno: " + str(screen_jugdor.contador_de_turno))
	pass
