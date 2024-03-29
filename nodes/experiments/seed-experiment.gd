extends GameExperiment

@onready var _seed := $Rows/Controls/Seed as LineEdit
@onready var _random_numbers := $Rows/RandomNumbers as GridContainer

var generator : RandomNumberGenerator

# func pick_random_number() -> void:
# 	_seed.text = str(randi() % 100)

func pick_random_words() -> void:
	_seed.text = " ".join(get_words(generator))

func update_random_sample() -> void:
	# generator.seed = _seed.text.to_int()
	generator.seed = get_hash_from_words(_seed.text.split(" "))

	for child in _random_numbers.get_children():
		child.text = str(generator.randi() % 100)

func _ready() -> void:
	generator = RandomNumberGenerator.new()
	refresh()

func refresh() -> void:
	# pick_random_number()
	pick_random_words()
	update_random_sample()

func _on_seed_text_changed(_new_text : String) -> void:
	update_random_sample()

func _on_randomise_pressed() -> void:
	refresh()

func get_words(generator : RandomNumberGenerator, number : int = 3) -> PackedStringArray:
	var words := get_all_words()
	var size := words.size()

	var chosen := []

	for i in range(3):
		chosen.append(words[generator.randi() % size])

	return PackedStringArray(chosen)

func get_all_words() -> PackedStringArray:
	var file = File.new()

	if file.file_exists("res://resources/objects.txt"):
		file.open("res://resources/objects.txt", File.READ)
		var content = file.get_as_text()
		file.close()
		return content.split("\n", false)

	return PackedStringArray()

func get_hash_from_words(words : PackedStringArray) -> int:
	var complete = ""

	for word in words:
		complete += word.trim_prefix(" ").trim_suffix(" ").to_lower()

	return complete.hash()
