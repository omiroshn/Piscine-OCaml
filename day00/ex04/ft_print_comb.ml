(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_print_comb.ml                                   :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/10/01 18:58:04 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/10/01 18:58:04 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let ft_print_comb () =
	let i = 0 in
	let j = 1 in
	let k = 2 in
	let rec f i j k =
		print_int i;
		print_int j;
		print_int k;
		if i < 7 then
			begin
				print_string ", ";
				if k < 9 then
					f i j (k + 1)
				else if j < 8 then
					f i (j + 1) (j + 2)
				else if i < 7 then
					f (i + 1) (i + 2) (i + 3)
			end
		else
			print_string "\n";
	in
	f i j k

let () = ft_print_comb ()
