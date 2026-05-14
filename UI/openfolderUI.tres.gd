extends CanvasLayer

@onready var panel = $Panel
@onready var folderBG = $folderBG
@onready var workerimage = $workerImage
@onready var words = $title2

func _ready() -> void:
	closefolder()

func openfolder():
	panel.visible = true
	folderBG.visible = true
	workerimage.visible = true
	words.visible = true
	
func closefolder():
	panel.visible = false
	folderBG.visible = false
	workerimage.visible = false
	words.visible = false
	
