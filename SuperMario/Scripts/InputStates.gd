var input_name
var prev_state
var curr_state
var input

var output_state
var state_old

func _init(inputName):
    self.input_name = inputName

func check():
    input = Input.is_action_pressed(self.input_name)
    prev_state = curr_state
    curr_state = input

    state_old = output_state

    if not prev_state and not curr_state:
        output_state = 0  # released
    if not prev_state and curr_state:
        output_state = 1  # just pressed
    if prev_state and curr_state:
        output_state = 2  # pressed
    if prev_state and not curr_state:
        output_state = 3  # just released

    return output_state
