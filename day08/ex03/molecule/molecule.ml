(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   molecule.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/10/11 15:30:30 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/10/11 15:30:30 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class virtual molecule (name: string) (atom_lst: Atom.atom list) =
object (this)

	method private sort_list_of_atoms_uphill lst = 
		let rec sort = function
			| [] -> []
			| head::tail -> insert head (sort tail)
		and insert elem = function
			| [] -> [elem]
			| head::tail ->
				if elem#symbol < head#symbol then
					elem :: head :: tail
				else
					head :: insert elem tail
		in sort lst

	method private generate_formula lst =
		let rec loop str last_char count lst = match lst with
		| [] -> if count < 2 then
					str ^ last_char
				else
					str ^ last_char ^ string_of_int count
		| head::tail ->
			if last_char = head#symbol then
				loop str head#symbol (count + 1) tail
			else
				if count > 0 then
					if count = 1 then
						loop (str ^ last_char) head#symbol 1 tail
					else
						loop (str ^ last_char ^ (string_of_int count)) head#symbol 1 tail
				else
					loop str head#symbol 1 tail
		in loop "" "0" 0 lst

	method name : string = name
	method formula : string = this#generate_formula (this#sort_list_of_atoms_uphill atom_lst)

	method to_string = "<" ^ this#formula ^ " " ^ this#name ^ ">"
	method equals (m:molecule) = (this#name = m#name) && (this#formula = m#formula)
end
