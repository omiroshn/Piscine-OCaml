(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ozone.ml                                           :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/10/11 17:44:29 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/10/11 17:44:29 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class ozone =
object
	inherit Molecule.molecule "Ozone" [(new Oxygen.oxygen); (new Oxygen.oxygen); (new Oxygen.oxygen)]
end
