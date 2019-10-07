(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   micronap.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/10/07 16:22:53 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/10/07 16:29:13 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let my_sleep () = Unix.sleep 1

let main argc argv =
	if argc == 2 then
		begin
			let t = Sys.argv.(1) in
			let time =
				try (int_of_string t)
				with _ -> 0
			in
				for i = 1 to time do
					my_sleep ()
				done
		end
	else
		()

let () =
	let argv = Array.to_list Sys.argv in
	main (List.length argv) argv
