extends Node2D
@export var spawn_distance = 700


func _on_timer_timeout() -> void:
	var enemy = preload("res://scenes/enemy.tscn").instantiate()
	var player = get_tree().get_first_node_in_group("player")
	if player == null:
		return
	var angle = randf() * TAU
	var direction = Vector2.from_angle(angle)
	add_child(enemy)
	enemy.global_position = player.global_position + direction * spawn_distance
	
