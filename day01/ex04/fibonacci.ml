(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   fibonacci.ml                                       :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/10/02 16:06:24 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/10/02 16:06:24 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let fibonacci n =
	if n < 0
		then -1
	else
		begin
			let rec f n acc acc2 =
				if n <= 0
					then acc
				else if n = 1
					then acc2
				else
					f (n - 1) acc2 (acc + acc2)
			in f n 0 1
		end

let main () =
	print_int (fibonacci (-42));
	print_char '\n';
	print_int (fibonacci 1);
	print_char '\n';
	print_int (fibonacci 3);
	print_char '\n';
	print_int (fibonacci 6);
	print_char '\n'

let () = main ()
