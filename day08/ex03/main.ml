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
	let lst = [new Alkane.methane;
				new Alkane.ethane;
				new Alkane.propane;
				new Alkane.butane;
				new Alkane.pentane;
				new Alkane.hexane;
				new Alkane.heptane;
				new Alkane.octane;
				new Alkane.nonane;
				new Alkane.decane;
				new Alkane.undecane;
				new Alkane.dodecane] in 

  List.iter (fun x -> print_endline x#to_string) lst