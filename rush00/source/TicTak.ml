type t = X | O | None

let toString t =
	match t with
    | X -> "X"
    | O -> "O"
    | None -> "-"

let change_player curr_player =
	if curr_player = X then O
	else X

let is_avaliable t =
	if t = None then true
	else false

let get_name (o_name, x_name) curr_player = match curr_player with
	| X -> x_name
	| O -> o_name
	| None -> "None"