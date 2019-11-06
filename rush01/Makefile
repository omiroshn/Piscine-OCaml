TARGET = rush01
MAIN = main
TARGET_NATIVE = $(MAIN).native
SRC = $(MAIN).ml
SETUP_STAMP = .setup_stamp
PKG = -pkg sdl2
OCAMLC = ocamlbuild $(PKG)

all: $(TARGET)

$(TARGET): $(SETUP_STAMP)
	$(OCAMLC) $(TARGET_NATIVE)
	mv $(TARGET_NATIVE) $(TARGET)

$(SETUP_STAMP):
# 	brew install sdl2
	# export PKG_CONFIG_PATH=~/.brew/lib/pkgconfig/
	opam install ocamlsdl2
	opam install ocamlbuild
	touch $(SETUP_STAMP)

clean:
	rm -rf _build

fclean: clean
	rm -f $(TARGET)

re: fclean all