type ('a, 'b) t = 'b -> 'a * 'b

let return x = fun s -> (x, s)

let map f m = fun s ->
  match m s with
  | v, s' -> (f v s', s')

let (>|=) m f = map f m

let bind f m = fun s ->
  match m s with
  | v, s' -> (f v s') s


let (>>=) m f = bind f m

let (let*) = (>>=)

let run m a = 
  match m a with
  | (x, _) -> x

let put s = fun _ -> (() , s)
