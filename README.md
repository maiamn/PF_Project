# Functional programming in Ocaml
Base project for Ocaml project on Ford-Fulkerson. This project contains some simple configuration files to facilitate editing Ocaml in VSCode.

## Files 
 - `fordfulkerson.mli`and `fordfulkerson.ml` -> files containing auxiliar and main functions of ford fulkerson algorithm
 - `taskassignment.mli` and `taskassignment.ml` -> files containting auxiliar and main functions of taks assignment problem
 - `taskfile` -> contains informations to define the situation of task assignment problem
 - `ftest` -> contains tests about ford fulkerson algorithm
 - `tatest` -> contains tests about task assignment problem
 - `gfile.mli` and `gfile.ml` -> contains functions to manipulate files (read & write)
 - `graph.mli` and `graph.ml` -> contains basic functions about graph (constructor, iterator, ...)
 - `tools.mli` and `tools.ml` -> contains functions to manipulate graph 

## Some commands
A makefile provides some useful commands:
 - `make build` to compile. This creates an ftest.native executable and a tatest.native executable
 - `make demo` to run `ftest` and `tatest` programs with some arguments
 - `make format` to indent the entire project
 - `make edit` to open the project in VSCode
 - `make clean` to remove build artifacts

#### VSCode 
To use, you should install the *OCaml* extension in VSCode. Other extensions might work as well but make sure there is only one installed.
Then open VSCode in the root directory of this repository (command line: `code path/to/ocaml-maxflow-project`).

Features :
 - full compilation as VSCode build task (Ctrl+Shift+b)
 - highlights of compilation errors as you type
 - code completion
 - automatic indentation on file save

In case of trouble with the VSCode extension (e.g. the project does not build, there are strange mistakes), a common workaround is to (1) close vscode, (2) `make clean`, (3) `make build` and (4) reopen vscode (`make edit`).

