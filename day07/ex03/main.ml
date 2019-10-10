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
	let army = new Army.army in
	army#add new Dalek.dalek;
	army#add new Dalek.dalek;
	army#add new Dalek.dalek;
	army#add new Dalek.dalek;
	army#add new Dalek.dalek;
	army#add new Dalek.dalek;
	army#add new Dalek.dalek;
	army#add new Dalek.dalek;
	army#add new Dalek.dalek;
	army#add new Dalek.dalek;
	army#add new Dalek.dalek;
	let l = army#get_list in
	print_endline ("Army count: " ^ string_of_int (List.length l));
	army#delete;
	army#delete;
	army#delete;
	army#delete;
	army#delete;
	army#delete;
	army#delete;
	army#delete;
	army#delete;
	army#delete;
	let l = army#get_list in
	print_endline ("Army count: " ^ string_of_int (List.length l));

	let army = new Army.army in
	army#add (new People.people "Random dude 1");
	army#add (new People.people "Random dude 2");
	army#add (new People.people "Random dude 3");
	army#add (new People.people "Random dude 4");
	army#add (new People.people "Random dude 5");
	army#add (new People.people "Random dude 6");
	army#add (new People.people "Random dude 7");
	let l = army#get_list in
	print_endline ("Army count: " ^ string_of_int (List.length l));
	army#delete;
	army#delete;
	army#delete;
	let l = army#get_list in
	print_endline ("Army count: " ^ string_of_int (List.length l));

	let army = new Army.army in
	let dude = new People.people "Random dude" in
	let doctor = new Doctor.doctor "Doctor" 70 dude in
	army#add doctor;
	army#delete
