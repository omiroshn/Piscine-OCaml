(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/10/11 15:20:18 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/10/11 15:20:19 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let () =
	let c = new Carbon.carbon in
	let cu = new Copper.copper in
	let h = new Hydrogen.hydrogen in
	let o = new Oxygen.oxygen in
	print_endline (c#to_string);
	print_endline (cu#to_string);
	print_endline (h#to_string);
	print_endline (o#to_string);
	print_endline ( "Atom " ^ c#to_string ^ " matches with " ^ cu#to_string ^ ": " ^ string_of_bool (c#equals cu));
	print_endline ( "Atom " ^ o#to_string ^ " matches with " ^ o#to_string ^ ": " ^ string_of_bool (o#equals new Oxygen.oxygen))