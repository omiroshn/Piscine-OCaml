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
	let dalek_army = new Army.army in
	dalek_army#add new Dalek.dalek;
	dalek_army#add new Dalek.dalek;
	dalek_army#add new Dalek.dalek;
	dalek_army#add new Dalek.dalek;
	dalek_army#add new Dalek.dalek;
	dalek_army#add new Dalek.dalek;
	dalek_army#add new Dalek.dalek;

	let people_army = new Army.army in
	people_army#add (new People.people "Random dude 1");
	people_army#add (new People.people "Random dude 2");
	people_army#add (new People.people "Random dude 3");
	people_army#add (new People.people "Random dude 4");
	people_army#add (new People.people "Random dude 5");
	people_army#add (new People.people "Random dude 6");
	people_army#add (new People.people "Random dude 7");
	people_army#add (new People.people "Random dude 8");
	people_army#add (new People.people "Random dude 9");
	people_army#add (new People.people "Random dude 10");
	people_army#add (new People.people "Random dude 11");
	people_army#add (new People.people "Random dude 12");
	people_army#add (new People.people "Random dude 13");

	let doctor_army = new Army.army in
	let dude = new People.people "Random dude" in
	let doctor = new Doctor.doctor "Doctor" 70 dude in
	doctor_army#add doctor;

	let war = new Galifrey.galifrey (dalek_army#get_list) (doctor_army#get_list) (people_army#get_list) in 
	war#do_time_war