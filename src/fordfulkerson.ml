open Graph 
open Tools
open Gfile


type flow_label = 
  { flow : int ; 
    capacity : int } 

type pathId = id list


let string_of_flow_label x = string_of_int(x.flow) ^ "/" ^ string_of_int(x.capacity)

let rec string_of_path_aux accu = function
  | [] -> (accu ^ "end")
  | a::b -> (string_of_path_aux (" node " ^ (string_of_int a) ^ " -> " ^ accu) b)

let string_of_path = function 
  | None -> "None"
  | Some p -> string_of_path_aux "" (List.rev p)


let rec string_of_arcs accu = function
  | [] -> (accu ^ "end")
  | (id, _)::b -> (string_of_arcs (" node " ^ (string_of_int id) ^ " -> " ^ accu) b)


(* Function which takes a graph and returns the associated flow graph *)
let init_flow_graph graph = 
  let init_arc = (fun x -> {flow=0 ; capacity=x}) in 
  gmap graph init_arc 


(* Function which takes a graph and returns the associated residual graph *)
let get_residual_graph graph = 
  let gr_nodes = (clone_nodes graph) in
  let new_capacity_arc = (fun g id1 id2 lbl -> new_arc g id1 id2 lbl.capacity) in

  let gr2 = e_fold graph new_capacity_arc gr_nodes in
  let new_flow_arc = (fun g id1 id2 lbl -> new_arc g id2 id1 0) in
  e_fold graph new_flow_arc gr2


(* Function which takes a residual graph, a source and a sink and returns a path from source to sink*)
let rec find_path_aux residual_graph source sink nodes_path = 
  (*si source = sink on s'arrete
    sinon : on regarde les arcs sortants de la source (dans l'ordre) et on regarde si on arrive au puits
    à chaque fois on regarde si le nouveau node dans lequel on arrive n'est pas dans la liste de ceux déjà visités*)
  match source with 
  (* notre source est égale au puits, on a fini*)
  | x when x = sink -> Some (nodes_path)
  (*on regarde les arcs sortants*)
  | x -> let out = out_arcs residual_graph x in 
    explore_out_arcs residual_graph sink nodes_path out


and explore_out_arcs residual_graph sink nodes_path out = 
  match out with 
  (* si il n'y a pas d'arcs sortants, on ne peut pas trouver de chemin*)
  | [] -> None
  (*si il y a des arcs sortants, on regarde le premier noeud de la liste*)
  (*si ce noeud appartient déjà au chemin alors on le passe*)
  | (id, lbl)::rest -> if (List.mem id nodes_path || lbl=0) then (explore_out_arcs residual_graph sink nodes_path rest)
  (*sinon on l'explore*)
    else match (find_path_aux residual_graph id sink (id::nodes_path)) with 
      | None -> (explore_out_arcs residual_graph sink nodes_path rest)
      | Some x -> Some x

let find_path residual_graph source sink = 
  match (find_path_aux residual_graph source sink [source]) with 
  | None -> None
  | Some x -> Some (List.rev x)


(* Function which takes a graph, a source and a sink and returns the associated residual graph*)

let rec find_min min = function 
  | [] -> min
  | lbl::rest -> if (lbl < min) then find_min lbl rest else find_min min rest

let rec get_incremental_value_aux graph path accu =
  match path with
  | [] -> accu
  | [x] -> accu
  | (id1::rest) -> match rest with
    | [] -> accu
    | (id2::rest2) -> match (find_arc graph id1 id2) with 
      | None -> accu
      | Some lbl -> get_incremental_value_aux graph rest (lbl::accu)

let get_incremental_value graph path = 
  find_min 9999 (get_incremental_value_aux graph path [])


(* Function which takes a graph, a path and an value and add the value to label of all arcs of the path *)

let rec update_graph gr path value = 
  match path with
  | [] -> gr
  | [x] -> gr
  | id1::rest -> match rest with
    | id2::rest2 -> let gr2 = add_arc gr id1 id2 (-value) in
      let gr3 = add_arc gr2 id2 id1 (+value) in
      update_graph gr3 rest value


(* Function to implement the main loop of ford fulkerson algorithm 
 * 1. find a path from source to sink in the graph
 * 2. get the incremental value of this path 
 * 3. update the graph with by incrementing this value 
*)
let loop_ff graph src dest = 
  let p = find_path graph src dest in 
  match p with
  | None -> None
  | Some path ->
    let flow = get_incremental_value graph path in
    let newGraph = update_graph graph path flow in
    Some (newGraph, flow)

(* Function which takes a graph, a soource, a sink, a graph accumulator, an int accumulator and returns a tuple containing the final graph and the final maximal flow *)
let rec ff_aux graph src dest acu_gr acu_flow =
  let res = loop_ff graph src dest in 
  match res with
  | None -> (acu_gr, acu_flow)
  | Some (newGraph, flow) -> ff_aux newGraph src dest newGraph (acu_flow + flow)

(* Function which takes a graph, a source, a sink and returns a tuple containing the final graph and the maximal flow  *)
let ford_fulkerson graph src dest =
  let flow_graph = init_flow_graph graph in
  let residual_graph = get_residual_graph flow_graph in
  ff_aux residual_graph src dest residual_graph 0
