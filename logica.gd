extends Control


# tablero representado por array bidimencional
	
var width = 3
var height = 3

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
