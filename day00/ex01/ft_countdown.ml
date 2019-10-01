(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_countdown.ml                                    :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/10/01 18:32:30 by omiroshn          #+#    #+#             *)
(*   Updated: 2019/10/01 18:32:31 by omiroshn         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec ft_countdown x =
	if x <= 0 then
		begin
			print_char '0';
			print_char '\n';
		end
	else
		begin
			print_int x;
			print_char '\n';
			ft_countdown (x - 1);
		end

let main() =
	print_endline "3 =====>";
	ft_countdown 3;
	print_endline "0 =====>";
	ft_countdown 0;
	print_endline "-20 =====>";
	ft_countdown (-20);
	print_endline "7 =====>";
	ft_countdown 7

let () = main ()
