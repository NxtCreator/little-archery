extends Control
var damage_price = 5


func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_damage_button_pressed() -> void:
	if GameData.coins < 5:
		return
	GameData.coins -= 5
	GameData.damage_level += 1
	print(GameData.damage_level)
