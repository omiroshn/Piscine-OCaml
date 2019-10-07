# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: omiroshn <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/10/05 16:31:02 by omiroshn          #+#    #+#              #
#    Updated: 2019/10/05 16:31:03 by omiroshn         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = ex00

SOURCE = Color.ml main.ml
OBJ = Color.cmx main.cmx

INTERFACE = Color.mli
INT_OBJ = Color.cmi

all: $(NAME)
   
$(NAME): $(INT_OBJ) $(OBJ)
	ocamlopt -o $(NAME) $(OBJ)

%.cmx: %.ml 
	ocamlopt -o $@ -c $^

%.cmi: %.mli
	ocamlopt -o $@ -c $^

clean:
	rm *.cmx *.cmi *.o

fclean:
	rm *.cmx *.cmi *.o
	rm $(NAME)
