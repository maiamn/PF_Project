open Graph
open Tools
open Gfile

type path = id list

type flow_label = 
  { flow : int ; 
    capacity : int }

(* Function which takes a flow label and returns a string *)
val string_of_flow_label : flow_label -> string 

(* Function which takes a graph and returns the associated flow graph *)
val init_flow_graph : int graph -> flow_label graph 

(* Function which takes a graph, a source and a sink and returns a path from source to sink*) 
val find_path : int graph -> id -> id -> path -> path option


(* Function which takes a graph and returns the associated residual graph *)
val get_residual_graph : flow_label graph -> int graph


(* Function which takes a path and a graph and returns the minimal label of arcs of the path 
val get_incremental_value : 'a graph -> path -> int*)
