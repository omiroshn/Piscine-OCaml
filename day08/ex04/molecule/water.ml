(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   water.ml                                           :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/10/11 15:53:39 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/10/11 15:53:39 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class water =
object
	inherit Molecule.molecule "Water" [(new Hydrogen.hydrogen); (new Hydrogen.hydrogen); (new Oxygen.oxygen)]
end
