extends Label

func _process(delta: float) -> void:
	var player = get_tree().get_first_node_in_group("player")
	if player == null:
		return
	text = str(player.coin_count)
