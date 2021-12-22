open Graph 
open Tools
open Gfile
open Fordfulkerson
open Printf


(*This algorithm solves tasks assignment problems.
It needs information about students and tasks.*)

(*Input files format :
- create a student : "student s n" where s is the student's number and n is the number of tasks that they can do 
- create a task : "task t n" where t is the task's number et n is the number of students needed to achieve this task
- define what kind of task a student can do : "association s t" where s is the student's number and t is the task's number

Example :
student 1 2
student 2 1
student 3 3
student 4 3
task 1 3
task 2 3
task 3 2
association 1 1
association 1 2
association 2 3
association 3 1
association 3 2
association 3 3
association 4 1
association 4 2
association 4 3 *)

let source = (-1)
let sink = 0
let default_label = 1
let init_graph = new_node (new_node empty_graph source) sink


(*Function that creates a node for each student and an arc from source to student with label "number of tasks that this student can do"*)
let read_students graph line = 
   Scanf.sscanf line "student %d %d" (fun student nb_tasks -> new_arc (new_node graph student) source student nb_tasks)
    
(* let test_read_students = (fun phrase -> read_students (new_node empty_graph source) phrase) *)

(*Function that creates a node for each task and an arc from task to sink with label "number of students needed to achieve that task"*)
let read_tasks graph line = 
   Scanf.sscanf line "task %d %d" (fun task nb_students -> new_arc (new_node graph task) task sink nb_students)
    
(* let test_read_tasks = (fun graph phrase -> read_tasks (new_node graph sink) phrase) *)


(*Function that creates an arc for each association with default label 1*)
let read_associations graph line = 
   Scanf.sscanf line "association %d %d" (fun student task -> new_arc graph student task default_label)
    
(*let test_read_associations = (fun graph phrase -> read_associations graph phrase) *)


(* Function that creates a graph from a source file *)
let read_file file =
  
  (* Create an empty graph *)
  let graph = empty_graph in

  (* Read all lines until end of file *)
  let rec loop n =
    try
      (* Read a line *)
      let line = input_line file in 

      match line with 
        | "student %d %d" ->
        | "task %d %d" ->
        | "association %d %d" ->









