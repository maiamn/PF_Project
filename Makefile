build:
	@echo "\n============ COMPILING FORD FULKERSON ============\n"
	ocamlbuild ftest.native
	@echo "\n=========== COMPILING TASK ASSIGNMENT ============\n"
	ocamlbuild tatest.native

format:
	ocp-indent --inplace src/*

edit:
	code . -n

demo: build
	@echo "\n==== EXECUTING FORD FULKERSON ALGORITHM ====\n"
	./ftest.native graphs/graph1 1 2 outfile
	@echo "\n===== RESULT ==== (content of outfile) =====\n"
	@cat outfile
	@echo "\n========= EXECUTING TASK ASSIGNMENT ========\n"
	./tatest.native src/taskfile -1 -2 result
	@echo "\n===== RESULT OF TASK ASSIGNMENT PROBLME ====\n"
	@cat result

clean:
	-rm -rf _build/
	-rm ftest.native
	-rm tatest.native
