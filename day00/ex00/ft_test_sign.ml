(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_test_sign.ml                                    :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/09/30 19:14:20 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/09/30 19:51:54 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let ft_test_sign x =
	if x >= 0 then
		print_endline "positive"
	else
		print_endline "negative"

let main () =
	ft_test_sign (10);
	ft_test_sign 42;
	ft_test_sign 0;
	ft_test_sign (-42);
	ft_test_sign (-4611686018427387904 * 4);
	ft_test_sign (max_int * -max_int)


let () = main ();