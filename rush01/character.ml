type t =
    { meters : Meter.meter list
    }

let new_character = { meters = List.map Meter.new_t Meter.all }

let modify_meter f (prop : Meter.t) ch =
    let new_m =
        List.map (fun m -> if fst m = prop then Meter.modify f m else m) ch.meters
    in { meters = new_m }

let is_alive ch =
    List.for_all (fun (_, v) -> v > 0) ch.meters

let is_dead ch = not @@ is_alive ch

let die () = print_endline "Your character has died!"

let visualize ch =
    print_endline "[";
    List.iter (fun (v,x) -> Printf.printf "\t%s\n" @@ Meter.meter_to_string (v,x)) ch.meters;
    print_endline "]"
