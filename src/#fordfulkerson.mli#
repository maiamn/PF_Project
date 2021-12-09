open Graph
open Tools
open Gfile

type flow_label = 
  { flow : int ; 
    capacity : int }

type pathId = id list

(* Function which takes a flow label and returns a string *)
val string_of_flow_label : flow_label -> string 

(* Function which takes a pathId and returns a string *)
val string_of_path : pathId option -> string 

val string_of_path_aux : string -> pathId -> string 

(* Function which takes a graph and returns the associated flow graph *)
val init_flow_graph : int graph -> flow_label graph

(* Function which takes a graph and returns the associated residual graph *)
val get_residual_graph : flow_label graph -> int graph

(* Function which takes a graph, a source and a sink and returns a path from source to sink*) 
val find_path : int graph -> id -> id -> pathId option

(* Function which takes a path and a graph and returns the minimal label of arcs of the path *)
val get_incremental_value : int graph -> pathId -> int

(* Function which takes a graph, a path and an value and add the value to label of all arcs of the path *)
val update_graph : int graph -> pathId -> int -> int graph 

(* Function to implement the main loop of ford fulkerson algorithm which takes a graph, a source, a sink and returns a tuple containing a graph and an integer *)
val loop_ff : int graph -> id -> id -> (int graph * int) option 

(* Function which takes a graph, a source, a sink and returns a tuple containing the final graph and the maximal flow  *)
val ford_fulkerson : int graph -> id -> id -> (int graph * int)
