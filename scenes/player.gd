extends CharacterBody2D
@export var speed = 300
var coin_count = 0

func count_coins():
	coin_count += 1
	print(coin_count)


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
	var enemies = get_tree().get_nodes_in_group("enemy")
	var closest_enemy = null
	var closest_distance = INF
	
	for enemy in enemies:
		var distance = global_position.distance_to(enemy.global_position)
		if distance < closest_distance:
			closest_distance = distance
			closest_enemy = enemy
			
	if closest_enemy == null:
		return	
		
	arrow.direction = global_position.direction_to(closest_enemy.global_position)
	parent.add_child(arrow)
	arrow.global_position = global_position
