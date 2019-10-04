(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   repeat_string.ml                                   :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/10/02 16:03:43 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/10/02 16:03:44 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec repeat_string ?(str = "x") x =
	if x == 0 then
		""
	else if x < 0 then
		"Error"
	else
		str ^ repeat_string ~str:str (x - 1)

let main () =
	print_endline (repeat_string (-1));
	print_endline (repeat_string 0);
	print_endline (repeat_string ~str:"Toto" 1);
	print_endline (repeat_string 2);
	print_endline (repeat_string ~str:"a" 5);
	print_endline (repeat_string ~str:"what" 3)

let () = main ()
