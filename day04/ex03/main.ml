(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/10/05 16:54:33 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/10/05 16:54:34 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec print_list = function 
	[] -> ()
	| e::l -> print_endline e; print_list l


let () =
	Random.self_init ();
	let deck = Deck.newDeck () in
	print_list (Deck.toStringListVerbose deck);
	let (n, c) as card = Deck.drawCard deck in
	print_string "I draw a card = ";
	print_endline (Deck.Card.toStringVerbose n);
	let (o, d) as card = Deck.drawCard c in
	print_string "and then a folowing = ";
	print_endline (Deck.Card.toStringVerbose o)
