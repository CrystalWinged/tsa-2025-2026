extends CharacterBody2D

const SPEED = 100.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var can_move = false

func _physics_process(delta):


	var direction = Vector2(
		Input.get_axis("move_left", "move_right"),
		Input.get_axis("move_up", "move_down")
		
		)
		
	if abs(direction.x)<0.1:
		direction.x=0
	if abs(direction.y) < 0.1:
		direction.y=0
		
	# Norm.
	if direction.length()!= 0:
		direction = direction.normalized()

		
	# Movement
	velocity = direction * SPEED
	move_and_slide()
		
	# Animations
	if direction.length() == 0:
		animated_sprite.play("Idle")
	else:
		animated_sprite.play("Run")
		

	# Flip sprite
	if direction.x > 0:
		animated_sprite.flip_h = false
	elif direction.x < 0:
		animated_sprite.flip_h = true
		
func pause_movement():
	if not can_move:
		velocity = Vector2.ZERO
		move_and_slide()
		return
		
func resume_movement():
	can_move = true
