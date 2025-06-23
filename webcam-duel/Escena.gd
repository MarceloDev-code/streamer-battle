extends Node2D

# Variables para los nodos UI y sprites
@onready var nombre_personaje = $UI/Marco/nombrePersonaje
@onready var caja_texto = $UI/Marco/CajaTexto
@onready var sprite_izquierdo = $MC2
@onready var sprite_derecho = $Rival
@onready var boton_1 = $UI/opcion1
@onready var boton_2 = $UI/opcion2
@onready var boton_3 = $UI/opcion3
@onready var boton_4 = $UI/opcion4
@onready var cringe = $cringe
@onready var hp = $hp

var cringe_value = 0
var hp_value = 100
# Datos de attacks, diálogos y cringe
var attacks = [
	{"attack": "SAO is the best anime", 
	 "npc_dialog_1": "SAO is art.", 
	 "npc_dialog_2": "Kirito is a well-developed character.", 
	 "damage": 15, 
	 "response_1": "Sword Art Online is trash.", 
	 "response_2": "Only those with bad taste like it.", 
	 "cringe": 3},

	{"attack": "The ending of SNK was amazing", 
	 "npc_dialog_1": "You don't even understand the ending, do you?", 
	 "npc_dialog_2": "You're okay with anything, it seems.", 
	 "damage": 20, 
	 "response_1": "That ending was ridiculous.", 
	 "response_2": "Eren was never a good character.", 
	 "cringe": 3},

	{"attack": "Your waifu isn't real", 
	 "npc_dialog_1": "Raiden Shogun is perfect.", 
	 "npc_dialog_2": "I know.", 
	 "damage": 25, 
	 "response_1": "All 2D waifus are useless.", 
	 "response_2": "You should touch grass.", 
	 "cringe": 3},

	{"attack": "Take a shower", 
	 "npc_dialog_1": "When was the last time you took a shower?", 
	 "npc_dialog_2": "That smell must be hard to bear.", 
	 "damage": 30, 
	 "response_1": "For your information, I take hygiene seriously.", 
	 "response_2": "Not all otakus skip showers.", 
	 "cringe": 3},

	{"attack": "Your favorite VTuber will never love you", 
	 "npc_dialog_1": "That VTuber doesn't care about fans like you.", 
	 "npc_dialog_2": "She doesn't even know you exist.", 
	 "damage": 35, 
	 "response_1": "But I always use super chat!", 
	 "response_2": "Liar! VTUBER-CHAN LOVES ME!", 
	 "cringe": 3},

	{"attack": "You only watch mainstream", 
	 "npc_dialog_1": "Have you even seen Steel Angel Kurumi?", 
	 "npc_dialog_2": "I knew it, you're just a normie.", 
	 "damage": 12, 
	 "response_1": "I watched Evangelion.", 
	 "response_2": "My Hero Academia isn't mainstream!!!", 
	 "cringe": 3},

	{"attack": "Your taste is awful", 
	 "npc_dialog_1": "Your taste is as basic as you are.", 
	 "npc_dialog_2": "You don't understand good taste.", 
	 "damage": 5, 
	 "response_1": "What you like is irrelevant.", 
	 "response_2": "Nobody cares about what you watch.", 
	 "cringe": 3},

	{"attack": "Your cosplay is horrible", 
	 "npc_dialog_1": "You'd be better off cosplaying something that smells good.", 
	 "npc_dialog_2": "Maybe invisibility suits you better.", 
	 "damage": 30, 
	 "response_1": "I SMELL GOOD, MY MOM SAID SO!", 
	 "response_2": "Bad.", 
	 "cringe": 3},

	{"attack": "You waste money on figures", 
	 "npc_dialog_1": "It must be sad living surrounded by plastic.", 
	 "npc_dialog_2": "That explains why you don't have friends.", 
	 "damage": 18, 
	 "response_1": "Your figures are just expensive trash.", 
	 "response_2": "You're just wasting money.", 
	 "cringe": 3},

	{"attack": "Otakus are misunderstood", 
	 "npc_dialog_1": "Nobody wants to understand someone like you.", 
	 "npc_dialog_2": "It's not misunderstanding, it's rejection.", 
	 "damage": 10, 
	 "response_1": "It's a respectable lifestyle.", 
	 "response_2": "You annoy me.", 
	 "cringe": 3},

	{"attack": "You're too old to watch cartoons", 
	 "npc_dialog_1": "You watch kids' cartoons.", 
	 "npc_dialog_2": "Don't your parents say anything about watching animations?", 
	 "damage": 20, 
	 "response_1": "THEY'RE NOT FOR KIDS!!!", 
	 "response_2": "My parents...", 
	 "cringe": 3},

	{"attack": "Your husbando sucks", 
	 "npc_dialog_1": "Your husbando is as useless as you are.", 
	 "npc_dialog_2": "Your husbando isn't even attractive.", 
	 "damage": 25, 
	 "response_1": "But...", 
	 "response_2": "I'll report you!!!", 
	 "cringe": 3},

	{"attack": "You like yaoi", 
	 "npc_dialog_1": "You like BL, you have no rights.", 
	 "npc_dialog_2": "BL men look like women.", 
	 "damage": 15, 
	 "response_1": "DON'T MESS WITH THAT.", 
	 "response_2": "It's true.", 
	 "cringe": 3},

	{"attack": "You don't need friends when you have anime", 
	 "npc_dialog_1": "Loneliness feels, doesn't it?", 
	 "npc_dialog_2": "Nobody will accompany you, not even anime.", 
	 "damage": 35, 
	 "response_1": "Shut up, it's all I need.", 
	 "response_2": "I hate you.", 
	 "cringe": 3},

	{"attack": "American dubbing is the best", 
	 "npc_dialog_1": "Sometimes dubbing is better in other languages.", 
	 "npc_dialog_2": "Japanese doesn't make something good.", 
	 "damage": 22, 
	 "response_1": "Stupid racist, Japanese dubbing is better.", 
	 "response_2": "Pleb.", 
	 "cringe": 3},

	{"attack": "Your taste is terrible", 
	 "npc_dialog_1": "Nobody asked about your taste.", 
	 "npc_dialog_2": "The only unique thing about you is your bad taste.", 
	 "damage": 30, 
	 "response_1": "Your taste is as generic as anyone else's.", 
	 "response_2": "You think you're special, but you're not.", 
	 "cringe": 5},

	{"attack": "I've watched more than 1000 anime", 
	 "npc_dialog_1": "Watching more doesn't make you interesting.", 
	 "npc_dialog_2": "So many anime, yet no taste.", 
	 "damage": 20, 
	 "response_1": "It doesn't impress me to see so much trash.", 
	 "response_2": "Quality over quantity, always.", 
	 "cringe": 3},

	{"attack": "You don't understand Evangelion", 
	 "npc_dialog_1": "You're just pretending to be deep to impress.", 
	 "npc_dialog_2": "Evangelion is over, get over it.", 
	 "damage": 20, 
	 "response_1": "Eeeh, Evangelion is about...", 
	 "response_2": "Evangelion is a classic.", 
	 "cringe": 30},

	{"attack": "Western series are better", 
	 "npc_dialog_1": "Dr. House is better than any anime.", 
	 "npc_dialog_2": "Have you watched Chef by Jon Favreau?", 
	 "damage": 20, 
	 "response_1": "Never.", 
	 "response_2": "My name is Chef.", 
	 "cringe": 15},

	{"attack": "My manga collection is huge", 
	 "npc_dialog_1": "Your room must look like a cheap manga store.", 
	 "npc_dialog_2": "Having so many doesn't make you interesting.", 
	 "damage": 22, 
	 "response_1": "So much manga, so little social life.", 
	 "response_2": "Do you even have time to read all that?", 
	 "cringe": 3},

	{"attack": "Shojo", 
	 "npc_dialog_1": "Even as a Shojo protagonist, you couldn't score.", 
	 "npc_dialog_2": "", 
	 "damage": 10, 
	 "response_1": "", 
	 "response_2": "", 
	 "cringe": 3}
]


# Variable para seguir la conversación
var attack_actual = 0
var attacks_usados = []

# Función para configurar botones con attacks disponibles
func configurar_botones():
	var attacks_disponibles = attacks.filter(func(attack):
		return attack["attack"] not in attacks_usados
	)
	
	if attacks_disponibles.size() > 0:
		boton_1.text = attacks_disponibles[0]["attack"]
		boton_1.disabled = false
	else:
		boton_1.disabled = true

	if attacks_disponibles.size() > 1:
		boton_2.text = attacks_disponibles[1]["attack"]
		boton_2.disabled = false
	else:
		boton_2.disabled = true

	if attacks_disponibles.size() > 2:
		boton_3.text = attacks_disponibles[2]["attack"]
		boton_3.disabled = false
	else:
		boton_3.disabled = true

	if attacks_disponibles.size() > 3:
		boton_4.text = attacks_disponibles[3]["attack"]
		boton_4.disabled = false
	else:
		boton_4.disabled = true

# Función para cuando el player selecciona un attack
func seleccionar_attack(boton):
	var attacks_disponibles = attacks.filter(func(attack):
		return attack["attack"] not in attacks_usados
	)
	if boton == 1:
		attack_actual = attacks_disponibles[0]
	elif boton == 2:
		attack_actual = attacks_disponibles[1]
	elif boton == 3:
		attack_actual = attacks_disponibles[2]
	elif boton == 4:
		attack_actual = attacks_disponibles[3]

	attacks_usados.append(attack_actual["attack"])
	aumentar_cringe(attack_actual["cringe"])
	reducir_hp(attack_actual["damage"])
	show_response_player()
	configurar_botones()

# Función para show la response del player
func show_response_player():
	var attack = attack_actual
	var numero_aleatorio = randi() % 2 + 1

	var dialog_attack = "npc_dialog_" + str(numero_aleatorio)
	var response_text = "response_" + str(numero_aleatorio)
	nombre_personaje.text = "Absolute unit"
	caja_texto.text = attack[dialog_attack]
	await Input.is_action_just_pressed("go_next")
	
	nombre_personaje.text = "Otaku"
	caja_texto.text = attack[response_text]
# Función al iniciar la escena
func _ready():
	cringe.value = cringe_value
	hp.value = hp_value
	configurar_botones()

# Input para los botones
func _on_opcion_1_pressed():
	seleccionar_attack(1)

func _on_opcion_2_pressed():
	seleccionar_attack(2)

func _on_opcion_3_pressed():
	seleccionar_attack(3)

func _on_opcion_4_pressed():
	seleccionar_attack(4)
	
func aumentar_cringe(cantidad):
	cringe_value += cantidad
	cringe_value = clamp(cringe_value, cringe.min_value, cringe.max_value)  # Aseguramos que no salga del rango
	cringe.value = cringe_value
	print("Cringe increased to:", cringe_value)

func reducir_hp(cantidad):
	hp_value -= cantidad
	hp_value = clamp(hp_value, hp.min_value, hp.max_value)  # Aseguramos que no salga del rango
	hp.value = hp_value
	print("HP decreased to:", hp_value)
