(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_print_rev.ml                                    :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/10/01 19:16:34 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/10/01 19:16:35 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec ft_print_rev str =
	let len = String.length str in
	let rec f i =
		if i < 0 then
			print_char '\n'
		else
			begin
				print_char (String.get str i);
				f (i - 1)
			end
	in f (len - 1)


let main() =
	ft_print_rev "Hello world !";
	ft_print_rev "ft_print_rev";
	ft_print_rev "abcd";
	ft_print_rev "12 3 45"

let () = main ()