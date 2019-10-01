(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_power.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/10/01 18:32:18 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/10/01 18:32:19 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec ft_power base power =
	if power <= 0
	then 1
	else base * (ft_power base (power - 1))

let main() =
	print_int (ft_power 2 2); print_char '\n';
	print_int (ft_power 0 0); print_char '\n';
	print_int (ft_power 1 0); print_char '\n';
	print_int (ft_power 0 1); print_char '\n';
	print_int (ft_power 2 8); print_char '\n';
	print_int (ft_power 2 25); print_char '\n';
	print_int (ft_power (-2) 25); print_char '\n';
	print_int (ft_power (-2) 26); print_char '\n'

let () = main ()
