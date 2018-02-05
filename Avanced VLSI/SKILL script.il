/* SKILL Programming
As a part of this project we learnt a new scripting language which is interfaced with cadence virtuoso called SKILL programming. Initially we placed a
2x2 cell using SKILL and after many iterations and getting the DRC clean we then moved on to
placing the 2048 cells using this.

SKILL Code for 64x32
*/

procedure(core_cell64x32(demo SRAM) 
     
    ; Open cellview to write 
    cv = dbOpenCellViewByType(demo &quot;cell64x32&quot; &quot;layout&quot; &quot;maskLayout&quot; &quot;w&quot;) 
    printf(&quot;\n%s opened&quot; demo) 
     ; Open the SRAM cell 
    cvi = dbOpenCellViewByType(demo SRAM &quot;layout&quot;) 
     
    ; Instantiate the cells 
    for(col 0 1
        for(row 0 1
    dbCreateInst( cv cvi &quot;&quot; list(col*1.969 row*1.751) &quot;R0&quot;) //The values 1.969 and 1.751 and after clean DRC
)
) 
    dbClose(cvi) 
 
    dbSave(cv) 
    dbClose(cv) 
 
)
