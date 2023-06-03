extends Node


var time_started = false
var time_start := 0.0
var time_now := 0.0
var time_elapsed := ''


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if time_started:
		if time_start == 0.0:
			time_start = Time.get_unix_time_from_system()
		time_now = Time.get_unix_time_from_system()
		var elapsed = time_now - time_start
		var minutes = int(elapsed) / 60
		var seconds = int(elapsed) % 60
		var ms = int(elapsed * 1000) % 1000
		time_elapsed = '%02d : %02d : %02d' % [minutes, seconds, ms]
	
