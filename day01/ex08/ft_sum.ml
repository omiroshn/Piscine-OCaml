(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_sum.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/10/02 16:07:11 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/10/02 16:07:11 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let ft_sum f x n =
	let rec addSum f x acc =
		if x > n
			then acc
		else
			addSum f (x + 1) (acc +. (f x))
	in addSum f x 0.

let main () =
	print_float (ft_sum (fun i -> float_of_int (i * i)) 1 10);
	print_char '\n'

let () = main ()