extends Node2D

const SPEED = 10.0

var direction = 1
var down_val = 0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var ray_cast_2d_right: RayCast2D = $RayCast2DRight
@onready var ray_cast_2d_left: RayCast2D = $RayCast2DLeft
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_cast_2d_right_cliff: RayCast2D = $RayCast2DRightCliff
@onready var ray_cast_2d_left_cliff: RayCast2D = $RayCast2DLeftCliff
@onready var ray_cast_2d_down_left: RayCast2D = $RayCast2DDownLeft
@onready var ray_cast_2d_down_right: RayCast2D = $RayCast2DDownRight

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if ray_cast_2d_right.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = true
	if ray_cast_2d_left.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = false
		
	# 좌측 절벽 판정	
	if not ray_cast_2d_down_left.is_colliding() and ray_cast_2d_down_right.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = false
			
	# 우측 절벽 판정	
	if not ray_cast_2d_down_right.is_colliding() and ray_cast_2d_down_left.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = true
		
	position.x += (delta * SPEED * direction)
	#position.y += (delta * down_val * SPEED)
	
	
	
