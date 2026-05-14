extends CanvasLayer

@onready var hints = $directions
@onready var background = $directions/Panel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hidehints()

func showhints(directions):
	hints.visible = true
	hints.text = directions
	
func hidehints():
	hints.visible = false
	 
	
	
