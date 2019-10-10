(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/10/09 22:12:01 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/10/09 22:12:01 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let () =
	let marvin = new People.people "marvin" in
	let doctor = new Doctor.doctor "Doctor" 70 marvin in
	print_endline doctor#to_string;
	doctor#talk;
	doctor#travel_in_time 2019 2025;
	doctor#travel_in_time 2025 2019;
	doctor#use_sonic_screwdriver
