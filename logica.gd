extends Control


# tablero representado por array bidimencional
	
var height = 3
var width = 3

var circulo: Dictionary = {
	'figura': 'circulo'
}

var triangulo: Dictionary = {
	'figura' = 'triangulo'
}
var tablero = [
	[circulo, circulo, circulo],
	[circulo, circulo, triangulo],
	[triangulo, triangulo, triangulo],
]


func _ready():
	#tablero[y][x]
	check_match(tablero)
	# print('check',tablero[check_match(tablero)[2].y][check_match(tablero)[2].x])
	# print_figura(check_match(tablero)[2].x, check_match(tablero)[2].y)
	populate_grid_container()
	pass


func _process(_delta: float) -> void:
	pass


func print_figura(x, y):
	print(tablero[y][x])

func check_match(_tablero):
	var matches: Array = []

	for y in range(height):
		for x in range(width - 2):
			var a = _tablero[y][x]
			var b = _tablero[y][x + 1]
			var c = _tablero[y][x + 2]

			if a != null and a == b and b == c:
				matches.append(Vector2i(x, y))
				matches.append(Vector2i(x + 1, y))
				matches.append(Vector2i(x + 2, y))

				# print(a, b, c)

	# matches es un array que contiene vector2i(x,y)
	# este vector son los los match de los indices de tablero
	# pero se invierten los ejes por como se leen los indices en un array bidimencional, 'y' primero y 'x' despues
	# cordenadas de primer objeto que hace match, indice 0
	#tablero[matches[0].y] [matches[0].x] == tablero[y][x]
	if matches == []:
		print('no matches')
		return
	else:
		print("matches:", matches)
		return matches


func populate_grid_container()->void:
	# la logica aqui esta usando un simple array de los childs de grid_container, la logica de detectar matches usa array bidimencional, corregir esta diferencia
	var triangle:Resource = preload("res://componentes/botones/triangle_btn/triangle_btn.tscn")
	var circle:Resource = preload("res://componentes/botones/circle_btn/circle_btn.tscn")
	var cross:Resource = preload("res://componentes/botones/cross_btn/cross_btn.tscn")


	var grid_container:= get_node("GridContainer")

	for slot in range(grid_container.get_child_count()):
		var rng := RandomNumberGenerator.new()
		var number = rng.randi_range(0,2)
		var instance: Node
		match number:
			0:
				instance = triangle.instantiate()
			1:
				instance = circle.instantiate()
			2:
				instance = cross.instantiate()
				
			_:
				pass
		grid_container.get_child(slot).add_child(instance)	
	pass