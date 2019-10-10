(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   galifrey.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/10/10 17:23:13 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/10/10 17:23:14 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class galifrey
				(dalek_army: Dalek.dalek list)
				(doctor_army: Doctor.doctor list)
				(people_army: People.people list) =
object
	val mutable _dalek_list: Dalek.dalek list = dalek_army
	val mutable _doctor_list: Doctor.doctor list = doctor_army
	val mutable _people_list: People.people list = people_army

	method do_time_war =
		let rec loop dalek doctor people =

			if (List.length doctor > 0) then
			(
				(List.hd doctor)#travel_in_time 2019 2000;
				_doctor_list <- (List.tl doctor)
			)
			else
				_doctor_list <- [];

			match people with
			| [] -> print_endline "Genocide is over."
			| _  -> match dalek with
					| [] -> ()
					| head::tail -> head#talk;
						print_endline ((List.hd people)#to_string ^ " was exterminated");
						head#exterminate (List.hd people);
						loop dalek _doctor_list (List.tl people)

		in loop dalek_army doctor_army people_army

	initializer print_endline ("GENOCIDE HAS STARTED!!!")
end
