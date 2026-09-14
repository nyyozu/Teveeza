extends Area2D

@export var mensagem_morte: String = "Se fudeu!"
@export var tempo_delay: float = 2.0

@onready var label_morte: Label = get_node("../CanvaMorte/LabelMorte")

var ja_ativado: bool = false

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	label_morte.visible = false

func _on_body_entered(body: Node2D) -> void:
	if ja_ativado:
		return

	if body.name == "P1" or body.name == "P2":
		ja_ativado = true
		body.morrer()
		mostrar_mensagem_e_resetar()

func mostrar_mensagem_e_resetar() -> void:
	label_morte.text = mensagem_morte
	label_morte.visible = true

	await get_tree().create_timer(tempo_delay).timeout

	get_tree().reload_current_scene()
