(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   eu_dist.ml                                         :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/10/08 17:01:58 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/10/08 17:01:59 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let eu_dist (point1:float array) (point2:float array) =
	let rec calc sum i =
		if i < (Array.length point1) then
			calc (sum +. ((point1.(i) -. point2.(i)) ** 2.)) (i + 1)
		else
			sqrt sum
	in
	calc 0. 0

let main () =
	let arr1 = [|-1.0;-2.0;3.0|] in
	let arr2 = [|4.0;0.0;-3.0|] in
	print_float (eu_dist arr1 arr2);
	print_char '\n'

let () =
	main ()