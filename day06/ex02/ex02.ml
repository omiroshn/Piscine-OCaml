(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ex02.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/10/09 19:38:34 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/10/09 19:38:35 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

module type PAIR = sig val pair : (int * int) end
module type VAL = sig val x : int end

module type MAKEPROJECTION =
	functor (P: PAIR) -> VAL

(* module MakeFst (P: PAIR) =
	struct
		let x = fst P.pair
	end *)

module MakeFst : MAKEPROJECTION =
	functor (P: PAIR) ->
	struct
		let x = fst P.pair
	end

module MakeSnd : MAKEPROJECTION =
	functor (P: PAIR) ->
	struct
		let x = snd P.pair
	end

module Pair : PAIR = struct let pair = ( 21, 42 ) end
module Fst : VAL = MakeFst (Pair)
module Snd : VAL = MakeSnd (Pair)

let () =
	Printf.printf "Fst.x = %d, Snd.x = %d\n" Fst.x Snd.x

(* 
type ('a, 'b) either = Left of 'a | Right of 'b

let bind f m = match m with
	| Left x -> Left x
	| Right x -> Right (f x)

let inc = bind (fun x: int -> x + 1)
let dec = bind (fun x: int -> x - 1)
(* let fail m = Left -42 *)
let keep m = match m with
	| Left x -> Left x
	| Right x -> Left x

let print = bind (fun x -> print_int x; x)
let e_print m = match m with
	| Left x -> print_int x
	| Right x -> print_int x

let () =
	ignore ((Right 42)|> inc |> keep |> dec |> print|> e_print);
	()
*)
