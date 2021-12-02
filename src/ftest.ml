open Gfile
open Tools 
open Fordfulkerson

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
  let graph = from_file infile in
 

  (*let graph2 = clone_nodes graph in *)
  (*let graph3 = gmap graph (fun x -> string_of_int((int_of_string(x)*2))) in*)
  let intgraph = gmap graph int_of_string in   
  (*let graph4 = add_arc intgraph 0 4 1000 in
  let stringgraph4 = gmap graph4 string_of_int in*)

  let graph5 = init_flow_graph intgraph in 
  (*let stringgraph5 = gmap graph5 string_of_flow_label in*)

  let graph6 = get_residual_graph graph5 in 
  let stringgraph6 = gmap graph6 string_of_int in

  (* Rewrite the graph that has been read. *)
  let () = write_file outfile stringgraph6 in 
  let () = export outfile stringgraph6 in

  ()
