RUN assembler 
`as min.s -o min.o`

Link object file
`ld min.o -o min`
   
Run binary
`./min`

Check output
`echo $?`


to emit 32 bit binary and linking use following instructions
` as pow.as -o pow.o --32`
` ld pow.o -o pow -melf_i386`


The reference book
http://download-mirror.savannah.gnu.org/releases/pgubook/ProgrammingGroundUp-0-8.pdf
