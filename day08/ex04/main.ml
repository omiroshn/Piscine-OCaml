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
	let methane = new Methane.methane in
	let ethane = new Ethane.ethane in
	let octane = new Octane.octane in
	print_endline (methane#to_string);
	print_endline (ethane#to_string);
	print_endline (octane#to_string)