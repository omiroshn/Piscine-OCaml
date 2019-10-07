let rec get_cell board index = match board with
	| [] -> raise (Failure "Empty")
	| first::rest -> if index == 0 then first else
		get_cell rest (index - 1)


let convert_coords coords = match coords with
	| (1,1) -> 1
	| (1,2) -> 2
	| (1,3) -> 3
	| (2,1) -> 4
	| (2,2) -> 5
	| (2,3) -> 6
	| (3,1) -> 7
	| (3,2) -> 8
	| (3,3) -> 9
	| _ ->
		raise (Failure "Invalid coords")

let play board coords =
	let number = convert_coords coords in
	let cell = get_cell board (number - 1) in
		print_endline (TicTak.toString cell)