open Graph
open Tools
open Gfile
open Fordfulkerson


(******************************************************************************************)
(******** Next specifications are not useful anymore as they won't be used by user ********)
(******************************************************************************************)

(* Function to read a line defining the number of students working on the project *)
val get_number_of_students : string -> int 

(* Function to read a line defining a student and the number of tasks he can realize *)
val read_students : int graph -> string -> int graph

(* Function to read a line defining the number of tasks needed in the project *)
val get_number_of_tasks : string -> int 

(*Function to read a line defining a task and the number of students needed to work on it *)
val read_tasks : int graph -> string -> int graph

(* Function to read an association between a task and a student *)
val read_associations : int graph -> string -> int graph

(* Function to read a file and return a graph corresponding to the situation *)
val read_file : string -> int graph

(* Function to read a file and return the result of FF algorithm *)
val get_assignment_graph : string -> int graph * int

(* Function to transform an arc to a string with interpretation *)
val arc_processing : id -> id -> int -> string 

(* Function to write the interpretation of graph in a file *)
val task_assignment_aux : string -> int graph -> int -> unit 




(** Specification of main function -> only one used by user **)
val task_assignment : string -> string -> unit 

