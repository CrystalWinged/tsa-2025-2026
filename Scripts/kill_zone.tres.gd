extends Area2D

@onready var timer: Timer = $Timer
@onready var score_label: Label = $"../Labels/ScoreLabel"
@onready var help_label: Label = $"../Labels/HelpLabel"
@onready var hurt: AudioStreamPlayer2D = $hurt



func _on_body_entered(body: Node2D) -> void:
	print("You died")
	hurt.play()
	score_label.text = "Lives: 0"
	help_label.text = "Falling off the map
	will instantly kill you"
	timer.start()
	
#when timer ends	
func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
