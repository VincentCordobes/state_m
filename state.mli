type ('a, 'b) t

val return : 'a -> ('a, 'b) t

val map : ('a -> 'b -> 'c) -> ('a, 'b) t -> ('c, 'b) t

val (>|=) : ('a, 'b) t -> ('a -> 'b -> 'c) -> ('c, 'b) t

val bind : ('a -> 'b -> ('c, 'b) t) -> ('a, 'b) t -> ('c, 'b) t

val (let*) : ('a -> 'b -> ('c, 'b) t) -> ('a, 'b) t -> ('c, 'b) t

val (>>=) : ('a, 'b) t -> ('a -> 'b -> ('c, 'b) t) -> ('c, 'b) t

val put : 'a -> (unit, 'a) t

val run : ('a, 'b) t -> 'b -> 'a
