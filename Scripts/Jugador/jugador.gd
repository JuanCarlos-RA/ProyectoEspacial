extends CharacterBody2D

@export var velocidadJugador: int = 60
@onready var animacioJugador = $AnimacioJugador
@onready var componenteSalud: ComponenteSalud =  $ComponenteSalud

func _ready() -> void:
	#Sistema de combate 
	componenteSalud.AlSerLastimado.connect(func(): sufrirGolpe() )
	componenteSalud.AlMorir.connect(func(): morir() )

func sufrirGolpe():
	print("sufrirGolpe")
	
func morir(): 
	print("morir")

func verificarEntradaMovimientoJugador():
	var direccionMovimiento = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	direccionMovimiento.normalized()
	#Velocity es una propiedad de tipo Vector, del nodo CaraterBody2D. Es la velocidad actual en píxeles por segundo, utilizado y modificado durante las llamadas a move_and_slide.
	velocity = direccionMovimiento * velocidadJugador
	
func AnimacionesJugador():	
	if velocity.length() == 0:
		animacioJugador.stop()
	else:
		var animacion
		if velocity.x < 0:
			animacion = "CaminarIzquierda"
		elif velocity.x > 0:
			animacion = "CaminarDerecha"
		elif velocity.y < 0:
			animacion = "CaminarArriba"
		elif velocity.y > 0:
			animacion = "CaminarAbajo"
		animacioJugador.play(animacion)
		
func _physics_process(delta):
	verificarEntradaMovimientoJugador()
	AnimacionesJugador()
	move_and_slide()
