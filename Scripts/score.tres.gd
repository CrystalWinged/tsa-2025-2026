extends Node

var score = 3
var fixed_height = -70

@onready var player: CharacterBody2D = $"../Player"
@onready var timer: Timer = $Timer
@onready var score_label: Label = $"../Labels/ScoreLabel"
@onready var help_label: Label = $"../Labels/HelpLabel"


func _physics_process(delta):
	score_label.position = Vector2(player.position.x - 140, player.position.y-70)


func addpoint():
	if score >= 3:
		score = 3
		score_label.text = "Lives:" + str(score)
	else:
		score += 1
		score_label.text = "Lives:" + str(score)
	print(score)

func removepoint():
	# ignore hits if already dead
	if score <= 0 or player.is_dead:
		score_label.text = "Lives:" + str(score)
		print("already dead")
		return

	score -= 1
	score_label.text = "Lives:" + str(score)
	
	if score == 0:
		score_label.text = "Lives:" + str(score) 
		print("you died to enemy")
		player.playerDied()
		help_label.text = "Next time 
		avoid the enemies"
		# Connect the death animation finished signal only once
		var death_callback = Callable(self, "_on_death_animation_finished")
		if not player.animated_sprite.is_connected("animation_finished", death_callback):
			player.animated_sprite.animation_finished.connect(death_callback)
	else:
		player.playerHit()
		print("ouch!")
	
	print(score)
func _on_death_animation_finished():
	print("death animation finished")
	Engine.time_scale = 0.5  
	timer.start()  # start timer to reset scene after a delay

func _on_timer_timeout():
	print("timer finished")
	Engine.time_scale = 1  
	get_tree().reload_current_scene()
