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

let create_array () =
[|
"1) — А вы чего расстались–то?
— Она сказала, что у неё иссяк запал.
— Что запало?
— Иссяк!
— А это что?
— Да я тоже не понял. 1)";

"2) — Девушка, вы могли бы полюбить радикала ?
— Ради чего? 2)";

"3) — Вы читали Анну Каренину?
— Да, читал
— Что вы скажете о героине?
— Героин - мощное вещество. А почему вы спрашиваете? 3)";

"4) Рассказала сыну теорию струн. Пусть лучше от меня услышит, чем от пацанов во дворе. 4)";

"5) Если черный кот дважды пересек вам дорогу, он отменил неприятности или удвоил?
Если кот векторный, то отменил, если скалярный, то удвоил. 5)"
|]

let randomelement arr =
	let n = Random.int (Array.length arr) in
	Array.get arr n

let () =
	Random.self_init ();
	let arrray = create_array () in
	print_endline (randomelement arrray)