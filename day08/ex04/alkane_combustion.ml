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

class alkane_combustion =
object
 	inherit Reactions.reaction

	method get_start = []
	method get_result = []
	method balance = new Reactions.reaction
	method is_balanced = true
end 
