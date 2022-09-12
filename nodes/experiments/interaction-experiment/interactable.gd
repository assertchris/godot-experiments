extends Area2D
class_name Interactable

signal interactable_entered(other)
signal interactable_exited(other)
signal receive_interaction(me)

var other_interactable : Area2D = null

func initate_interaction() -> void:
	if other_interactable != null:
		other_interactable.receive_interaction.emit(self)

func _on_interactable_area_entered(interactable : Area2D) -> void:
	other_interactable = interactable
	interactable_entered.emit(interactable)

func _on_interactable_area_exited(interactable : Area2D) -> void:
	interactable_exited.emit(interactable)
	other_interactable = null
