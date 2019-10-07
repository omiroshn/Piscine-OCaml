let validate_input board (x,y) =
	if x < 1 || x > 9 then
		raise (Failure "x < 1 or x > 9")
	else if y < 1 || y > 9 then
		raise (Failure "y < 1 or y > 9")

let get_names () =
	print_endline "Enter name of O player: ";
	let input = (read_line ()) in
	let get_O_name () =
		if String.length input = 0 then "O"
		else input
	in
	let o_name = (get_O_name ()) in

	print_endline "Enter name of X player: ";
	let input = (read_line ()) in
	let get_X_name () =
		if String.length input = 0 then "X"
		else if o_name = input then "X"
		else input
	in
	let x_name = (get_X_name ()) in
	(o_name, x_name)

let parse_input () =
	let rec check_str pred str i =
		let strLength = String.length str - 1 in
		if i > strLength then
			true
		else if not (pred (String.get str i)) then
			false
		else
			check_str pred str (i + 1)
	in

	let ft_string_all pred str =
		check_str pred str 0
	in

	let is_numeric c =
		c >= '0' && c <= '9'
	in

	let rec str_is_numeric str =
		ft_string_all is_numeric str
	in

	let rec check_list_is_num list =
		match list with
		| str :: tail ->
			(str_is_numeric str) && (check_list_is_num tail)
		| [] ->
			true
	in

	let input = (read_line ()) in

	if String.length input = 0 then
		raise (Failure "Input is empty")
	else
		let raw_input_list = String.split_on_char ' ' input in

		let rec removeEmptyStrings list =
			match list with
			| str :: tail ->
				if String.length str = 0 then
					removeEmptyStrings tail
				else
					str :: removeEmptyStrings tail
			| [] -> list
		in

		let input_list = removeEmptyStrings raw_input_list in

		let input_list_length = List.length input_list in

		if (input_list_length != 2)
			|| (not (check_list_is_num input_list)) then
			raise (Failure "Invalid input")
		else
			let first_num = int_of_string (List.nth input_list 0) in
	 		let second_num = int_of_string (List.nth input_list 1) in
	 		(first_num, second_num)

let print_turn_to_play c =
	print_endline (c ^ "'s turn to play.")

let print_win c =
	print_endline (c ^ " wins!")
