extends GameExperiment

@onready var _tile_map := $TileMap as TileMap

func _ready() -> void:
	_tile_map.clear()

#	var tiles := [
#		[Vector2(0, -2), Vector2(19, 0)],
#		[Vector2(1, -2), Vector2(19, 0)],
#		[Vector2(2, -2), Vector2(20, 0)],
#		[Vector2(2, -1), Vector2(20, 1)],
#		[Vector2(2, 0), Vector2(20, 1)],
#	]
#
#	for tile in tiles:
#		_tile_map.set_cell(0, tile[0], 2, tile[1])

	var tiles : Array[Vector2i] = [
#		Vector2i(0, -2),
#		Vector2i(1, -2),
#		Vector2i(2, -2),
#		Vector2i(0, -1),
#		Vector2i(1, -1),
#		Vector2i(2, -1),
		Vector2i(0, 0),
#		Vector2i(1, 0),
#		Vector2i(2, 0),
	]

	for tile in tiles:
		_tile_map.set_cell(0, tile, 2, Vector2i(19, 1))
		_tile_map.set_cells_from_surrounding_terrains(0, _tile_map.get_surrounding_tiles(tile), 0)

	_tile_map.fix_invalid_tiles()
