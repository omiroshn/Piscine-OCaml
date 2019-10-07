type board_status = X_Won | O_Won | Playing

type t = {
	lst : TicTak.t list;
	status : board_status
}

let generate_empty_board () =
{
	lst = [TicTak.None;
		TicTak.None;
		TicTak.None;
		TicTak.None;
		TicTak.None;
		TicTak.None;
		TicTak.None;
		TicTak.None;
		TicTak.None];
	status = Playing
}

let check_winner lst last_player =
	let none_exists item =
		item = TicTak.None
	in

	match lst with
	| [TicTak.X; _; _; TicTak.X; _; _; TicTak.X; _; _] -> X_Won
	| [_; TicTak.X; _; _; TicTak.X; _; _; TicTak.X; _] -> X_Won
	| [_; _; TicTak.X; _; _; TicTak.X; _; _; TicTak.X] -> X_Won

	| [TicTak.X; TicTak.X; TicTak.X; _; _; _; _; _; _] -> X_Won
	| [_; _; _; TicTak.X; TicTak.X; TicTak.X; _; _; _] -> X_Won
	| [_; _; _; _; _; _; TicTak.X; TicTak.X; TicTak.X] -> X_Won

	| [TicTak.X; _; _; _; TicTak.X; _; _; _; TicTak.X] -> X_Won
	| [_; _; TicTak.X; _; TicTak.X; _; TicTak.X; _; _] -> X_Won

	| [TicTak.O; _; _; TicTak.O; _; _; TicTak.O; _; _] -> O_Won
	| [_; TicTak.O; _; _; TicTak.O; _; _; TicTak.O; _] -> O_Won
	| [_; _; TicTak.O; _; _; TicTak.O; _; _; TicTak.O] -> O_Won

	| [TicTak.O; TicTak.O; TicTak.O; _; _; _; _; _; _] -> O_Won
	| [_; _; _; TicTak.O; TicTak.O; TicTak.O; _; _; _] -> O_Won
	| [_; _; _; _; _; _; TicTak.O; TicTak.O; TicTak.O] -> O_Won

	| [TicTak.O; _; _; _; TicTak.O; _; _; _; TicTak.O] -> O_Won
	| [_; _; TicTak.O; _; TicTak.O; _; TicTak.O; _; _] -> O_Won
	| _ ->
		let notfull = List.exists none_exists lst in
		if not notfull then
			match last_player with
			| TicTak.X -> X_Won
			| TicTak.O -> O_Won
			| _ -> Playing
		else
			Playing

let put_tictak small_board coord curr_player =
	let inner i tictak = 
		if i = coord - 1 then
			if TicTak.is_avaliable tictak = true then
				curr_player 
			else if small_board.status != Playing then
				raise (Failure "Board was conquered by ")
			else
				raise (Failure "Already taken by ")
		else tictak in
	let l = List.mapi inner small_board.lst
	in { lst = l; status = (check_winner l curr_player) }