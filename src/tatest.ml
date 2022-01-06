open Gfile
open Tools 
open Fordfulkerson
open Printf
open Tasksassignment
open Graph

let () =

  (* Check the number of command-line arguments *)
  if Array.length Sys.argv <> 5 then
    begin
      Printf.printf "\nUsage: %s infile source sink outfile\n\n%!" Sys.argv.(0) ;
      exit 0
    end ;


  (* Arguments are : infile(1) source-id(2) sink-id(3) outfile(4) *)

  let infile = Sys.argv.(1)
  and outfile = Sys.argv.(4)

  (* These command-line arguments are not used for the moment. *)
  and _source = int_of_string Sys.argv.(2)
  and _sink = int_of_string Sys.argv.(3)
  in


  (********************************************************************)
  (********************** TEST TASKS ASSIGNMENTS **********************)
  (********************************************************************)

  (****************** TEST functions to read a file *******************)

  (*let graph_students = read_students empty_graph "student 1 2" in
    let graph_tasks = read_tasks graph_students "task 2 2" in
    let graph_associations = read_associations graph_tasks "association 1 2" in
    let stringgraphtasks = gmap graph_associations string_of_int in *)

  (******************* TEST FUNCTION global reading *******************)
  (* let graphfile = read_file infile in
     let stringgraphfile = gmap graphfile string_of_int in *)

  (************* TEST apply FF on tasks assignment problem ************)
  (*let (graphFF, flow) = task_assignment infile in 
    let stringgraphresult = gmap graphFF string_of_int in *)

  (******************* TEST FUNCTION arc_processing *******************)
  (*let phrase = arc_processing 1 5 3 in
    let () = printf "%s \n" phrase in *)

  (********************* TEST FUNCTION is_student *********************)
  
  (*let list1 = [1;2;3] in
  let list2 = add_student_id list1 "student 4 2" in 
  let () = print_list list2 in*) 


  (*let list = get_list_of_students infile in
  let res0 = is_student 0 list in
  let res1 = is_student 1 list in 
  let res2 = is_student 2 list in 
  let res3 = is_student 3 list in 
  let res4 = is_student 4 list in 
  let res5 = is_student 5 list in 
  let res6 = is_student 6 list in 
 
  let () = printf "%B \n" res0 in 
  let () = printf "%B \n" res1 in 
  let () = printf "%B \n" res2 in 
  let () = printf "%B \n" res3 in 
  let () = printf "%B \n" res4 in 
  let () = printf "%B \n" res5 in 
  let () = printf "%B \n" res6 in *)


  (************************ TEST FINAL FUNCTION ***********************)
  let () = task_assignment infile outfile in 


  (* Rewrite the graph that has been read. *) 
  (*let () = export outfile stringgraphfile in *)
  (*let () = write_file outfile stringgraph7 in *)



  ()
