(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/10/05 16:34:52 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/10/05 16:34:53 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let main () = 
	let t = Value.all in
	let rec loop lst = match lst with
		| h::t ->
				print_string "Value.toString : ";
				print_endline (Value.toString h);
				print_string "Value.toStringVerbose : ";
				print_endline (Value.toStringVerbose h);
				print_string "Value.toInt : ";
				print_endline (string_of_int (Value.toInt h));
				print_string "Value.toString (Value.next) : ";
				print_endline (Value.toString (Value.next h));
				print_string "\n";
				flush stdout;
				loop t
		| [] -> ()
	in loop t 

let () = 
	main ()
