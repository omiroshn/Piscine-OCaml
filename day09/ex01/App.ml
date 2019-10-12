(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   App.ml                                             :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/10/12 17:39:50 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/10/12 17:39:51 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

module type App =
sig
	type project = string * string * int
	val zero : project
	val combine : project -> project -> project
	val fail : project -> project
	val success : project -> project
end

module App =
struct
	type project = string * string * int

	let zero = (("", "", 0):project)

	let combine (a:project) (b:project) = match a with
		| (s1, _, grade1) -> match b with
		| (s2, _, grade2) ->
		((
			(s1 ^ s2),
			(if ((grade1 + grade2) / 2) > 80 then
				"succeed"
			else
				"fail"),
			((grade1 + grade2) / 2)):project)

	let fail (a:project) = match a with | (a, _, _) -> ((a, "fail", 0):project)
	let success (a:project) = match a with | (a, _, _) -> ((a, "succeed", 80):project)
end

let print_proj (p:App.project) = match p with
	| (a,b,c) -> print_endline (a ^ " " ^ b ^ " " ^ (string_of_int c))	

let () =
	let p1:App.project = (App.zero) in
	let p2:App.project = (("day09", "succes", 100):App.project) in

	print_proj (App.fail p1);
	print_proj (App.success p2);
	print_proj (App.combine p1 p2);
	print_proj (App.fail p2)
