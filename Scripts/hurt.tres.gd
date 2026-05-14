extends Area2D

@onready var game_manager: Node = $"../../../GameManager"
@onready var hurt: AudioStreamPlayer2D = $hurt

#get score var

func _on_body_entered(body):
	if body.is_dead:
		return
	game_manager.removepoint()
	hurt.play()
	print("you got hit")

	
