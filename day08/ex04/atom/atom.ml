(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   atom.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/10/10 18:38:43 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/10/10 18:38:43 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class virtual atom name symbol atomic_number =
object (this)
	method name : string = name
	method symbol : string = symbol
	method atomic_number : int = atomic_number

	method to_string = "<" ^ (string_of_int this#atomic_number) ^ " " ^ this#symbol ^ " " ^ this#name ^ ">"
	method equals (a:atom) = this#atomic_number = a#atomic_number
end
