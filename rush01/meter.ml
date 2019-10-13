type t =
    | Health
    | Hygiene
    | Energy
    | Happyness

type meter = t * int

let all = [ Health; Hygiene; Energy; Happyness ]
let new_t m = (m, 100)
let modify f (m, n) =
    let new_n = f n in
    if new_n > 100 then (m, 100)
    else if new_n < 0 then (m, 0)
    else (m, new_n)

let t_to_string = function
    | Health -> "Health"
    | Hygiene -> "Hygiene"
    | Energy -> "Energy"
    | Happyness -> "Happyness"

let meter_to_string (m, v) = "(" ^ t_to_string m ^ "," ^ string_of_int v ^ ")"
