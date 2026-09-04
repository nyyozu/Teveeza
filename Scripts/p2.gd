extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var animated_sprite : AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
		animated_sprite.play("jump")
	if Input.is_action_just_pressed("arrow_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("arrow_left", "arrow_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	update_animations(direction)
	
func update_animations(direction: float) -> void:
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	else:
		if abs(velocity.x) > 0.1:
			animated_sprite.play("walk")
		else:
			animated_sprite.play("idle")
