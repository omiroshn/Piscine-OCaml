(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/10/05 16:30:59 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/10/05 16:32:24 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let main () = 
	let t = Color.all in
	let rec loop lst = match lst with
		| [] -> ()
		| h::t ->
				print_endline (Color.toString h);
				print_endline (Color.toStringVerbose h);
				loop t
	in loop t

let () = 
	main ()
