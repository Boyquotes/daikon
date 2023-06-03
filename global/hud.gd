extends Node


var paused = false


var current_scene = 'res://main.tscn'


var time_started = false
var time_start := 0.0
var time_now := 0.0
var time_elapsed := ''
var time_paused := 0.0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if time_started and not paused:
		if time_start == 0.0:
			time_start = Time.get_unix_time_from_system()
		if time_paused != 0.0:
			time_start += Time.get_unix_time_from_system() - time_paused
			time_paused = 0.0
		time_now = Time.get_unix_time_from_system()
		var elapsed = time_now - time_start
		var minutes = int(elapsed) / 60
		var seconds = int(elapsed) % 60
		var ms = int(elapsed * 1000) % 1000
		time_elapsed = '%02d : %02d : %02d' % [minutes, seconds, ms]
	elif time_paused == 0.0 and paused:
		time_paused = Time.get_unix_time_from_system()
	elif not time_started:
		time_start = 0.0
		time_paused = 0.0
		time_now = 0.0
		paused = false
	
