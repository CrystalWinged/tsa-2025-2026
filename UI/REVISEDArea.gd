extends Area2D

var area_active = false
var count = 0
var ready_to_delete = false
var completed = false
var have_bear = false

@onready var brokenArcadeArea = get_tree().current_scene.get_node("brokenArcadeArea")
@onready var phoneArea = get_tree().current_scene.get_node("Front Desk/Telephone/PhoneDialogue")
@onready var cashRegisterArea = get_tree().current_scene.get_node("Front Desk/Cashregister/CashRegister")
@onready var doorArea = get_tree().current_scene.get_node("Doors/DoorArea")
@onready var fileArea = get_tree().current_scene.get_node("Front Desk/Folder/FileDialogue")
@onready var npc1Area = get_tree().current_scene.get_node("NPC1")
@onready var npc1Area2 = get_tree().current_scene.get_node("NPC1_pt2")
@onready var bearArea = get_tree().current_scene.get_node("Storage Office/Bearplush/bearArea")
@onready var error_effects = get_tree().current_scene.get_node("Erroreffects")
@onready var black = get_tree().current_scene.get_node("Blackbackground")

@onready var dialogue_box = %DialogueManager
@onready var folder_opener = %folder_contents
@onready var hints_activator = %hints
@onready var task_bar = %"Task Bar"

@onready var attention_phone = get_tree().current_scene.get_node("attentionSigns/attention_phone")
@onready var attention_bear = get_tree().current_scene.get_node("attentionSigns/attention_bear")
@onready var attention_arcade =get_tree().current_scene.get_node("attentionSigns/attention_arcade")
@onready var attention_desk = get_tree().current_scene.get_node("attentionSigns/attention_desk")
@onready var attention_file = get_tree().current_scene.get_node("attentionSigns/attention_file")
@onready var attention_door =get_tree().current_scene.get_node("attentionSigns/attention_door")


func _ready():
	if name == "brokenArcadeArea":
		monitoring = false
	if name == "NPC1":
		monitoring = false
	if name == "bearArea":
		monitoring = false
	if name == "NPC1_pt2":
		monitoring = false
	


func _unhandled_input(event):
	
	if not area_active:
		return
		
	if event.is_action_pressed("ui_accept"):
		count += 1
		print(count)
		
##---------------PHONE---------------###
		if name == "PhoneDialogue":
			
			print("this is phone dialogue")
			if count == 1:
				dialogue_box.show_dialogue(
				"Phone",
				"*ring ring*",
				"res://Assets/sprites/telephone.png"
				)
			elif count == 2:
				dialogue_box.show_dialogue(
				"Phone",
				"You have a new voice message!",
				"res://Assets/sprites/telephone.png"
				)
			elif count == 3:
				dialogue_box.show_dialogue(
				"Granny",
				"Hey dear, make sure to clean up the arcade while we're gone!",
				"res://Assets/sprites/grandma.png"
				)
			elif count > 3:
				print("done")
				dialogue_box.hide_dialogue()
				count = 0
				if not completed:
					task_bar.updateTasks("Explore", "Look around the arcade", "Explored: " + str(task_bar.finished_tasks) + "/4", "")
					completed = true
				dialogue_box.hide_dialogue()
##---------------PHONE---------------###
		if name == "PhoneDialogue":
			
			print("this is phone dialogue")
			if count == 1:
				dialogue_box.show_dialogue(
				"Phone",
				"*ring ring*",
				"res://Assets/sprites/telephone.png"
				)
			elif count == 2:
				dialogue_box.show_dialogue(
				"Phone",
				"You have a new voice message!",
				"res://Assets/sprites/telephone.png"
				)
			elif count == 3:
				dialogue_box.show_dialogue(
				"Granny",
				"Hey dear, make sure to clean up the arcade while we're gone!",
				"res://Assets/sprites/grandma.png"
				)
			elif count > 3:
				print("done")
				dialogue_box.hide_dialogue()
				count = 0
				if not completed:
					task_bar.updateTasks("Explore", "Look around the arcade", "Explored: " + str(task_bar.finished_tasks) + "/4", "")
					completed = true
				dialogue_box.hide_dialogue()
			
##---------------DOOR---------------###
		if name == "DoorArea":
			
			print("this is door dialogue")
			if count == 1:
				dialogue_box.show_dialogue(
				"Door",
				"As much as you'd like to leave right now, you promised your grandma you'd take care of the arcade until she returns.",
				"res://Assets/sprites/doortop.png"
				)
			elif count == 2:
				dialogue_box.show_dialogue(
				"Door",
				"You really regret it now huh?",
				"res://Assets/sprites/doortop.png"
				)
			elif count > 2:
				print("done")
				dialogue_box.hide_dialogue()
				count = 0
				if not completed:
					
					task_bar.updateTasks("Explore", "Look around the arcade", "Explored: " + str(task_bar.finished_tasks) + "/4", "")
					completed = true
			else: 
				dialogue_box.hide_dialogue()
			
##---------------brokenArcade---------------###
	# temporarily disabled until later
		if name == "brokenArcadeArea":
			
			print("this is brokenArcade dialogue")
			if count == 1:
				dialogue_box.show_dialogue(
				"You",
				"Something about this seems...strange",
				"res://Assets/sprites/worker.png"
					)
			elif count == 2:
				dialogue_box.show_dialogue(
				"You",
				"Hm? What's that?",
				"res://Assets/sprites/worker.png"
				)
			elif count == 3:
				dialogue_box.show_dialogue(
				"You",
				"!!!",
				"res://Assets/sprites/worker.png"
				)
			elif count > 3:
				brokenArcadeArea.monitoring = false
				print("done")
				dialogue_box.hide_dialogue()
				count = 0
				error_effects.visible = true
				await get_tree().create_timer(1.0).timeout 
				black.visible = true
				# pause player movement
				await get_tree().create_timer(.5).timeout 
				dialogue_box.hide_dialogue()
				task_bar.hide()
				get_tree().change_scene_to_file("res://Scenes/game.tscn")
			else: 
				dialogue_box.hide_dialogue()
##---------------cashregister---------------###
		if name == "CashRegister":
		
			print("this is cashregister dialogue")
			if count == 1:
				dialogue_box.show_dialogue(
				"Cash Register",
				"A cash register.",
				"res://Assets/sprites/cashregister.png"
				)
			elif count == 2:
				dialogue_box.show_dialogue(
				"Cash Register",
				"Everything seems to be in order.",
				"res://Assets/sprites/cashregister.png"
				)
			elif count > 2:
				print("done")
				dialogue_box.hide_dialogue()
				count = 0
				if not completed:
					task_bar.updateTasks("Explore", "Look around the arcade", "Explored: " + str(task_bar.finished_tasks) + "/4", "")
					completed = true
			else: 
				dialogue_box.hide_dialogue()
##---------------file---------------###
		if name == "FileDialogue":
			
			print("this is file dialogue")
			if count == 1:
				folder_opener.openfolder()
			elif count > 1:
				print("done")
				folder_opener.closefolder()
				count = 0
				if not completed:
					task_bar.updateTasks("Explore", "Look around the arcade", "Explored: " + str(task_bar.finished_tasks) + "/4", "")
					completed = true
			else: 
				dialogue_box.hide_dialogue()
##---------------NPC1---------------###
		if name == "NPC1":
			
			print("this is npc1 dialogue")
			if count == 1:
				dialogue_box.show_dialogue(
				"Girl",
				"Hi there! I want one of those bear plushies in the back. They're so cute!",
				"res://Assets/sprites/npc1portrait.png"
				)
			elif count == 2:
				dialogue_box.show_dialogue(
				"Girl",
				"Could you get it for me?",
				"res://Assets/sprites/npc1portrait.png"
				)
			elif count == 3:
				dialogue_box.show_dialogue(
				"You",
				"Uh... okay",
				"res://Assets/sprites/worker.png"
				)
				if not completed:
					task_bar.updateTasks("Objective: ", "Give the girl her prize!", " - Get the bear plushie", " - Give it to the girl")
					completed = true
					attention_desk.visible = false
					attention_bear.visible = true
			elif count > 3:
				dialogue_box.hide_dialogue()
			
			
##---------------BEAR---------------###
		if name == "bearArea":
			
			if count == 1:
				dialogue_box.show_dialogue(
				"Bear",
				"You got a bear plush!",
				"res://Assets/sprites/bearplush.png"
				)
				npc1Area2.monitoring = true
				npc1Area.monitoring = false
				
				attention_bear.visible = false
				attention_desk.visible = true
				
				print("HAVEBEAR = TRUE")
			elif count > 1:
				print("done")
				dialogue_box.hide_dialogue()
				
##---------------NPC1pt2---------------###
		if name == "NPC1_pt2":
			
			if count == 1:
				dialogue_box.show_dialogue(
				"Girl",
				"Wow!! It's adorable! Thanks!",
				"res://Assets/sprites/npc1portrait.png"
				)
				task_bar.updateTasks("Time to Work!", "Help around the arcade", "", "")
			elif count > 1:
				print("done")
				dialogue_box.hide_dialogue()
				npc1Area2.monitoring = false
				brokenArcadeArea.monitoring = true
				
				attention_arcade.visible = true
				attention_desk.visible = false
		

				

					
					
func _on_area_entered(area: Area2D) -> void:
	print("NODE:", name, " PATH:", get_path())
	area_active = true
	count = 0
	print("entered:  ", name)
	hints_activator.showhints("Press Space to Interact/Continue")
	
		
		#update objective + dialogue 
		
func _on_area_exited(area: Area2D) -> void:
	print("left area")
	if task_bar.finished_tasks > 4:
		fileArea.monitoring = false
		doorArea.monitoring = false
		cashRegisterArea.monitoring = false
		phoneArea.monitoring = false
		
		attention_door.visible = false
		attention_file.visible = false
		attention_phone.visible = false
		
		task_bar.updateTasks("Time to Work!","Help around the arcade","","")
		dialogue_box.show_dialogue(
				"You",
				"Looks like there's customers, maybe I should help",
				"res://Assets/sprites/worker.png"
				)
		hints_activator.hidehints()
		await get_tree().create_timer(5.0).timeout
		print("intro tasks deleted")
		print("task 1 area activated")
		
		npc1Area.monitoring = true
		bearArea.monitoring = true
		
		print("NPC area opened")
		dialogue_box.hide_dialogue()
		task_bar.finished_tasks = 0
	hints_activator.hidehints()
	area_active = false
		
############ pause scenetree if have time to avoid bugs
