(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   examples_of_file.ml                                :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/10/08 17:26:55 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/10/08 17:26:55 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

exception Continue
exception MyExc of string

let split (str:string) (c:char) =
    let size = String.length str in 
    let rec sp lst i = match i with
        | i when i = size -> lst
        | _ ->  begin try
                    sp (lst @ [String.sub str i (String.index_from str i c)]) ((String.index_from str i c) + 1)
                with
                   | _ -> lst
                end;
    in
        sp [] 0

let split_str str s =
    let sub i pos = String.sub str i (pos - i) in
    let i   = ref 0 in
    let acc = ref []  in
    while String.contains_from str !i s do
        let j = String.index_from str !i s in
        acc := (sub !i j)::!acc;
        i := j + 1;
    done;
    (sub !i (String.length str))::!acc


let rec print_list = function [] -> ()
| head::tail -> print_string head ; print_string " " ; print_list tail

let convert_to_float (a:string) =
	float_of_string a

let add_to_lst file : string list =
	let ic = open_in file in
	let lst = ref [] in
	while true do
		try
			let line = input_line ic in
			if String.length line = 0 then
				raise Continue
			else
				lst := (line :: !lst)
		with
		| Continue -> ()
		| End_of_file -> close_in ic
		| Invalid_argument str -> print_endline str
	done;
	List.rev !lst

let convert_line (line:string) :float array * string =
	let lst = List.rev (String.split_on_char ',' line) in
	match lst with
	| str :: float_list -> begin
		let arr = Array.make (List.length float_list) 0. in
		let set_float i float_str =
			arr.(i) <- (float_of_string float_str)
		in
		List.iteri (set_float) (List.rev float_list);
		(arr, str)
	end
	| _ -> invalid_arg "invalid format"

let examples_of_file file =
	if Sys.file_exists file then
		if Sys.is_directory file = false then
			let lst = add_to_lst file in
			List.map convert_line lst
		else
			begin
				print_endline "Is a directory";
				[]
			end
	else
		begin
			print_endline "No such file";
			[]
		end
		

let print_line (arr, str) =
	let print_elem f =
		print_float f;
		print_string ","
	in
	Array.iter print_elem arr;
	print_endline str

let main argc argv =
	if argc == 2 then
		let lst = examples_of_file Sys.argv.(1) in
		List.iter print_line lst
	else
		()

let () =
	let argv = Array.to_list Sys.argv in
	main (List.length argv) argv


