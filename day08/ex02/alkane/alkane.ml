(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   alkane.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/10/11 18:35:35 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/10/11 18:35:35 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class alkane n =
object
	inherit Molecule.molecule
		(
			match n with
			| 1 -> "Methane"
			| 2 -> "Ethane"
			| 3 -> "Propane"
			| 4 -> "Butane"
			| 5 -> "Pentane"
			| 6 -> "Hexane"
			| 7 -> "Heptane"
			| 8 -> "Octane"
			| 9 -> "Nonane"
			| 10 -> "Decane"
			| 11 -> "Undecane"
			| 12 -> "Dodecane"
			| _ -> "alkane"
		)
		(
			let empty = [] in
			let rec get_carbon lst i =
				if i < n then
					 get_carbon ([(new Carbon.carbon)] @ lst) (i + 1)
				else
					lst
			in
			let carb = get_carbon empty 0 in
			let rec get_hydrogen lst j m =
				if j < m then
					 get_hydrogen ([(new Hydrogen.hydrogen)] @ lst) (j + 1) m
				else
					lst
			in get_hydrogen carb 0 (n * 2 + 2)
		)
end
