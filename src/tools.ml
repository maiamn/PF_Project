(* Yes, we have to repeat open Graph. *)
open Graph

(* assert false is of type ∀α.α, so the type-checker is happy. *)

(*returns a new graph having the same nodes than gr, but no arc.*)
let clone_nodes (gr:'a graph) = n_fold gr new_node empty_graph

(*maps all arcs of gr by function f.*)
let gmap gr f = 
     let gr_nodes = (clone_nodes gr) in
     let new_f_arc = (fun g id1 id2 lbl -> new_arc g id1 id2 (f lbl)) in
     e_fold gr new_f_arc gr_nodes

(*adds n to the value of the arc between id1 and id2. If the arc does not exist, it is created.*)
let add_arc g id1 id2 n =  
     match (find_arc g id1 id2) with
          | None -> (new_arc g id1 id2 n)
          | Some x -> (new_arc g id1 id2 (x+n))

