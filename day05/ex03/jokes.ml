(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   jokes.ml                                           :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/10/07 19:39:08 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/10/07 19:39:08 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

exception Continue

let randomelement arr =
	let n = Random.int (Array.length arr) in
	Array.get arr n

let main argc argv =
	Random.self_init ();
	if argc == 2 then
		if Sys.file_exists Sys.argv.(1) then
			if Sys.is_directory Sys.argv.(1) = false then
				let arr = [| ""; ""; ""; ""; ""|] in
				let file = Sys.argv.(1) in
				let ic = open_in file in
				try
					let i = ref 0 in
					while true do
						try
							let line = input_line ic in
							if String.length line = 0 then
								raise Continue
							else
								if String.contains line ';' then
									begin
										arr.(!i) <- arr.(!i) ^ line;
										i := !i + 1;
										raise Continue
									end
								else
									arr.(!i) <- arr.(!i) ^ line;
									raise Continue
						with Continue ->
							()
					done;
				with
					| End_of_file -> close_in ic;
						if arr.(4) = "" then
							print_endline "Bad file. Count of jokes <1 or >5"
						else
							print_endline (randomelement arr)
					| Invalid_argument str -> close_in ic;
						print_endline str;
						print_endline "Bad file. Count of jokes <1 or >5"
			else
				print_endline "Is a directory"
		else
			print_endline "No such file"
	else
		()

let () =
	let argv = Array.to_list Sys.argv in
	main (List.length argv) argv
