(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   sugar.ml                                           :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/10/11 17:44:54 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/10/11 17:44:55 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class sugar =
object
	inherit Molecule.molecule "Sugar"
		[
			(new Hydrogen.hydrogen); (new Hydrogen.hydrogen); (new Hydrogen.hydrogen);
			(new Hydrogen.hydrogen); (new Hydrogen.hydrogen); (new Hydrogen.hydrogen);

			(new Oxygen.oxygen); (new Oxygen.oxygen); (new Oxygen.oxygen);
			(new Oxygen.oxygen); (new Oxygen.oxygen); (new Oxygen.oxygen);

			(new Carbon.carbon); (new Carbon.carbon); (new Carbon.carbon);
			(new Carbon.carbon); (new Carbon.carbon); (new Carbon.carbon);

			(new Oxygen.oxygen); (new Oxygen.oxygen); (new Oxygen.oxygen);
			(new Oxygen.oxygen); (new Oxygen.oxygen);

			(new Hydrogen.hydrogen); (new Hydrogen.hydrogen); (new Hydrogen.hydrogen);
			(new Hydrogen.hydrogen); (new Hydrogen.hydrogen); (new Hydrogen.hydrogen);
			(new Hydrogen.hydrogen); (new Hydrogen.hydrogen); (new Hydrogen.hydrogen);

			(new Carbon.carbon); (new Carbon.carbon); (new Carbon.carbon);
			(new Carbon.carbon); (new Carbon.carbon); (new Carbon.carbon);

			(new Hydrogen.hydrogen); (new Hydrogen.hydrogen); (new Hydrogen.hydrogen);
			(new Hydrogen.hydrogen); (new Hydrogen.hydrogen); (new Hydrogen.hydrogen);
			(new Hydrogen.hydrogen);
		]
end