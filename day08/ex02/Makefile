# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/10/11 15:14:15 by omiroshn          #+#    #+#              #
#    Updated: 2019/10/11 15:14:16 by omiroshn         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

RESULT = a.out
ATOMS = atom.ml carbon.ml copper.ml hydrogen.ml iron.ml oxygen.ml tin.ml nitrogen.ml
MOLECULE = molecule.ml water.ml carbondioxyde.ml trinitrotoluene.ml glucose.ml ozone.ml sugar.ml
ALKANES = alkane.ml
SOURCES =	$(addprefix atom/, $(ATOMS)) \
			$(addprefix molecule/, $(MOLECULE)) \
			$(addprefix alkane/, $(ALKANES)) \
			main.ml
include OCamlMakefile
