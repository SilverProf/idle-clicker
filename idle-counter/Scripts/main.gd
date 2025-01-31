extends Node2D


########################################################################################
####																				####
####	CODING CHALLENGE #015:														####
####	Here's a simple idle/clicker game I've set up.								####
####	The player scores 1 point automatically every second.						####
####	Your job is to finish the manual_score() method so that the player will		####
####	also score when they press the space bar.									####
####	To be clear, the method already runs any time you press the space bar.		####
####	It just doesn't do anything yet. Your job is to fix that.					####
####	Good luck!																	####
####																				####
########################################################################################


# This variable tracks the player's score
var score = 0
func manual_score():
	# Write your code here
	
	
	
	# Ignore this line. This is just so that you can actually see the change.
	$ScoreLabel.text = "Score: {0}".format([score])









################################################################################
####																		####
####																		####
####					IGNORE CODE BEYOND THIS POINT!						####
####					...unless you're curious ;)							####
####																		####
####																		####
################################################################################

















@onready var mat: Material = $GobotSprite.material
var tweens = []

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_pressed() and not event.is_echo():
		match event.physical_keycode:
			KEY_ESCAPE:
				get_tree().quit()
			KEY_SPACE:
				manual_score()
				pulse()

func _ready() -> void:
	$Timer.one_shot = false
	$Timer.wait_time = 1
	$Timer.timeout.connect(auto_score)
	$Timer.start()


func auto_score():
	score += 1
	$ScoreLabel.text = "Score: {0}".format([score])

func pulse():
	for t: Tween in tweens:
		t.stop()
	mat.set("shader_parameter/circleRadius", 0.0)
	var tween: Tween = create_tween()
	tweens.append(tween)
	tween.tween_property(mat, "shader_parameter/circleRadius", 1.5, .75)
