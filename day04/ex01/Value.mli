(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   Value.mli                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/10/05 16:35:03 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/10/05 16:35:04 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

type t = T2 | T3 | T4 | T5 | T6 | T7 | T8 | T9 | T10 | Jack | Queen | King | As

val all : t list
val toInt : t -> int
val toString : t -> string
val toStringVerbose : t -> string
val next : t -> t
val previous : t -> t
