extends CharacterBody2D

@onready var spriteEnemigo: Sprite2D = $Sprite2D
@onready var animacioEnemigo = $AnimacionEnemigo
@export var velocidadEnemigo: int = 60
var jugadorEnArea: bool = false
var ModoPresecucion: bool = false # Esto se puede cambiar por algo como MODO PRESECUCIÓN 
var JugadorArea: Area2D =  null
var direccionMovimiento = null
@onready var ray: RayCast2D = $RayCast2D
@onready var componenteSalud: ComponenteSalud =  $ComponenteSalud


#Funcion que se ejecuta al instanciarse el CharacterBody2D
func _ready() -> void:
	animacioEnemigo.play("Volando")
	#Sistema de combate 
	componenteSalud.AlSerLastimado.connect(func(): sufrirGolpe() )
	componenteSalud.AlMorir.connect(func(): morir() )

func sufrirGolpe():
	var tween = create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN)
	tween.tween_property(spriteEnemigo,"modulate",Color.RED, 0.4)
	tween.tween_property(spriteEnemigo,"modulate",Color.WHITE, 0.4)
	
func morir():
	print("morir")

#Debo crear un sensor para el tema de buscar al jugador
func _detectarAreasEntrantes(area):
	print(area)
	
func _detectarAreasSaliendo(area):
	print(area)

func _physics_process(delta):
	seguirJugador()
	encontrarJugador()



func seguirJugador():
	return 0
func encontrarJugador():
	return 0
		#if(playerOnArea and !jugadorAccesible):
		#rayCast.look_at(player.global_position)
		#jugadorAccesible = rayCast.is_colliding() and rayCast.get_collider().name == "playerArea"
