(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   dioxygen.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/10/11 23:01:28 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/10/11 23:01:31 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class dioxygen =
object
	inherit Molecule.molecule "Dioxygen"
		[(new Oxygen.oxygen); (new Oxygen.oxygen)]
end
