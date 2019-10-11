(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   trinitrotoluene.ml                                 :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/10/11 17:21:56 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/10/11 17:21:57 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class trinitrotoluene =
object
	inherit Molecule.molecule "Trinitrotoluene"
		[
			(new Nitrogen.nitrogen); (new Nitrogen.nitrogen); (new Nitrogen.nitrogen);

			(new Hydrogen.hydrogen); (new Hydrogen.hydrogen); (new Hydrogen.hydrogen);
			(new Hydrogen.hydrogen); (new Hydrogen.hydrogen);

			(new Oxygen.oxygen); (new Oxygen.oxygen); (new Oxygen.oxygen);
			(new Oxygen.oxygen); (new Oxygen.oxygen); (new Oxygen.oxygen);

			(new Carbon.carbon); (new Carbon.carbon); (new Carbon.carbon);
			(new Carbon.carbon); (new Carbon.carbon); (new Carbon.carbon);
			(new Carbon.carbon)
		]
end