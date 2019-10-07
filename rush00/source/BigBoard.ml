type big_board = {
	small_boards : SmallBoard.t list;
	curr_player : TicTak.t
}

let new_board smBoards player = {
	small_boards = smBoards;
	curr_player = player
}

let empty_big_board =
	let new_9_small_boards () =
		[SmallBoard.generate_empty_board ();
		 SmallBoard.generate_empty_board ();
		 SmallBoard.generate_empty_board ();
		 SmallBoard.generate_empty_board ();
		 SmallBoard.generate_empty_board ();
		 SmallBoard.generate_empty_board ();
		 SmallBoard.generate_empty_board ();
		 SmallBoard.generate_empty_board ();
		 SmallBoard.generate_empty_board ()]
	in
	new_board (new_9_small_boards ()) TicTak.O

let put_tictak big_lst section coord =
	let inner i small_board = 
		if i = section - 1 then
			SmallBoard.put_tictak small_board coord big_lst.curr_player
		else small_board in
	let l = List.mapi inner big_lst.small_boards
	in { small_boards = l; curr_player = TicTak.change_player big_lst.curr_player }

let check_winner board =
	let playing_exists item =
		item = SmallBoard.Playing
	in

	let rec get_statuses (list: SmallBoard.t list) =
		match list with
		| item :: tail ->
			item.status :: (get_statuses tail)
		| [] -> []
	in

	let list_of_statuses = get_statuses board.small_boards in

	match list_of_statuses with
	| [SmallBoard.X_Won; _; _; SmallBoard.X_Won; _; _; SmallBoard.X_Won; _; _] -> SmallBoard.X_Won
	| [_; SmallBoard.X_Won; _; _; SmallBoard.X_Won; _; _; SmallBoard.X_Won; _] -> SmallBoard.X_Won
	| [_; _; SmallBoard.X_Won; _; _; SmallBoard.X_Won; _; _; SmallBoard.X_Won] -> SmallBoard.X_Won

	| [SmallBoard.X_Won; SmallBoard.X_Won; SmallBoard.X_Won; _; _; _; _; _; _] -> SmallBoard.X_Won
	| [_; _; _; SmallBoard.X_Won; SmallBoard.X_Won; SmallBoard.X_Won; _; _; _] -> SmallBoard.X_Won
	| [_; _; _; _; _; _; SmallBoard.X_Won; SmallBoard.X_Won; SmallBoard.X_Won] -> SmallBoard.X_Won

	| [SmallBoard.X_Won; _; _; _; SmallBoard.X_Won; _; _; _; SmallBoard.X_Won] -> SmallBoard.X_Won
	| [_; _; SmallBoard.X_Won; _; SmallBoard.X_Won; _; SmallBoard.X_Won; _; _] -> SmallBoard.X_Won

	| [SmallBoard.O_Won; _; _; SmallBoard.O_Won; _; _; SmallBoard.O_Won; _; _] -> SmallBoard.O_Won
	| [_; SmallBoard.O_Won; _; _; SmallBoard.O_Won; _; _; SmallBoard.O_Won; _] -> SmallBoard.O_Won
	| [_; _; SmallBoard.O_Won; _; _; SmallBoard.O_Won; _; _; SmallBoard.O_Won] -> SmallBoard.O_Won

	| [SmallBoard.O_Won; SmallBoard.O_Won; SmallBoard.O_Won; _; _; _; _; _; _] -> SmallBoard.O_Won
	| [_; _; _; SmallBoard.O_Won; SmallBoard.O_Won; SmallBoard.O_Won; _; _; _] -> SmallBoard.O_Won
	| [_; _; _; _; _; _; SmallBoard.O_Won; SmallBoard.O_Won; SmallBoard.O_Won] -> SmallBoard.O_Won

	| [SmallBoard.O_Won; _; _; _; SmallBoard.O_Won; _; _; _; SmallBoard.O_Won] -> SmallBoard.O_Won
	| [_; _; SmallBoard.O_Won; _; SmallBoard.O_Won; _; SmallBoard.O_Won; _; _] -> SmallBoard.O_Won
	| _ ->
		let notfull = List.exists playing_exists list_of_statuses in
		if not notfull then
			match board.curr_player with
			| TicTak.X -> SmallBoard.X_Won
			| TicTak.O -> SmallBoard.O_Won
			| _ -> SmallBoard.Playing
		else
			SmallBoard.Playing

let print_big_board board =
	let rec get_winners_of_small_boards (list: SmallBoard.t list) =
		match list with
		| small_board :: tail ->
			(small_board.status) :: (get_winners_of_small_boards tail)
		| [] -> []
	in

	let winners = get_winners_of_small_boards board.small_boards in

	(* begin 1 *)
	let rec print_big_rows (listOfSmallBoards: SmallBoard.t list) pIt =

		(* begin 2 *)
		let rec print_big_row listOf3SmallBoards =

			(* begin 3 *)
			let rec print_small_rows it =

				(* begin 4 *)
				let rec print_small_row listOfTicTaks subRowIt =
					let get_status_of_small_board idx =
						if idx < 0 || idx >= 9 then
							SmallBoard.Playing
						else
							List.nth winners idx
					in

					let str_won_o idx =
						match idx with
						| 0 -> "/ - \\";
						| 1 -> "|   |";
						| 2 -> "\\ - /"
						| _ -> ""
					in

					let str_won_x idx =
						match idx with
						| 0 -> "\\   /";
						| 1 -> "  X  "
						| 2 -> "/   \\"
						| _ -> ""
					in

					let print_tictaks_in_row t1 t2 t3 =
						print_string ((TicTak.toString t1)
						^ " "
						^ (TicTak.toString t2)
						^ " "
						^ (TicTak.toString t3))
					in

					let print_col () =
						print_string " | "
					in

					let status = get_status_of_small_board (subRowIt + (pIt * 3)) in

					let print_tictaks_or_status t1 t2 t3 =
						match status with
						| SmallBoard.X_Won ->
							print_string (str_won_x it)
						| SmallBoard.O_Won ->
							print_string (str_won_o it)
						| SmallBoard.Playing ->
							print_tictaks_in_row t1 t2 t3
					in

					match listOfTicTaks with
					| t1 :: t2 :: t3 :: tail ->
						print_tictaks_or_status t1 t2 t3;
						if subRowIt < 2 then
							print_col ();
						print_small_row tail (subRowIt + 1)
					| _ -> ()
				in
				(* end 4 *)

				(* begin 5 *)
				let rec get_small_row_from_big_row row rowCount =
					let get_3_elems_from_small_board lst offset =
						let get_nth_from_list i =
							List.nth lst (i + offset)
						in
						(get_nth_from_list 0) :: (get_nth_from_list 1) :: (get_nth_from_list 2) :: []
					in

					match row with
					| lst :: tail ->
						get_3_elems_from_small_board lst (rowCount * 3)
						@ get_small_row_from_big_row tail rowCount
					| [] -> []
				in
				(* end 5 *)

				if it < 3 then
					let small_row = get_small_row_from_big_row listOf3SmallBoards it in
					print_small_row small_row 0;
					if it != 2 then
						print_char '\n';
					print_small_rows (it + 1)
				else
					print_char '\n'
			in
			(* end 3 *)

			print_small_rows 0
		in
		(* end 2 *)

		let print_big_line it =
			if it < 2 then
				print_endline "---------------------"
		in

		match listOfSmallBoards with
		| l1 :: l2 :: l3 :: tail ->
			print_big_row (l1.lst :: l2.lst :: l3.lst :: []);
			print_big_line pIt;
			print_big_rows tail (pIt + 1)
		| _ -> ()
	in
	(* end 1 *)

	print_big_rows board.small_boards 0
