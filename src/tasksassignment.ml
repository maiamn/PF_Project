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

/!\ the nodes numbers of students et tasks must be different! Otherwise, the graph created will not represent the problem correctly

Example :
student 1 2
student 2 1
student 3 3
student 4 3
task 5 3
task 6 3
task 7 2
association 1 5
association 1 6
association 2 7
association 3 5
association 3 6
association 3 7
association 4 5
association 4 6
association 4 7 *)

let source = (-1)
let sink = (-2)
let default_label = 1



(*Function that creates a node for each student and an arc from source to student with label "number of tasks that this student can do"*)
let read_students graph line = 
  try 
    Scanf.sscanf line "student %d %d" (fun student nb_tasks -> new_arc (new_node graph student) source student nb_tasks) 
  with e ->
    Printf.printf "Impossible to read student in line : \n%s\n" line ; 
    failwith "from_file"



(*Function that creates a node for each task and an arc from task to sink with label "number of students needed to achieve that task"*)
let read_tasks graph line =
  try 
    Scanf.sscanf line "task %d %d" (fun task nb_students -> new_arc (new_node graph task) task sink nb_students)
  with e ->
    Printf.printf "Impossible to read task in line : \n%s\n" line ; 
    failwith "from_file"
    


(*Function that creates an arc for each association with default label 1*)
let read_associations graph line = 
  try 
    Scanf.sscanf line "association %d %d" (fun student task -> new_arc graph student task default_label) 
  with e ->
    Printf.printf "Impossible to read association in line : \n%s\n" line ; 
    failwith "from_file"
      
      

(* Function that reads a comment *)
let read_comment graph line =
  try
    Scanf.sscanf line "%%" graph
  with _ ->
    Printf.printf "Unknown line : \n%s\n" line ; 
    failwith "from_file"
   
      
  
(* Function that creates a graph from a source file *)
let read_file file =
  (* Open the file *)
  let open_file = open_in file in 

  (* Initialize the graph *)
  let init_graph = new_node (new_node empty_graph source) sink in
  
  (* Read all lines until end of file *)
  let rec loop graph =
    try
      (* Read a line *)
      let line = input_line open_file in 
      
      (* Remove spaces from line*)
      let line = String.trim line in
      
      let graph_aux = 
        
        (* Ignore empty lines *)
        if line = "" then graph
        
        (* Match the first character of the line *)
        else match line.[0] with 
          | 's' -> read_students graph line
          | 't' -> read_tasks graph line
          | 'a' -> read_associations graph line
          | _ -> read_comment graph line
      in
      loop graph_aux 
    
    with End_of_file -> graph 

  in
 
  let result = loop init_graph in

  close_in open_file ;
  result


(* Function using FF algorithm 
 * -> takes a source file
 * -> returns the modificated graph and the maximal flow 
 *)

let get_assignment_graph file =
   (* Define the initial graph *)
   let graph1 = read_file file in 

   (* Use FF algorithm to solve the problem of task assignment *)
   let (new_graph, max_flow) = ford_fulkerson graph1 source sink in 

   (new_graph, max_flow)




(* Iterate on all arcs of the graph *)
(* Various possibilities according to the nodes of the arc 
 * source -> student_id   : "The student student_id can realize lbl tasks more"
 * student_id -> source   : "The student student_id already realizes lbl tasks"
 * student_id -> task_id  : "The student student_id can realize task task_id" 
 * task_id -> student_id  : "The task task_id is realized by student student_id"
 * task_id -> sink        : "lbl students are missing to work on the task task_id"
 * sink -> task_id        : "lbl students will work on the task task_id"
 *)
let arc_processing id1 id2 lbl = 
   if (id1=source) then let res="The student %d can realize %d tasks more \n" id2 lbl in  
   else if (id2=source) then let res="The student %d already realizes %d tasks \n" id1 lbl in
   else if (id1=sink) then let res="%d students will work on the task %d \n" lbl id2 in
   else if (id2=sink) then let res="%d students are missing to work on the task %d \n" lbl id1 in
   else let res="STILL NEED TO IMPLEMENT" in 

   res 


let task_assignment_aux file graph flow =
   
   (* Open a write-file *)
   let result = open_out file in 
 
   (* Write in this file *)
   fprintf result "// This is the result of the task assignment // \n" ;

   (* Write the maximal flow of this problem *)
   fprintf result "The maximal flow of this problem is : %d \n" flow ; 

   (* Write all arcs on result format *)
   e_iter graph arc_processing ; 

   (* End of file *)
   fprintf result "// End of file // \n" ; 

   (* Close the file *)
   close_out result ; 
   ()



(* Main function of task assignment 
 * -> takes a source file containing students, taks and associations 
 * -> returns a file at format "task N is done by student S"
 *)

let task_assignment infile outfile = 
   (* Get the result of FF *)
   let (final_graph, max_flow) = get_assignment_graph infile in 

   (* Read the graph to return an understandable file *)
   let result = task_assignment_aux outfile final_graph max_flow in 

   (* Return the result *)
   ()
 

