(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/10/11 15:20:18 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/10/11 15:20:19 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let () =
	let water = new Water.water in
	let cd = new Carbondioxyde.carbondioxyde in
	let tnt = new Trinitrotoluene.trinitrotoluene in
	let glucose = new Glucose.glucose in
	let ozone = new Ozone.ozone in
	let sugar = new Sugar.sugar in
	print_endline (water#to_string);
	print_endline (cd#to_string);
	print_endline (tnt#to_string);
	print_endline (glucose#to_string);
	print_endline (ozone#to_string);
	print_endline (sugar#to_string)