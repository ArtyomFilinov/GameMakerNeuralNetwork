var angle, dist;
angle = point_direction(x, y, circle.x, circle.y);
dist = point_distance(x, y, circle.x, circle.y);

var input = [angle_difference(image_angle, angle) / 180, 1 / (dist + 0.01)];
for(var i = 0; i < 8; i ++) {
	var len, xx, yy, val;
	len = sprite_width * 3;
	xx = lengthdir_x(len, 360 * i / 8);
	yy = lengthdir_y(len, 360 * i / 8);
	val = place_meeting(x + xx, y + yy, wall);
	
	array_push(input, val);
}

var output = nn.forward(input);

var dir_spd = output[0], moving_spd = abs(output[1]);
image_angle += dir_spd * 30;

x += lengthdir_x(moving_spd * 15, image_angle);
y += lengthdir_y(moving_spd * 15, image_angle);

fitness -= distance_to_object(circle);

if (place_meeting(x, y, wall)) fitness -= 5000;
































/*
var dir = point_direction(x, y, circle.x, circle.y);
var dist = point_distance(x, y, circle.x, circle.y);
inputs = [angle_difference(dir, image_angle) / 180, 1 / (dist + 0.01), 1 / spd_moving, 1 / spd_angle];

for(var i = 0; i < hl; i ++) {
	hides[i] = 0;
	
	for(var j = 0; j < il; j ++) {
		hides[i] += inputs[j] * input_weights[i, j] + bias_input;
	}
	
	hides[i] = activation_tanh(hides[i]);
}

for(var i = 0; i < ol; i ++) {
	outputs[i] = 0;
	
	for(var j = 0; j < hl; j ++) {
		outputs[i] += hides[j] * output_weights[j, i] + bias_output;
	}
	
	outputs[i] = activation_tanh(outputs[i]);
}

var angle_dir = outputs[0];
image_angle += angle_dir * outputs[1] * spd_angle;

var spd = abs(outputs[2]) * spd_moving;
x += lengthdir_x(spd, image_angle);
y += lengthdir_y(spd, image_angle);

fitness_timer --;

if (fitness_timer <= 0) {
	fitness_timer = fitness_time;
	
	fitness -= distance_to_object(circle);
}




















