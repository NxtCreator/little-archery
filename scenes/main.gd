extends Node2D
@export var spawn_distance = 700
var enemy_scenes = [
	preload("res://scenes/enemy.tscn"),
	preload("res://scenes/fast_enemy.tscn"),
	preload("res://scenes/tank_enemy.tscn"),
]

func _on_timer_timeout() -> void:
	var player = get_tree().get_first_node_in_group("player")
	if player == null:
		return
	var random_enemy = enemy_scenes.pick_random()
	var enemy = random_enemy.instantiate()
	var angle = randf() * TAU
	var direction = Vector2.from_angle(angle)
	add_child(enemy)
	enemy.global_position = player.global_position + direction * spawn_distance
