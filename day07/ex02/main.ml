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
	Random.self_init ();

	let dude = new People.people "Random dude" in
	let doctor = new Doctor.doctor "Doctor" 70 dude in
	print_endline doctor#to_string;
	doctor#talk;
	doctor#use_sonic_screwdriver;
	let dalek = new Dalek.dalek in
	print_endline (dalek#to_string );
	dalek#talk;
	dalek#exterminate dude;
	print_endline (dalek#to_string);
	dalek#die;
	doctor#travel_in_time 2019 350350
