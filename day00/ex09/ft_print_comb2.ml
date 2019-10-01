(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_print_comb2.ml                                  :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/10/01 21:13:20 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/10/01 21:13:20 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let ft_print_comb2 () =
	let print_first i =
		if i < 10 then
			begin
				print_char '0';
				print_int i
			end
		else
			print_int i
	in
	let rec print_comb2 i j =
		print_string ", ";
		print_first i;
		print_char ' ';
		print_first j;
		if i = 98 && j == 99 then ()
		else if j == 99 then
			print_comb2 (i + 1) (i + 2)
		else
			print_comb2 i (j + 1)
	in
	print_first 0;
	print_char ' ';
	print_first 1;
	print_comb2 0 2;
	print_char '\n'

let () = ft_print_comb2 ()
