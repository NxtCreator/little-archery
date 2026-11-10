extends CharacterBody2D
@export var speed = 300


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var direction = Input.get_vector(
		"move_left",
		"move_right",
		"move_up",
		"move_down"
	)
	
	velocity = direction * speed
	move_and_slide()
	
	


func _on_timer_timeout() -> void:
	var arrow = preload("res://scenes/arrow.tscn").instantiate()
	var parent = get_parent()
	arrow.global_position = global_position
	parent.add_child(arrow)
