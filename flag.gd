extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		body.win_the_game()
		print("win")
		self.queue_free()
