(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   iter.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/10/02 16:06:44 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/10/02 16:06:44 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec iter f x n =
	if n = 0
		then x
	else if n = 1
		then f x
	else if n < 0
		then -1
	else
		f (iter f x (n - 1))

let main () =
	print_int (iter (fun x -> x * x) 2 4);
	print_char '\n';
	print_int (iter (fun x -> x * 2) 2 4);
	print_char '\n'

let () = main ()