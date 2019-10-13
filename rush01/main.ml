let health_tick (state : State.t) =
	let ticks = Sdltimer.get_ticks () in
	if ticks - state.last_tick >= 1000 then
		(Character.visualize state.character;
		{ state with character = Character.modify_meter pred Meter.Health state.character
		; last_tick = ticks })
	else
		state

let state_hooks = [ health_tick ]
let run_state_hooks state =
	List.fold_left (fun st h -> h st) state state_hooks

let handle_scancode code (state : State.t) =
	let scancode_handlers =
		[ (Sdlscancode.Q, [ Character.modify_meter ((+) 25)          Meter.Health
						  ; Character.modify_meter (fun x -> x - 10) Meter.Energy
						  ; Character.modify_meter (fun x -> x - 20) Meter.Hygiene
						  ; Character.modify_meter ((+) 5)           Meter.Happyness
						  ])
		; (Sdlscancode.W, [ Character.modify_meter (fun x -> x - 20) Meter.Health
						  ; Character.modify_meter ((+) 25)          Meter.Energy
						  ; Character.modify_meter (fun x -> x - 20) Meter.Happyness
						  ])
		; (Sdlscancode.E, [ Character.modify_meter (fun x -> x - 20) Meter.Health
						  ; Character.modify_meter (fun x -> x - 10) Meter.Energy
						  ; Character.modify_meter ((+) 25)          Meter.Hygiene
						  ; Character.modify_meter ((+) 5)           Meter.Happyness
						  ])
		; (Sdlscancode.R, [ Character.modify_meter (fun x -> x - 20) Meter.Health
						  ; Character.modify_meter (fun x -> x - 10) Meter.Energy
						  ; Character.modify_meter ((+) 20)          Meter.Happyness
						  ])
		] in
	match List.find_opt (fun (k,_) -> k = code) scancode_handlers with
	| None -> state
	| Some (_, h_list) -> { state with character = List.fold_left (fun c h -> h c) state.character h_list }

let draw_btns (r : Renderer.t) =
	let btn_list = [r.buttons.eat ; r.buttons.thunder ; r.buttons.bath ; r.buttons.kill ] in
	List.iteri (fun i a -> match a with
			   | None -> ()
			   | Some (t,w,h) -> let src_rect = Sdlrect.make4 0 0 w h in
								 let dst_rect = Sdlrect.make4 (i * 160 + 20) 400 w h in
								 Sdlrender.copy r.render ~texture:t ~src_rect ~dst_rect ()) btn_list

let draw_stats (render : Sdltype.renderer) x y n text =
	let rect = Sdlrect.make4 x y 100 20 in
	let perc = Sdlrect.make4 x y n 20 in
	Sdlrender.set_draw_color render (0, 0, 0) 255;
	Sdlrender.fill_rect render rect;
	Sdlrender.set_draw_color render (0, 255, 0) 255;
	Sdlrender.fill_rect render perc;
	match text with
	| Some (t,w,h) -> let src_rect = Sdlrect.make4 0 0 w h in
					  let dst_rect = Sdlrect.make4 (x - 22) (y - 50) w h in
					  Sdlrender.copy render ~texture:t ~src_rect ~dst_rect ()
	| None -> ()

let property_to_tex (st : Renderer.bar_texture) = function
	| Meter.Health -> st.health
	| Meter.Energy -> st.energy
	| Meter.Hygiene -> st.hygiene
	| Meter.Happyness -> st.happy

let draw_eevee (renderer : Renderer.t) =
	let texture = renderer.texture in
	let src_rect = renderer.src_rect in
	let dst_rect = renderer.dst_rect in
	Sdlrender.copy renderer.render ~texture ~src_rect ~dst_rect ()


let rec loop (in_state : State.t) =

	let state = run_state_hooks in_state in
	let render () =
		Sdlrender.set_draw_color state.renderer.render (255, 255, 255) 255;
		Sdlrender.clear state.renderer.render;
		
		let bars = state.renderer.bars in
		draw_stats state.renderer.render 50 100 (snd @@ List.nth state.character.meters 0) bars.health;
		draw_stats state.renderer.render 200 100 (snd @@ List.nth state.character.meters 1) bars.energy;
		draw_stats state.renderer.render 350 100 (snd @@ List.nth state.character.meters 2) bars.hygiene;
		draw_stats state.renderer.render 500 100 (snd @@ List.nth state.character.meters 3) bars.happy;

		draw_btns state.renderer;
		draw_eevee state.renderer;
		Sdlrender.render_present state.renderer.render
	in
	render ();
	if Character.is_dead state.character then
		Character.die ()
	else
		match Sdlevent.poll_event () with
		| Some (Sdlevent.Quit _) -> ()
		| Some (Sdlevent.KeyDown { scancode = sc }) when sc = Sdlscancode.ESCAPE -> ()
		| Some (Sdlevent.KeyDown { scancode = sc }) when sc = Sdlscancode.D -> Character.visualize state.character; loop (handle_scancode sc state)
		| Some (Sdlevent.KeyDown { scancode = sc }) when sc = Sdlscancode.S -> ignore (Save.save_to "save.itama" state.character); loop (handle_scancode sc state)
		| Some (Sdlevent.KeyDown { scancode = sc }) when sc = Sdlscancode.L -> (match Save.load_from "save.itama" with
																			   | None -> loop (handle_scancode sc state)
																			   | Some c -> loop (handle_scancode sc { state with character = c }))
		| Some (Sdlevent.KeyDown { scancode = sc }) -> loop (handle_scancode sc state)
		| _ -> loop state

let pixel_for_surface ~surface ~rgb =
	let fmt = Sdlsurface.get_pixelformat_t surface in
	let pixel_format = Sdlpixel.alloc_format fmt in
	let pixel = Sdlpixel.map_RGB pixel_format rgb in
	Sdlpixel.free_format pixel_format;
	(pixel)

let load_texture_opt renderer filename =
	try
		let surface = Sdlsurface.load_bmp ~filename in
		let text_w = Sdlsurface.get_width surface in
		let text_h = Sdlsurface.get_height surface in
		(* transparent pixel from white background *)
		let rgb = (255, 255, 255) in
		let key = pixel_for_surface ~surface ~rgb in
		Sdlsurface.set_color_key surface ~enable:true ~key;
		let tex = Sdltexture.create_from_surface renderer surface in
		Sdlsurface.free surface;
		Some (tex, text_w, text_h)
	with
	| _ -> print_endline ("Failed to load " ^ filename); None


let () =
	Sdl.init [`VIDEO];
	let width, height = (640, 520) in
	let win, renderer =
		Sdlrender.create_window_and_renderer ~width ~height ~flags:[]
	in
	match load_texture_opt renderer "res/eevee.bmp" with
	| None -> print_endline "Bro why did you delete the texture file?"
	| Some (texture, text_w, text_h) ->
		let center_w = (width - text_w) / 2 in
		let center_h = (height - text_h) / 2 in
		let src_rect = Sdlrect.make4 0 0 text_w text_h in
		let dst_rect = Sdlrect.make4 center_w center_h text_w text_h  in
		loop { sdl_win = win;
			character = Character.new_character;
			last_tick = Sdltimer.get_ticks ();
			renderer = {
				render = renderer;
				texture = texture;
				src_rect = src_rect;
				dst_rect = dst_rect;
				bars =
					{ health = load_texture_opt renderer "text/health.bmp"
					; energy = load_texture_opt renderer "text/energy.bmp"
					; hygiene = load_texture_opt renderer "text/hygiene.bmp"
					; happy = load_texture_opt renderer "text/happy.bmp"
					};
				buttons =
					{ eat = load_texture_opt renderer "res/q.bmp"
					; thunder = load_texture_opt renderer "res/w.bmp"
					; bath = load_texture_opt renderer "res/e.bmp"
					; kill = load_texture_opt renderer "res/e.bmp"
					}
			} };
		Sdl.quit ()
