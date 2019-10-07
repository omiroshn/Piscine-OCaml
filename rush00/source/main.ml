let main () = (* GameLoop.game_loop () *)
	print_endline "Wecome to the game!";
	let (o_name, x_name) = InputOutput.get_names () in
	print_endline ("The name of O player is: " ^ o_name);
	print_endline ("The name of X player is: " ^ x_name);
	let big_board = BigBoard.empty_big_board in
	GameLoop.game_loop big_board (o_name, x_name)

let () = main ()
