(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_string_all.ml                                   :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/10/01 19:29:27 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/10/01 19:29:28 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let is_digit c =
	c >= '0' && c <= '9'

let ft_string_all passed_func str =
	let len = String.length str in
	let rec f i =
		if i < 0 then
			true
		else
			if passed_func (String.get str i) = false
				then false
			else
				f (i - 1)
	in f (len - 1)

let main () =
	print_endline (string_of_bool (ft_string_all is_digit "0123456789"));
	print_endline (string_of_bool (ft_string_all is_digit "O12EAS67B9"))

let () = main () 