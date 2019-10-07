let rec game_loop big_board (o_name, x_name) =
	BigBoard.print_big_board big_board;

	let rec read_coords () =
		try
			let (x,y) = InputOutput.parse_input () in
			InputOutput.validate_input big_board (x,y);
			(x,y)
		with
			Failure str ->
				print_endline str;
				read_coords ()
	in

	InputOutput.print_turn_to_play (TicTak.get_name (o_name, x_name) big_board.curr_player);
	print_endline "Choose section and spot to put tictok:";
	let (x,y) = read_coords () in

	let loop_game_loop () =
		try
			let new_board = BigBoard.put_tictak big_board x y in

			let game_status = BigBoard.check_winner new_board in

			match game_status with
			| SmallBoard.Playing ->
				game_loop new_board (o_name, x_name)
			| SmallBoard.X_Won ->
				BigBoard.print_big_board new_board;
				print_endline (x_name ^ " has won!")
			| SmallBoard.O_Won ->
				BigBoard.print_big_board new_board;
				print_endline (o_name ^ " has won!")
		with
			Failure str ->
				print_endline (str ^ TicTak.toString (TicTak.change_player big_board.curr_player));
				game_loop big_board (o_name, x_name)
	in

	loop_game_loop ()