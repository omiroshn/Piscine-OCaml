(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_is_palindrome.ml                                :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/10/01 20:15:21 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/10/01 20:15:22 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let ft_is_palindrome str =
	let len = String.length str in
	if len = 0
		then true
	else
		begin
			let rec f start endd =
				if start = endd
					then true
				else
					if String.get str start != String.get str endd
						then false
					else
						if start < endd + 1 then
							f (start + 1) (endd - 1)
						else
							true
			in f 0 (len - 1)
		end
	

let main () =
	print_endline (string_of_bool (ft_is_palindrome "radar"));
	print_endline (string_of_bool (ft_is_palindrome "madam"));
	print_endline (string_of_bool (ft_is_palindrome "car"));
	print_endline (string_of_bool (ft_is_palindrome ""))

let () = main () 