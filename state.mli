type ('a, 'b) t

val return : 'a -> ('a, 's) t
val map : ('a -> 'b) -> ('a, 's) t -> ('b, 's) t
val ( let+ ) : ('a, 's) t -> ('a -> 'b) -> ('b, 's) t
val bind : ('a -> ('b, 's) t) -> ('a, 's) t -> ('b, 's) t
val ( >>= ) : ('a, 's) t -> ('a -> ('b, 's) t) -> ('b, 's) t
val ( let* ) : ('a, 's) t -> ('a -> ('b, 's) t) -> ('b, 's) t
val put : 's -> (unit, 's) t
val get : unit -> ('s, 's) t
val run_state : ('a, 's) t -> 's -> 'a
