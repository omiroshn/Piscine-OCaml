(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   carbondioxyde.ml                                   :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/10/11 16:17:42 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/10/11 16:17:42 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class carbondioxyde =
object
	inherit Molecule.molecule "Carbon dioxyde" [(new Carbon.carbon); (new Oxygen.oxygen); (new Oxygen.oxygen)]
end
