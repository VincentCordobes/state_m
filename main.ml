open Format
open State

let pp_s ppf (v, s) = 
  fprintf ppf "@[(%s, %d)@." v s

let print_state = 
  printf "%a" pp_s


let prog1 =
  return "OCaml"
  |> map (fun x -> print_state (x, 0); "is")
  |> map (fun x -> print_state (x, 0))
  >>= (fun _ -> put 5 |> map (fun _ -> "awesome"))
  >>= (fun x -> get () |> map (fun s -> print_state (x, s)))



let prog =
  let* s = get () in
  printf "initial state -> %d@." s;
  let* _ = put (s + 1) in
  let+ s = get () in
  printf "new state -> %d@." s



let _ = run_state prog 1
  
