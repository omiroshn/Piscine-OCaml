(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ex00.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/10/09 18:37:57 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/10/09 18:37:57 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

module StringSet = Set.Make(String)

let () =
	let set = List.fold_right StringSet.add [ "foo"; "bar"; "baz"; "qux" ] StringSet.empty in
	StringSet.iter print_endline set;
	print_endline (StringSet.fold ( ^ ) set "")
