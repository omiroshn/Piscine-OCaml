let save_to filename ch =
    try
        let file = open_out filename in
        output_value file ch;
        close_out_noerr file;
        true
    with
    | _ -> false

let load_from filename =
    try
        let file = open_in filename in
        let (v : Character.t) = input_value file in
        Some v
    with
    | _ -> None
