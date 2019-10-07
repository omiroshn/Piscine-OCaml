(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   Deck.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/10/05 16:54:16 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/10/05 16:54:16 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

module Card = struct

	module Color = struct
		type t = Spade | Heart | Diamond | Club

		let all = [Spade; Heart; Diamond; Club]

		let toString t = match t with
			| Spade -> "S"
			| Heart -> "H"
			| Diamond -> "D"
			| Club -> "C"

		let toStringVerbose t = match t with
			| Spade -> "Spade"
			| Heart -> "Heart"
			| Diamond -> "Diamond"
			| Club -> "Club"
	end

	module Value = struct
		type t = T2 | T3 | T4 | T5 | T6 | T7 | T8 | T9 | T10 | Jack | Queen | King | As

		let all = [ T2; T3; T4; T5; T6; T7; T8; T9; T10; Jack; Queen; King; As]

		let toInt t = match t with
			| T2 -> 1
			| T3 -> 2
			| T4 -> 3
			| T5 -> 4
			| T6 -> 5
			| T7 -> 6
			| T8 -> 7
			| T9 -> 8
			| T10 -> 9
			| Jack -> 10
			| Queen -> 11
			| King -> 12
			| As -> 13

		let toString t = match t with
			| T2 -> "2"
			| T3 -> "3"
			| T4 -> "4"
			| T5 -> "5"
			| T6 -> "6"
			| T7 -> "7"
			| T8 -> "8"
			| T9 -> "9"
			| T10 -> "10"
			| Jack -> "J"
			| Queen -> "Q"
			| King -> "K"
			| As -> "A"

		let toStringVerbose t = match t with
			| T2 -> "2"
			| T3 -> "3"
			| T4 -> "4"
			| T5 -> "5"
			| T6 -> "6"
			| T7 -> "7"
			| T8 -> "8"
			| T9 -> "9"
			| T10 -> "10"
			| Jack -> "Jack"
			| Queen -> "Queen"
			| King -> "King"
			| As -> "As"

		let next t = match t with
			| T2 -> T3
			| T3 -> T4
			| T4 -> T5
			| T5 -> T6
			| T6 -> T7
			| T7 -> T8
			| T8 -> T9
			| T9 -> T10
			| T10 -> Jack
			| Jack -> Queen
			| Queen -> King
			| King -> As
			| As -> invalid_arg "You should not pass after As"

		let previous t = match t with
			| T2 -> invalid_arg "You should not pass after T2"
			| T3 -> T2
			| T4 -> T3
			| T5 -> T4
			| T6 -> T5
			| T7 -> T6
			| T8 -> T7
			| T9 -> T8
			| T10 -> T9
			| Jack -> T10
			| Queen -> Jack
			| King -> Queen
			| As -> King
	end

	type t = { color:Color.t; value:Value.t }

	let newCard value color = { value; color }

	let allSpades = 
		let v = Value.all in 
			let rec gen_rec va = match va with
			| [] -> []
			| (head:Value.t)::tail -> ({ color = Color.Spade; value = head}) :: (gen_rec tail)
		in gen_rec v

	let allHearts =
		let v = Value.all in 
			let rec gen_rec va = match va with
			| [] -> []
			| (head:Value.t)::tail -> ({ color = Color.Heart; value = head}) :: (gen_rec tail)
		in gen_rec v

	let allDiamonds = 
		let v = Value.all in 
			let rec gen_rec va = match va with
			| [] -> []
			| (head:Value.t)::tail -> ({ color = Color.Diamond; value = head}) :: (gen_rec tail)
		in gen_rec v

	let allClubs =
		let v = Value.all in 
			let rec gen_rec va = match va with
			| [] -> []
			| (head:Value.t)::tail -> ({ color = Color.Club; value = head}) :: (gen_rec tail)
		in gen_rec v

	let all = allSpades @ allClubs @ allDiamonds @ allHearts

	let getValue self = self.value

	let getColor self = self.color


	let toString self = 
		((Value.toString self.value) ^ (Color.toString self.color))

	let toStringVerbose self = 
		("Card(" ^ (Value.toStringVerbose self.value) ^ ", " ^ (Color.toStringVerbose self.color) ^ ")")

	let compare card1 card2 = 
		(Value.toInt card1.value) - (Value.toInt card2.value)


	let max (card1:t) (card2:t) = match card1 with
		| card when (compare card card2) < 0 -> card2
		| _ -> card1

	let min (card1:t) (card2:t) = match card1 with
		| card when (compare card card2) > 0 -> card2
		| _ -> card1

	let best lst = match lst with
		| [] -> invalid_arg "Error list is empty"
		| h::t -> List.fold_left max h t


	let isOf (t:t) (c:Color.t) = (t.color = c)

	let isSpade (t:t) = (t.color = Color.Spade)

	let isHeart (t:t) = (t.color = Color.Heart)

	let isDiamond (t:t) = (t.color = Color.Diamond)

	let isClub (t:t) = (t.color = Color.Club)
end

type t = Card.t list

let toStringList t = List.map Card.toString t

let toStringListVerbose t = List.map Card.toStringVerbose t

let randomize (res:t) (card:Card.t) = 
	let rand = Random.int 10 in
		match res with
			| [] -> [card]
			| h::t when rand = 1 || rand = 5 -> h::card::t
			| h::t when rand = 2 || rand = 6 -> card::h::t
			| h::t -> (card::t @ [h]) 

let newDeck () =
	let rec randomDeck nb =
		if nb = 0 then []
		else (List.nth Card.all (Random.int 52)) :: randomDeck (nb - 1)
	in randomDeck 52

let drawCard self = match self with
	| [] -> invalid_arg "Failure"
	| head::tail -> (head, tail)

