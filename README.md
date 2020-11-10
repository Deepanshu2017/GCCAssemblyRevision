RUN assembler 
`as min.s -o min.o`

Link object file
`ld min.o -o min`
   
Run binary
`./min`

Check output
`echo $?`


The reference book
http://download-mirror.savannah.gnu.org/releases/pgubook/ProgrammingGroundUp-0-8.pdf
