type t =
    | Eat
    | Thunder
    | Bath
    | Kill

type action = (string * t)
let all = [ ("Eat", Eat); ("Thunder", Thunder); ("Bath", Bath); ("Kill", Kill) ]
