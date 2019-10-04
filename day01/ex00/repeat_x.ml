(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   repeat_x.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/10/01 21:32:23 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/10/01 21:32:23 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec repeat_x n =
	if n < 0
		then "Error"
	else if n = 0
		then ""
	else
		"x" ^ repeat_x (n - 1)

let main () =
	print_endline (repeat_x (-1));
	print_endline (repeat_x 0);
	print_endline (repeat_x 1);
	print_endline (repeat_x 2);
	print_endline (repeat_x 5)

let () = main ()
