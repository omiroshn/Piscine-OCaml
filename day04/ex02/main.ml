(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/10/05 16:53:32 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/10/05 16:53:33 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let main () =
	let (a:Card.t) = (Card.best (Card.all)) in
		print_string "Best Card : ";
		print_endline (Card.toStringVerbose a);
	let (a:Card.t) = (Card.newCard Card.Value.T2 Card.Color.Spade) in
	let (b:Card.t) = (Card.newCard Card.Value.As Card.Color.Heart) in
		print_string "Compare ";
		print_string (Card.toStringVerbose a);
		print_string " and ";
		print_string (Card.toStringVerbose b);
		print_string " = ";
		print_endline (string_of_int (Card.compare a b));
		print_string "Compare ";
		print_string (Card.toStringVerbose b);
		print_string " and ";
		print_string (Card.toStringVerbose b);
		print_string " = ";
		print_endline (string_of_int (Card.compare b b));
		print_string "Compare ";
		print_string (Card.toStringVerbose b);
		print_string " and ";
		print_string (Card.toStringVerbose a);
		print_string " = ";
		print_endline (string_of_int (Card.compare b a));

	let (a:Card.t) = (Card.newCard Card.Value.T2 Card.Color.Heart) in
	let rec loop2 list =
		match list with
		| []			-> ()
		| first::tail	->
				print_string (Card.toStringVerbose first);
				print_string " : isSpade = ";
				print_string (string_of_bool (Card.isSpade first));
				print_string " : isHeart = ";
				print_string (string_of_bool (Card.isHeart first));
				print_string " : isDiamond = ";
				print_string (string_of_bool (Card.isDiamond first));
				print_string " : isClub = ";
				print_string (string_of_bool (Card.isClub first));
				print_string " Min with ";
				print_string (Card.toStringVerbose a);
				print_string " = ";
				print_string (Card.toStringVerbose (Card.min a first));
				print_string " Max with "; print_string (Card.toStringVerbose a);
				print_string " = ";
				print_endline (Card.toStringVerbose (Card.max a first));
				loop2 tail
	in
	loop2 Card.all

let () =
	main ()
