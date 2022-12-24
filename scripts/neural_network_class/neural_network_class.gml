#region Deep. 

global.__activation_func = [];
#macro ACTIVATION global.__activation_func

enum ACTIVATION_TYPE {
	SIGMOID,
	TANH
}

ACTIVATION[ACTIVATION_TYPE.SIGMOID] = activation_sigmoid
ACTIVATION[ACTIVATION_TYPE.TANH] = activation_tanh

global.__neuron_layer_struct = [];
#macro NEURON_LAYER global.__neuron_layer_struct

enum NEURON_LAYER_TYPE {
	BASE, 
	INPUT,
	HIDDEN
}

NEURON_LAYER[NEURON_LAYER_TYPE.BASE] = neuron_layer_base
NEURON_LAYER[NEURON_LAYER_TYPE.INPUT] = neuron_layer_input
NEURON_LAYER[NEURON_LAYER_TYPE.HIDDEN] = neuron_layer_hidden

#endregion

#region Maths. 

#macro e 2.71828

function activation_sigmoid(_x) {
	return (1 / (1 + power(e, -_x)));
}

function activation_tanh(_x) {
	return (power(e, 2 * _x) - 1) / (power(e, 2 * _x) + 1);
}

function activation_linear(_x) {
	return _x;
}

function normalize_linear(_x) {
	return (_x == 0 ? 1 : 1 / _x);
}

#endregion

#region Neurons. 

///@desc Base neuron layer. 
///@arg {real} size - Number of neurons on the layer. 
///@arg {real} activation - Activation function ID. 
function neuron_layer_base(_size, _activation) constructor {
	type = NEURON_LAYER_TYPE.BASE;
	
	size = _size;
	activation = _activation;
	
	input = undefined;	// layer from where the layer will get values
	output = [];		// outputs values
	weights = [];		// weights for values
	bias = [];			// bias for values
	
	///@desc Randomizes the weights and biases.
	///@arg {struct.layer_neuron} [input]
	randomize_weights = function(_input = input) {
		input = _input;
		
		for(var i = 0; i < size; i ++) {
			for(var j = 0; j < input.size; j ++) {
				weights[i, j] = random_range(-0.5, 0.5);
		
				bias[i, j] = random_range(-0.3, 0.3);
			}
		}
	}
	
	///@arg Copies the weights and biases from the layer. 
	///@arg {struct.neuron_layer} layer
	///@arg {bool} [mutate]
	///@arg {real} [mutate_intensity]
	///@arg {bool} [mutate_usigned]
	copy_weights = function(_layer, _mutate = false, _intensity = 0.01, _usigned = true) {
		if (_layer.input == undefined) return;
		
		weights = [];
		bias = [];
		
		for(var i = 0; i < _layer.size; i ++) {
			for(var j = 0; j < _layer.input.size; j ++) {
				var current_weights, current_bias;
				current_weights = _layer.weights[i, j];
				current_bias = _layer.bias[i, j];
				
				weights[i, j] = mutate_value(current_weights, _intensity);
				bias[i, j] = mutate_value(current_bias, _intensity);
				
				if (_usigned) weights[i, j] = abs(weights[i, j]);
				if (_usigned) bias[i, j] = abs(bias[i, j]);
			}
		}
	}
	
	///@arg Make mutation with the given value. 
	///@arg {real} value
	///@arg {real} intensity
	///@returns {real}
	mutate_value = function(_val, _intensity) {
		return _val + random_range(-_intensity, _intensity);
	}
	
	///@desc Makes forward passing. 
	forward = function() {
		
	}
}

///@desc Input neuron layer. 
///@arg {real} size - Number of neurons on the layer. 
function neuron_layer_input(_size) : neuron_layer_base(_size, undefined) constructor {
	type = NEURON_LAYER_TYPE.INPUT;
	
	///@desc Gets input values. 
	///@arg {array<real>} inputs - Array of the input values. 
	forward = function(_inputs) {
		for(var i = 0; i < size; i ++) {
			output[i] = _inputs[i];
		}
	}
}

///@desc Hidden neuron layer. 
///@arg {real} size - Number of neurons on the layer. 
///@arg {real} activation - Activation function ID. 
function neuron_layer_hidden(_size, _activation) : neuron_layer_base(_size, _activation) constructor {
	type = NEURON_LAYER_TYPE.HIDDEN;
	
	///@desc Makes forward passing. 
	forward = function() {
		for(var i = 0; i < size; i ++) {
			output[i] = 0;
			
			for(var j = 0; j < input.size; j ++) {
				output[i] += input.output[j] * weights[i, j] + bias[i, j];
			}
			
			output[i] = ACTIVATION[activation](output[i]);
		}
	}
}

#endregion

#region Neural network. 

///@desc Neural network. 
function neural_network() constructor {
	layers = [];	// layer array
	size = 0;		// number of the layers
	
	output = [];	// output value 
	
	///@desc Adds the layer into the network. 
	///@arg {struct.neuron_layer} layer
	add = function(_layer) {
		if (size != 0) { // if the size is equals zero it means the current layer is the input layer
			var input = layers[size - 1]; // input will be the previouse layer
			_layer.randomize_weights(input);
		}
		
		array_push(layers, _layer);
		
		size ++;
	}
	
	///@desc Makes forward passing through all layers. 
	///@arg {array<real>} inputs - Array of the inputs values. 
	///@returns {array<real>}
	forward = function(_inputs) {
		var input_layer = layers[0]; // in the first iteration, the input layer will be the first from the layers
		input_layer.forward(_inputs);
		
		for(var i = 1; i < size; i ++) {
			var current_layer = layers[i];
			current_layer.forward(input_layer);
			
			input_layer = current_layer;
		}
		
		var output_layer = layers[size - 1]; // the output layer is the last of the layers
		output = output_layer.output;
		
		return output;
	}
	
	///@desc Returns output values array. 
	///@returns {array<real>}
	get_output = function() {
		return output;
	}
	
	///@desc Copies the neural network data. 
	///@arg {struct.neural_metwork} network
	///@arg {bool} [mutate]
	///@arg {real} [mutate_intensity]
	///@arg {bool} [mutate_usigned]
	copy_network = function(_network, _mutate, _intensity, _unsigned) {
		for(var i = 0; i < _network.size; i ++) {
			var current_network_layer, current_layer;
			current_network_layer = _network.layers[i];
			current_layer = layers[i];
			
			current_layer.copy_weights(current_network_layer, _mutate, _intensity, _unsigned);
		}
	}
}

#endregion

#region Save/load system. 

///@desc Saves the neural network to the file. 
///@arg {struct.neural_network} network
///@arg {string} file_name
function neural_network_save(_network, _file_name) constructor {
	var file = file_text_open_write(_file_name);
	
	var save_struct = {layers: []};
	for(var i = 0; i < _network.size; i ++) {
		var current_layer = _network.layers[i];
		save_struct.layers[i] = current_layer;
	}
	
	save_struct.size = _network.size;
	
	var json = json_stringify(save_struct);
	file_text_write_string(file, json);
	
	file_text_close(file);
}

///@desc Loads a neural network from the file. 
///@arg {string} file_name
function neural_network_load(_file_name) constructor {
	var file = file_text_open_read(_file_name);
	
	var str = file_text_read_string(file), struct = json_parse(str), nn = new neural_network();
	for(var i = 0; i < struct.size; i ++) {
		var layer_struct = struct.layers[i], layer_size = layer_struct.size, layer_activation = layer_struct.activation,
		new_layer = new NEURON_LAYER[layer_struct.type](layer_size, layer_activation);
		
		nn.add(new_layer);
		
		new_layer.weights = layer_struct.weights;
		new_layer.bias = layer_struct.bias;
	}
	
	file_text_close(file);
	
	return nn;
}

#endregion











