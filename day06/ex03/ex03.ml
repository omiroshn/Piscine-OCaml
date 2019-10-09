(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ex03.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/10/09 20:14:49 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/10/09 20:14:50 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

module type FIXED =
sig
	type t
	val of_float : float -> t
	val of_int : int -> t
	val to_float : t -> float
	val to_int : t -> int
	val to_string : t -> string
	val zero : t
	val one : t
	val succ : t -> t
	val pred : t -> t
	val min : t -> t -> t
	val max : t -> t -> t
	val gth : t -> t -> bool
	val lth : t -> t -> bool
	val gte : t -> t -> bool
	val lte : t -> t -> bool
	val eqp : t -> t -> bool (** physical equality *)
	val eqs : t -> t -> bool (** struc tural equality *)
	val add : t -> t -> t
	val sub : t -> t -> t
	val mul : t -> t -> t
	val div : t -> t -> t
	val foreach : t -> t -> (t -> unit) -> unit
end

module type FRACTIONNAL_BITS = sig
	val bits: int
end

module Make (B : FRACTIONNAL_BITS) : FIXED =
struct
	type t = int
	let of_float input = int_of_float ( floor (0.5 +. (float_of_int (1 lsl B.bits) *. input)))
	let of_int input = input * (1 lsl B.bits)
	let to_float input = float_of_int(input) /. float_of_int(1 lsl B.bits)
	let to_int input = input / (1 lsl B.bits)
	let to_string input = string_of_float (to_float input)
	let zero = of_int 0
	let one = of_int 1
	let succ input = input + 1
	let pred input = input - 1
	let min x y = if x <= y then x else y
	let max x y = if x >= y then x else y
	let gth x y = x > y
	let lth x y = x < y
	let gte x y = x >= y
	let lte x y = x <= y
	let eqp x y = x = y
	let eqs x y = x == y
	let add x y = x + y
	let sub x y = x - y
	let mul x y = (of_float((to_float x) *. (to_float y)))
	let div x y = (of_float((to_float x) /. (to_float y)))
	let foreach	 (x:t) (y:t) (f:t-> unit) =
		let rec ft_for x y cmp op = begin match x with
			| x when not (cmp x y) -> ()
			| _ -> f x ; ft_for (op x) y cmp op
		end in 
		match x with
			| x when x > y -> ft_for x y gte pred
			| _  -> ft_for x y lte succ
end

module Fixed4 : FIXED = Make (struct let bits = 4 end)
module Fixed8 : FIXED = Make (struct let bits = 8 end)

let () =
	let x8 = Fixed8.of_int 21 in
	let y8 = Fixed8.of_int 21 in
	let r8 = Fixed8.add x8 y8 in
	print_endline (string_of_int (Fixed8.to_int r8));
	let x8 = Fixed8.of_float 21.10 in
	let y8 = Fixed8.of_float 21.32 in
	let r8 = Fixed8.add x8 y8 in
	print_endline (Fixed8.to_string r8);
	let zero = Fixed4.zero in
	let one = Fixed8.one in
	print_endline (Fixed4.to_string zero);
	print_endline (Fixed8.to_string one);
	Fixed4.succ zero;
	Fixed8.pred one;
	print_endline (Fixed4.to_string zero);
	print_endline (Fixed8.to_string one);
	print_endline ("=========>");
	Fixed4.foreach (Fixed4.zero) (Fixed4.one) (fun f -> print_endline (Fixed4.to_string f))
