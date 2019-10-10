(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   dalek.ml                                           :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/10/10 15:06:19 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/10/10 16:18:15 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class dalek =
object
	val _name: string =
		let gen() = match Random.int(26 + 26 + 10) with
			| n when n < 26 -> int_of_char 'a' + n
			| n when n < 26 + 26 -> int_of_char 'A' + n - 26
			| n -> int_of_char '0' + n - 26 - 26 in
		let gen _ = String.make 1 (char_of_int(gen())) in
		"Dalek"^ String.concat "" (Array.to_list (Array.init 3 gen))
	val _hp: int = 100
	val mutable _shield: bool = true

	method get_name = _name

	initializer print_endline (_name ^ " appeared!")
	method to_string = _name ^ ": " ^ (string_of_int _hp) ^ " hp, shield: " ^ (string_of_bool _shield)
	method talk =
		let arr = [|"Explain! Explain!";
					"Exterminate! Exterminate!";
					"I obey!";
					"You are the Doctor! You are the enemy of the Daleks!"|] in
		let n = Random.int (Array.length arr) in
		print_endline (Array.get arr n)
	method exterminate (victim:People.people) =
		victim#die;
		if _shield = true then
			_shield <- false
		else _shield <- true
	method die = print_endline ("Emergency Temporal Shift!")
end