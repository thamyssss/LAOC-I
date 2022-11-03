transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/Quartus/Quartus/Aula_10/Int_Mem {D:/Quartus/Quartus/Aula_10/Int_Mem/Int_Mem.v}

