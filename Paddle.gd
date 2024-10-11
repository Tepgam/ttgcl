extends AnimatableBody2D

@export
var min_angle_deg=0.0
@export
var max_angle_deg=45.0
@export
var paddle_ascent_rate=5.0
@export
var paddle_descent_rate=1.0
@export
var input="ui_right"

var current_lerp=0.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rotation=min_angle_deg
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var current_rotation=rotation
	if Input.is_action_pressed(input):
		current_lerp=lerp(current_lerp,1.0,paddle_ascent_rate*delta)
	else:
		current_lerp=lerp(current_lerp,0.0,paddle_descent_rate*delta)
	rotation=deg_to_rad(lerp(min_angle_deg,max_angle_deg,current_lerp))
	pass
