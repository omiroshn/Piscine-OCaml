(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   glucose.ml                                         :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/10/11 17:41:15 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/10/11 17:41:16 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class glucose =
object
	inherit Molecule.molecule "Glucose"
		[(new Carbon.carbon); (new Carbon.carbon); (new Carbon.carbon);
		(new Carbon.carbon); (new Carbon.carbon); (new Carbon.carbon);

		(new Hydrogen.hydrogen); (new Hydrogen.hydrogen); (new Hydrogen.hydrogen);
		(new Hydrogen.hydrogen); (new Hydrogen.hydrogen); (new Hydrogen.hydrogen);
		(new Hydrogen.hydrogen); (new Hydrogen.hydrogen); (new Hydrogen.hydrogen);
		(new Hydrogen.hydrogen); (new Hydrogen.hydrogen); (new Hydrogen.hydrogen);

		(new Oxygen.oxygen); (new Oxygen.oxygen); (new Oxygen.oxygen);
		(new Oxygen.oxygen); (new Oxygen.oxygen); (new Oxygen.oxygen);]
end