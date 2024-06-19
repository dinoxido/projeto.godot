extends RigidBody2D

@onready var anim = $anim
 

# Called when the node enters the scene tree for the first time.
func _ready(): 
	var enemy_types = anim.sprite_frames.get.animation_names()
	print(enemy_types)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
