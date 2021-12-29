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

  (* Open file *)
  (*let graph = from_file infile in*)



  (********************************************************************)
  (****************************** TOOLS *******************************)
  (********************************************************************)

  (******************** TEST FUNCTION clone_nodes *********************)
  (*let graph2 = clone_nodes graph in*)


  (*********************** TEST FUNCTION gmap *************************)
  (*let graph3 = gmap graph (fun x -> string_of_int((int_of_string(x)*2))) in 
    let intgraph = gmap graph int_of_string in*)


  (********************** TEST FUNCTION add_arc ***********************)
  (*let graph4 = add_arc intgraph 0 4 1000 in
    let stringgraph4 = gmap graph4 string_of_int in*)


  (****************** TEST FUNCTION init_flow_graph *******************)
  (*let graph5 = init_flow_graph intgraph in 
    let stringgraph5 = gmap graph5 string_of_flow_label in*)


  (***************** TEST FUNCTION get_residual_graph *****************)
  (*let graph6 = get_residual_graph graph5 in 
    let stringgraph6 = gmap graph6 string_of_int in*)


  (********************* TEST FUNCTION find_path **********************)

  (* let path1 = find_path graph6 0 5 in
     let stringpath1 = string_of_path path1 in
     let () = printf "%s\n" ("path trouve : " ^ stringpath1) in

     let path2 = [0; 1; 5] in
     let path3 = [0; 3; 1; 5] in *)

  (*************** TEST FUNCTION get_incremental_value ****************)
  (*let label = get_incremental_value graph6 path2 in
    let labelstring = string_of_int label in 
    let () = printf "%s\n" ("min : " ^ labelstring) in *)


  (******************** TEST FUNCTION update_graph ********************)
  (*let graph7 = update_graph graph6 path2 label in
    let stringgraph7 = gmap graph7 string_of_int in*)








  (********************************************************************)
  (********************* FORD FULKERSON ALGORITHM *********************)
  (********************************************************************)

  (******************* FONCTIONNEMENT FF ALGORITHM ********************)
  (*
  (*1*)
  let pathT1 = find_path graph6 0 5 in
  let stringpathT1 = string_of_path pathT1 in
  let () = printf "%s\n" ("path trouve : " ^ stringpathT1) in

  let pathTest = [0; 1; 5] in

  let label = get_incremental_value graph6 pathTest in
  let labelstring = string_of_int label in 
  let () = printf "%s\n" ("min : " ^ labelstring) in 

  let graph7 = update_graph graph6 pathTest label in
  let stringgraph7 = gmap graph7 string_of_int in

  (*2*)
  let pathT2 = find_path graph7 0 5 in
  let stringpathT2 = string_of_path pathT2 in
  let () = printf "%s\n" ("path trouve : " ^ stringpathT2) in

  let pathTest2 = [0; 3; 1; 5] in

  let label2 = get_incremental_value graph7 pathTest2 in
  let labelstring2 = string_of_int label2 in 
  let () = printf "%s\n" ("min : " ^ labelstring2) in

  let graph8 = update_graph graph7 pathTest2 label2 in
  let stringgraph8 = gmap graph8 string_of_int in 

  (*3*)
  let pathT3 = find_path graph8 0 5 in
  let stringpathT3 = string_of_path pathT3 in
  let () = printf "%s\n" ("path trouve : " ^ stringpathT3) in

  let pathTest3 = [0; 2; 4; 5] in

  let label3 = get_incremental_value graph8 pathTest3 in
  let labelstring3 = string_of_int label3 in 
  let () = printf "%s\n" ("min : " ^ labelstring3) in

  let graph9 = update_graph graph8 pathTest3 label3 in
  let stringgraph9 = gmap graph9 string_of_int in 


  (*4*)
  let pathT4 = find_path graph9 0 5 in
  let stringpathT4 = string_of_path pathT4 in
  let () = printf "%s\n" ("path trouve : " ^ stringpathT4) in
  *)


  (******************* TEST FUNCTION ford_fulkerson *******************)
  (*let (graphff, flowff) = ford_fulkerson intgraph 0 5 in
    let stringgraph_ff = gmap graphff string_of_int in
    let () = printf "%s\n" ("flow : " ^ string_of_int flowff) in *)








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
