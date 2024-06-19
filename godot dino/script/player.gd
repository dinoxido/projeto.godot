extends Area2D

signal hit
const SPEED := 400
@onready var screan_size = get_viewport_rect().size 
@onready var anim = $anim
@onready var collision = $Collision
# Called when the node enters the scene tree for the first time.
func _ready():
	screan_size = get_viewport_rect().size



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Input.get_vector("move_left","move_right","move_up","move_down")
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED
		
	if velocity.x != 0:
		anim.play("move")
	elif velocity.y > 0:
		anim.play("move_up")
	elif velocity.y < 0:
		anim.play("move_down")
	else:
		anim.play("idle")
		
	
	
	#if velocity.x > 0:
		#anim.flip_h = true
	#else:
		#anim.flip_h = false
		
	anim.flip_h = true if velocity.x > 0 else false  
		
		
	position += velocity * delta
	
	position = position.clamp(Vector2.ZERO, screan_size)

# colissão dos prayers com os insetos/bugs
func _on_body_entered(body):
	hide()
	hit.emit()
	collision.set.set_deferred("disabled", true)

func start_pos(pos):
	position = pos
	show()
	collision.disabled = false
