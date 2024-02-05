extends Area2D
class_name ComponenteLastimar

@export var golpe: int = 1

func _ready() -> void:
	#ComponenteLastimar detecta ComponenteSalud Areas
	area_entered.connect(golpear)

func golpear(area):
	print("Estoy lastimando")
	# and (area.get_parent() != get_parent()) El personaje va a atacar siempre y cuando no sea su propia vida (Esto es una correccion rapida, puesto que se debe corregir con macaras de colision)
	if area is ComponenteSalud:
		area.lastimar(golpe)
