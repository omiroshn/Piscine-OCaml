(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ackermann.ml                                       :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/10/02 16:06:00 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/10/02 16:06:01 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec ackermann m n =
	if m = 0
		then (n + 1)
	else if m > 0 && n = 0
		then ackermann (m - 1) 1
	else if m > 0 && n > 0
		then ackermann (m - 1) (ackermann m (n - 1))
	else
		-1

let main () =
	print_int (ackermann (-1) 7);
	print_string "\n";
	print_int (ackermann 0 0);
	print_string "\n";
	print_int (ackermann 2 3);
	print_string "\n";
	print_int (ackermann 4 1);
	print_string "\n"

let () = main ()