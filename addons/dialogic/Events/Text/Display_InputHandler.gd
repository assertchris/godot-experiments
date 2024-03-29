@tool
extends Node

class_name DialogicInputHandler

################################################################################
## 						INPUT (WIP)
################################################################################
# This shouldn't be handled by this script I think, but for testing purposes this works.
func _input(event:InputEvent) -> void:
	if Input.is_action_just_pressed(DialogicUtil.get_project_setting('dialogic/text/input_action', 'dialogic_default_action')):
		if Dialogic.paused: return
		
		if Dialogic.current_state == Dialogic.states.IDLE:
			Dialogic.handle_next_event()
			
		
		elif Dialogic.current_state == Dialogic.states.SHOWING_TEXT:
			if DialogicUtil.get_project_setting('dialogic/text/skippable', true):
				Dialogic.Text.skip_text_animation()
