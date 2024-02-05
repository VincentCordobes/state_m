open Format
open State

let pp_s ppf (v, s) = fprintf ppf "@[(%s, %d)@." v s
let print_state = printf "%a" pp_s

let prog_one =
  return "OCaml" >>= fun v ->
  get ()
  |> map (fun s ->
         print_state (v, s);
         "is")
  >>= fun v ->
  get () |> map (fun s -> print_state (v, s)) >>= fun _ ->
  put 5 >>= fun _ ->
  get ()
  |> map (fun s ->
         print_state ("()", s);
         "awesome")
  >>= fun v -> get () |> map (fun s -> print_state (v, s))

let prog =
  let* s = get () in
  printf "initial state -> %d@." s;
  let* _ = put (s + 1) in
  let+ s = get () in
  printf "new state -> %d@." s

let prog_bis =
  get ()
  >>= (fun s ->
        printf "initial state -> %d@." s;
        put (s + 1))
  >>= get
  |> map (fun s -> printf "new state -> %d@." s)

let () =
  printf "# run_state prog_one 1@.";
  run_state prog_one 1;
  printf "\n";

  printf "# run_state prog 1@.";
  run_state prog 1;
  printf "\n";

  printf "# run_state prog_bis 1@.";
  run_state prog 1
