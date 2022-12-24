if (keyboard_check_pressed(vk_space)) {
	restart();
}

if (keyboard_check_pressed(vk_shift)) {
	training = !training;
	
	room_speed = (training ? 1200 : 60);
}

if (training) {
	restart_timer --;
	if (restart_timer <= 0) {
		restart_timer = restart_time;
	
		restart();
	}
}

if (keyboard_check(ord("S"))) {
	with(global.fittest) {
		var filename = get_string("filename: ", "");
		neural_network_save(nn, filename + ".nn");
	}
}

if (keyboard_check(ord("L"))) {
	var filename = get_string("filename: ", "");
	with(player) {
		nn = neural_network_load(filename + ".nn");
	}
}

if (keyboard_check(ord("R"))) {
	game_restart();
}























































//if (keyboard_check_pressed(vk_space)) {
//	restart();
//}

//if (training) {
//	restart_timer --;
//	if (restart_timer <= 0) {
//		restart();
//	}
//}

//if (keyboard_check_pressed(vk_shift)) {
//	training = !training;
	
//	room_speed = (training ? 1200 : 60);
//}

//if (keyboard_check_pressed(ord("S"))) {
//	clipboard_set_text(json_stringify(global.fittest_dist_data));
//}