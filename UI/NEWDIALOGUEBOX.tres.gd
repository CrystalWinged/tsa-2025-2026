extends CanvasLayer
var maxcount = 0
var count = 0
@onready var text_label = $TextLabel
@onready var name_label = $TextLabel2
@onready var image = $Image
@export var dialogue_key: String

func _ready() -> void:
	process_mode =Node.PROCESS_MODE_ALWAYS
	image.visible = false
	name_label.visible = false
	text_label.visible = false
	
func display():
	image.visible = true
	name_label.visible = true
	text_label.visible = true
func close():
	image.visible = false
	name_label.visible = false
	text_label.visible = false
	
func updateInfo(name, script, image_name):
	name_label.text = name
	text_label.text = script
	image.texture = load("res://Assets/sprites/" + image_name)
	print(name)
	print(script)
	print(image_name)
	
func _unhandled_input(event):
	if event.is_action_pressed("ui_accept"):	
		
		count += 1
		
	if dialogue_key == "phone":
		display()
		maxcount = 4
		if count == 1:
			updateInfo("Phone", "*ring ring*", "phone.png")
		elif count == 2:
			updateInfo("Phone", "You have a new message!", "phone.png")	
		elif count == 3:
			print("update 3")
		elif count == maxcount:
			count = 0
			close()
			
		
	
