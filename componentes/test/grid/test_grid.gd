extends GridContainer


# se usa hboxcontainer para filas
# cada child de hboxcontainer es columna

@export var filas:int =0
@export var columnas: int = 0




func _ready() -> void:
	create_grid()
	pass


func create_grid()->void:
	var triangle:Resource = preload("res://componentes/botones/triangle_btn/triangle_btn.tscn")
	var circle:Resource = preload("res://componentes/botones/circle_btn/circle_btn.tscn")
	var cross:Resource = preload("res://componentes/botones/cross_btn/cross_btn.tscn")
	
	for fila in range(filas):
		var h_container:HBoxContainer = HBoxContainer.new()
		h_container.name = "fila%d" % fila
		add_child(h_container)
	for child in range(get_child_count()):
		for columna in columnas:

			var instance:ButtonClass = triangle.instantiate()
			get_child(child).add_child(instance)
			instance.name = "columna%d" % columna
			instance.this_fila = child
			instance.this_columna = columna
		


	pass