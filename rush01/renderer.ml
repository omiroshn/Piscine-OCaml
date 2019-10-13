type bar_texture =
    { health : (Sdltexture.t * int * int) option
    ; energy : (Sdltexture.t * int * int) option
    ; hygiene : (Sdltexture.t * int * int) option
    ; happy : (Sdltexture.t * int * int) option
    }

type button_texture =
    { eat : (Sdltexture.t * int * int) option
    ; thunder : (Sdltexture.t * int * int) option
    ; bath : (Sdltexture.t * int * int) option
    ; kill : (Sdltexture.t * int * int) option
    }

type t =
{
	render : Sdltype.renderer;
	texture : Sdltexture.t;
	src_rect : Sdlrect.t;
    dst_rect : Sdlrect.t;
    bars : bar_texture;
    buttons : button_texture
}
