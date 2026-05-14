extends CanvasLayer

@onready var image = $Image
@onready var text_label = $TextLabel
@onready var name_label = $TextLabel2

func _ready():
	print(image)
	print(text_label)
	print(name_label)
	hide_dialogue()

func hide_dialogue():
	image.visible = false
	text_label.visible = false
	name_label.visible = false
		
	
func show_dialogue(speaker, text, imagePNG):
	visible = true

	image.visible = true
	text_label.visible = true
	name_label.visible = true

	text_label.text = text
	name_label.text = speaker
	image.texture = load(imagePNG)
	print(text, speaker, imagePNG)
