open Format
open State

let pp_s ppf (v, s) = 
  fprintf ppf "@[(%s, %d)@." v s

let print_state = 
  printf "%a" pp_s


let prog =
  return "OCaml"
  >|= (fun x s -> print_state (x, s); "is")
  >|= (fun x s -> print_state (x, s))
  >>= (fun _ _ -> put 5 >|= (fun _ _ -> "awesome"))
  >|= (fun x s -> print_state (x, s))

let () = run prog 1
  
