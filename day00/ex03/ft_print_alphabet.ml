(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_print_alphabet.ml                               :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/10/01 18:32:04 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/10/01 18:32:04 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let ft_print_alphabet () =
	let rec print_alpha c =
		if c <= 122
		then
			begin
				print_char (char_of_int(c));
				print_alpha (c + 1)
			end
		else
			print_char '\n' in
	print_alpha (97)


let () = ft_print_alphabet ()