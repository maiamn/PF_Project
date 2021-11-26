open Graph 
open Tools
open Gfile

type path = string 

type flow_label = 
  { flow : int ; 
    capacity : int } 


let string_of_flow_label x = string_of_int(x.flow) ^ "/" ^ string_of_int(x.capacity)


(* Function which takes a graph and returns the associated flow graph *)
let init_flow_graph graph = 
  let init_arc = (fun x -> {flow=0 ; capacity=x}) in 
  gmap graph init_arc 

(* Function which takes a graph, a source and a sink and returns a path from source to sink 
let find_path graph source sink = assert false *)


(* Function which takes a graph, a source and a sink and returns the associated residual graph *)
let get_residual_graph graph = 
  let graph_nodes = clone_nodes graph in
  gmap graph2 (fun x -> x.flow)


(* Function which takes a graph, a source and a sink and returns the associated residual graph
let get_incremental_value graph path = assert false *)
