(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   Watchtower.ml                                      :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/10/12 17:39:50 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/10/12 17:39:51 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

module type WatchTower =
sig
	type hour
	val zero : hour
	val add : hour -> hour -> hour val sub : hour -> hour -> hour
end


module WatchTower =
struct
	type hour = int

	let zero = (12:hour)

	let add (x:hour) (y:hour) =
		((if (x + y) mod 12 = 0 then
			12
		else
			(x + y) mod 12):hour)
	let sub (x:hour) (y:hour) = (
		(if (x - y) mod 12 = 0 then
			12 
		else if (x - y) mod 12 < 0 then
			((x - y) mod 12) * -1
		else
			(x - y) mod 12):hour)
end



let () =
	let h1:WatchTower.hour = 12 in 
	let h2:WatchTower.hour = 12 in
		print_endline "12h - 12h, 12h + 12h";
		print_endline (string_of_int (WatchTower.sub h1 h2));
		print_endline (string_of_int (WatchTower.add h1 h2));
	let h1:WatchTower.hour = 8 in 
	let h2:WatchTower.hour = 24 in
		print_endline "8h - 24h, 8h + 24h";
		print_endline (string_of_int (WatchTower.sub h1 h2));
		print_endline (string_of_int (WatchTower.add h1 h2))