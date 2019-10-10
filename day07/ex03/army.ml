(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   army.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/10/10 16:45:14 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/10/10 16:45:15 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class ['a] army =
object
	val mutable _list: 'a list = []

	method get_list = _list

	method add (instance:'a) = _list <- [instance] @ _list;
								print_endline (instance#get_name ^ " was added to army.")
	method delete = match _list with
		| [] -> _list <- _list
		| (head: 'a)::(tail: 'a list) -> _list <- tail;
		print_endline (head#get_name ^ " was deleted from army.")
	initializer print_endline ("An army was created.")
end
