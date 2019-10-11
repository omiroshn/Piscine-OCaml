(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   reaction.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/10/11 19:36:38 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/10/11 19:36:40 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class virtual reaction (start: (Molecule.molecule * int) list) (result: (Molecule.molecule * int) list) =
object
	method virtual get_start: (Molecule.molecule * int) list
	method virtual get_result: (Molecule.molecule * int) list
	method virtual balance: reaction
	method virtual is_balanced: bool 
end
