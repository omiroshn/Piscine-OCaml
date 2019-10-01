(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_rot_n.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/10/01 20:57:53 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/10/01 20:57:53 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let ft_rot_n num str =
	let rec rot c =
		let upper =
			if c >= 'a' && c <= 'z'
				then int_of_char 'a'
				else int_of_char 'A'
		in
		if (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') then
			char_of_int (((int_of_char c - upper + num) mod 26) + upper)
		else c
	in String.map rot str

let main () =
	print_endline (ft_rot_n 1 "abcdefghijklmnopqrstuvwxyz");
	print_endline (ft_rot_n 13 "abcdefghijklmnopqrstuvwxyz");
	print_endline (ft_rot_n 42 "0123456789");
	print_endline (ft_rot_n 2 "OI2EAS67B9");
	print_endline (ft_rot_n 0 "Damned !");
	print_endline (ft_rot_n 42 "");
	print_endline (ft_rot_n 1 "NBzlk qnbjr !")

let () = main ()
