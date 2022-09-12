extends GameExperiment

@onready var _player_interactable := %Interactable as Interactable

func _unhandled_key_input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.is_action_pressed("ui_accept"):
			_player_interactable.initate_interaction()

func _on_npc_interactable_receive_interaction(player_area : Area2D) -> void:
	print("player is interacting with npc")

func _on_player_interactable_interactable_entered(other) -> void:
	print("player can interact with npc")

func _on_player_interactable_interactable_exited(other) -> void:
	print("player can not interact with npc")
