extends CharacterBody2D

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	var player = get_tree().get_first_node_in_group("player")
	print(player.global_position)
