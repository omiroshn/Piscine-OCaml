(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ex01.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/10/09 19:08:03 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/10/09 19:08:03 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

module StringHashtblType =
	struct
		type t = string
		let equal s1 s2 =
			s1 = s2
		let hash str =
			let len = String.length str in
			let rec aux hash i = 
				if i = len then hash
				else
					aux ((int_of_char str.[i]) + (hash lsl 5) + hash) (succ i)
			in aux 5381 0
	end

module StringHashtbl = Hashtbl.Make(StringHashtblType)

let () =
	let ht = StringHashtbl.create 5 in
	let values = [ "Hello"; "world"; "42"; "Ocaml"; "H" ] in
	let pairs = List.map (fun s -> (s, String.length s)) values in
	List.iter (fun (k,v) -> StringHashtbl.add ht k v) pairs;
	StringHashtbl.iter (fun k v -> Printf.printf "k = \"%s\", v = %d\n" k v) ht
