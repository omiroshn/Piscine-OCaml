(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   alkane_combustion.ml                               :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/10/11 21:21:40 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/10/11 21:21:40 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class alkane_combustion (al: alkane list) =
object (self)
 	inherit Reaction.reaction [] []

 	val _start: (Molecule.molecule * int) list = make_start al
 	val _result: (Molecule.molecule * int) list = [(new Carbondioxyde.carbondioxyde, 1); (new Water.water, 1)]

	method get_start = []
	method get_result = []
	method balance : Reaction.reaction = [] []
	method is_balanced = true
end 