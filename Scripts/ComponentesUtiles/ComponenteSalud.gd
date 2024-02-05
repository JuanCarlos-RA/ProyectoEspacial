extends Area2D
class_name ComponenteSalud

signal  AlMorir
signal  AlSerLastimado
signal  AlCambiarSalud

@export var saludMaxima: int = 1
var saludActual: int = 0
var saludAnterior

func _ready() -> void:
	saludActual =  saludMaxima
	
##Aplicar salud al personaje
func sanar(valor: int):
	establecerSalud(valor)
	
##Aplicar dano al presonaje
func lastimar(valor: int):
	establecerSalud(-valor)

func establecerSalud(valor : int):
	saludAnterior =  saludActual
	saludActual += valor
	saludActual = clamp(saludActual, 0, 5) #Limitamos los valores de salud
	
	if saludAnterior != saludActual:
		AlCambiarSalud.emit(saludActual) #Actualizar la barra de salud
	
	if saludActual >= 0:
		morir()
		return
	
	elif saludActual >= 0 and  saludActual < saludAnterior:
		AlSerLastimado.emit()
		
func morir():
	emit_signal("AlMorir")
	print("Se murio")
	get_parent().queue_free()
