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

NAME = ex03

SOURCE = Deck.ml main.ml
OBJ = Deck.cmx main.cmx

INTERFACE = Deck.mli
INT_OBJ = Deck.cmi

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
