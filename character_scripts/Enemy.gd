extends Area2D
class_name Enemy

@export var player: Area2D
@export var stick: Area2D
@export var speed: float = 2.0

var enemy_max_health = 30
var enemy_atk = 5
var enemy_def = 5

var enemy_health = enemy_max_health


#annoying functions so that we can use these in other scripts
func get_enemy_atk():
	return enemy_atk
func get_enemy_def():
	return enemy_def
func get_enemy_max_hp():
	return enemy_max_health
func get_enemy_health():
	return enemy_health
#this worked for the player; idk what else to do
#test_stick.enemy = self

func _ready():
	pass 

#Move toward player
func _process(delta):
	var direction = (player.position - position).normalized()
	position += direction * speed

#differentiate between player hitting enemy and enemy hitting player
func _on_area_entered(area):
	if area is MeleeWeapon:
		#enemy takes damage
		enemy_take_damage(player.get_player_atk(), enemy_def, enemy_health, area.str)
		print("enemy take damage")
	elif area is Player:
		#player takes damage
		player.take_damage(enemy_atk)
		print("player take damage")
	

func enemy_take_damage(player_atk,enemy_def,enemy_hp, sword_str):
	var new_enemy_health = enemy_hp
	new_enemy_health -= (clamp(player_atk+sword_str-enemy_def, 0, 9999999))+sword_str
	enemy_health = new_enemy_health
	if enemy_health <= 0:
		enemy_health = 0
		enemy_die()
	print(enemy_health)

func enemy_die():
	pass
	