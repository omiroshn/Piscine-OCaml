(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_ref.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/10/07 18:57:19 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/10/07 18:57:19 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

type 'a ft_ref = { mutable contents : 'a }

let return a =
	{ contents = a }

let get a =
	a.contents

let set a b =
	a.contents <- b

let bind a func =
	func a.contents

let () =
	print_string "Create 42 marathon distance: ";
	let marathon = return 42 in
	print_endline ( string_of_int (get marathon) );
	print_endline "A function applied";
	let y = bind marathon (fun x -> return (char_of_int(get marathon))) in
	print_char (get y);
	print_endline "\nNow it's a char!";
	print_endline "Changing our marathon value to a half-marathon";
	print_endline ( string_of_int (get marathon) );
	set marathon 21;
	print_endline ( string_of_int (get marathon) );