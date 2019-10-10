(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   doctor.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/10/10 14:16:13 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/10/10 14:16:13 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class doctor (name:string) (age:int) (sidekick:People.people) =
object
	val _name: string = name
	val _sidekick: People.people = sidekick
	val mutable _age: int = age
	val mutable _hp: int = 100

	method get_name = _name

	initializer print_endline (_name ^ " was born.")
	method private regenerate = _hp <- 100
	method to_string = _name ^ ": " ^ (string_of_int _age) ^ " age and " ^ (string_of_int _hp) ^ " hp.; " ^ _sidekick#to_string
	method talk = print_endline ("Hi! I’m the Doctor!")
	method travel_in_time (start:int) (arrival:int) =
		print_endline "        		  ___
		  _______(_@_)_______
		  | POLICE      BOX |
		  |_________________|
		   | _____ | _____ |
		   | |###| | |###| |
		   | |###| | |###| |
		   | _____ | _____ |
		   | || || | || || |
		   | ||_|| | ||_|| |
		   | _____ |$_____ |
		   | || || | || || |
		   | ||_|| | ||_|| |
		   | _____ | _____ |
		   | || || | || || |
		   | ||_|| | ||_|| |
		   |       |       |
		   *****************";
		if arrival > start then
			let years = arrival - start in
			print_endline ("Doctor traveled " ^ (string_of_int years) ^ " years in FUTURE.");
		else
			let years = start - arrival in
			print_endline ("Doctor traveled " ^ (string_of_int years) ^ " years in PAST.");
	method use_sonic_screwdriver = print_endline "Whiiiiwhiiiwhiii Whiiiiwhiiiwhiii Whiiiiwhiiiwhiii"
end
