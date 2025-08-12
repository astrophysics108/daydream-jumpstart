extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		body.get_smacked_by_asmoday()
		body.update_hearts()
		self.queue_free()
