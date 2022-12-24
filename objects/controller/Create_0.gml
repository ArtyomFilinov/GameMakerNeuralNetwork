randomize();

repeat(10) {
	instance_create_depth(x, y, depth - 1, player);
}

global.fittest = noone;
global.fitness_dist = -999999999999999999;

restart = function() {
	era ++;
	
	global.fittest = noone;
	global.fitness_dist = -999999999999999999;
	
	with(player) {
		if (fitness > global.fitness_dist) {
			global.fittest = id;
			global.fitness_dist = fitness;
		}
	}
	
	with(player) {
		if (global.fittest != id) {
			nn.copy_network(global.fittest.nn, true, 0.01, false);
		}
		
		circle.x = random_range(30, room_width - 30);
		circle.y = random_range(30, room_height - 30);
		
		x = random_range(30, room_width - 30);
		y = random_range(30, room_height - 30);
		
		x = other.x;
		y = other.y;
		
		fitness = 0;
	}
}

restart_time = room_speed * 5;
restart_timer = restart_time;

training = false;

era = 0;



















































//randomize();

//repeat(1000) {
//	instance_create_depth(x, y, depth - 1, player);
//}

//global.global.fittest_dist_data = {};

//era = 0;

//restart = function() {
//	restart_timer = restart_time;
	
//	era ++;
	
//	var global.fittest = noone, global.fittest_dist = -9999999999;
//	with(player) {
//		if (fitness > global.fittest_dist) {
//			global.fittest = id;
			
//			global.fittest_dist = fitness;
//		}
//	}
	
//	with(player) {
//		if (id != global.fittest) {
//			bias_input = global.fittest.bias_input;
//			bias_output = global.fittest.bias_output;
		
//			input_weights = global.fittest.input_weights;
//			output_weights = global.fittest.output_weights;
		
//			mutate();
//		}
		
//		x = other.x;
//		y = other.y;
		
//		spd_moving = random_range(1, 100);
//		spd_angle = random_range(1, 50);
		
//		fitness = 0;
//	}
	
//	global.global.fittest_dist_data.bias_input = global.fittest.bias_input;
//	global.global.fittest_dist_data.bias_output = global.fittest.bias_output;
//	global.global.fittest_dist_data.input_weights = global.fittest.input_weights;
//	global.global.fittest_dist_data.output_weights = global.fittest.output_weights;
	
//	x = irandom_range(30, room_width - 30);
//	y = irandom_range(30, room_height - 30);
	
//	circle.x = irandom_range(30, room_width - 30);
//	circle.y = irandom_range(30, room_height - 30);
//}
	
//restart_time = 10 * room_speed;
//restart_timer = restart_time;

//training = false;