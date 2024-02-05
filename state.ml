type ('a, 'b) t = 'b -> 'a * 'b

let return x s = (x, s)
let map f m s = match m s with v, s' -> (f v, s')
let bind f m s = match m s with v, s' -> (f v) s'
let ( >>= ) m f = bind f m
let ( let* ) m f = bind f m
let ( let+ ) m f = map f m
let run_state m a = match m a with x, _ -> x
let put s _ = ((), s)
let get () s = (s, s)
