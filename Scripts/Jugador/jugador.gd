extends CharacterBody2D

@export var velocidadJugador: int = 60
@onready var animacionesMovimientoJugador = $AnimacionesMovimientoJugador
@onready var animacionesAtaques = $AnimacionesAtaques
@onready var componenteSalud: ComponenteSalud =  $ComponenteSalud
@export var atacando : bool = false

func _ready() -> void:
	#Sistema de combate 
	componenteSalud.AlSerLastimado.connect(func(): sufrirGolpe() )
	componenteSalud.AlMorir.connect(func(): morir() )

func sufrirGolpe():
	print("sufrirGolpe")
	
func morir(): 
	print("morir")

func verificarEntradasJugador():
	atacando = Input.is_action_just_pressed("Ataque")
	
	
	var direccionMovimiento = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	direccionMovimiento.normalized()
	velocity = direccionMovimiento * velocidadJugador

func validarAnimacionesAtaques():
	if atacando:
		animacionesAtaques.play("AtacarDerecha")
		
func validarAnimacionesMovimientoJugador():	
	var animacion = ""
	if(velocity.length() == 0):
		animacionesMovimientoJugador.stop()
	else:
		if velocity.x < 0:
			animacion = "CaminarIzquierda"
		elif velocity.x > 0:
			animacion = "CaminarDerecha"
		elif velocity.y < 0:
			animacion = "CaminarArriba"
		elif velocity.y > 0:
			animacion = "CaminarAbajo"
			
		animacionesMovimientoJugador.play(animacion)
		
func _physics_process(delta):
	verificarEntradasJugador()
	validarAnimacionesAtaques()
	validarAnimacionesMovimientoJugador()
	move_and_slide()
