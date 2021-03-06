extends Area2D

signal talked
var paused = false

func _ready():
	pass
	#$daughterPauseTimer.set_wait_time(1)
	

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Dad":
			if not paused and Input.is_action_just_pressed("ui_down"):
				emit_signal("talked")



func _on_text_box_sceneVars(animation, audio):
	print (animation)
	if(animation == "sick"):
		$AnimatedSprite.hide()
	else:
		$AnimatedSprite.show()
		$AnimatedSprite.play(animation)


func _on_Daughter_talked():
	if global.daughterTime > 1 and not global.days == 7:
		global.daughterTime = min(global.daughterTime + 1, 20)
	paused = true


func _on_Fadeout_nextDay():
	$DaughterPauseTimer.set_wait_time(2.5)
	$DaughterPauseTimer.start()


func _on_DaughterPauseTimer_timeout():
	$DaughterPauseTimer.stop()
	paused = false
