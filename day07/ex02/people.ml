(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   people.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/10/09 22:11:56 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/10/09 22:11:57 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class people name =
object
	val _name: string = name
	val _hp: int = 100

	method to_string = _name ^ ": " ^ (string_of_int _hp) ^ " hp."
	method talk = print_endline ("I'm " ^ _name ^ "! Do you know the Doctor?")
	method die = print_endline ("Aaaarghh!")
	initializer print_endline (_name ^ " was born.")
end