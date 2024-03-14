transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/siyun/OneDrive/Desktop/ELEC374/elec374test {C:/Users/siyun/OneDrive/Desktop/ELEC374/elec374test/div.v}
vlog -vlog01compat -work work +incdir+C:/Users/siyun/OneDrive/Desktop/ELEC374/elec374test {C:/Users/siyun/OneDrive/Desktop/ELEC374/elec374test/srl.v}
vlog -vlog01compat -work work +incdir+C:/Users/siyun/OneDrive/Desktop/ELEC374/elec374test {C:/Users/siyun/OneDrive/Desktop/ELEC374/elec374test/sra.v}
vlog -vlog01compat -work work +incdir+C:/Users/siyun/OneDrive/Desktop/ELEC374/elec374test {C:/Users/siyun/OneDrive/Desktop/ELEC374/elec374test/shl.v}
vlog -vlog01compat -work work +incdir+C:/Users/siyun/OneDrive/Desktop/ELEC374/elec374test {C:/Users/siyun/OneDrive/Desktop/ELEC374/elec374test/rotright.v}
vlog -vlog01compat -work work +incdir+C:/Users/siyun/OneDrive/Desktop/ELEC374/elec374test {C:/Users/siyun/OneDrive/Desktop/ELEC374/elec374test/rotleft.v}
vlog -vlog01compat -work work +incdir+C:/Users/siyun/OneDrive/Desktop/ELEC374/elec374test {C:/Users/siyun/OneDrive/Desktop/ELEC374/elec374test/ripplecarryaddr.v}
vlog -vlog01compat -work work +incdir+C:/Users/siyun/OneDrive/Desktop/ELEC374/elec374test {C:/Users/siyun/OneDrive/Desktop/ELEC374/elec374test/edgetrigreg.v}
vlog -vlog01compat -work work +incdir+C:/Users/siyun/OneDrive/Desktop/ELEC374/elec374test {C:/Users/siyun/OneDrive/Desktop/ELEC374/elec374test/datapath.v}
vlog -vlog01compat -work work +incdir+C:/Users/siyun/OneDrive/Desktop/ELEC374/elec374test {C:/Users/siyun/OneDrive/Desktop/ELEC374/elec374test/bidirectional_bus.v}
vlog -vlog01compat -work work +incdir+C:/Users/siyun/OneDrive/Desktop/ELEC374/elec374test {C:/Users/siyun/OneDrive/Desktop/ELEC374/elec374test/mux2x1.v}
vlog -vlog01compat -work work +incdir+C:/Users/siyun/OneDrive/Desktop/ELEC374/elec374test {C:/Users/siyun/OneDrive/Desktop/ELEC374/elec374test/BusMuxEncoder.v}
vlog -vlog01compat -work work +incdir+C:/Users/siyun/OneDrive/Desktop/ELEC374/elec374test {C:/Users/siyun/OneDrive/Desktop/ELEC374/elec374test/and_gate.v}
vlog -vlog01compat -work work +incdir+C:/Users/siyun/OneDrive/Desktop/ELEC374/elec374test {C:/Users/siyun/OneDrive/Desktop/ELEC374/elec374test/or_gate.v}
vlog -vlog01compat -work work +incdir+C:/Users/siyun/OneDrive/Desktop/ELEC374/elec374test {C:/Users/siyun/OneDrive/Desktop/ELEC374/elec374test/not_gate.v}
vlog -vlog01compat -work work +incdir+C:/Users/siyun/OneDrive/Desktop/ELEC374/elec374test {C:/Users/siyun/OneDrive/Desktop/ELEC374/elec374test/ALU.v}
vlog -vlog01compat -work work +incdir+C:/Users/siyun/OneDrive/Desktop/ELEC374/elec374test {C:/Users/siyun/OneDrive/Desktop/ELEC374/elec374test/MDRreg.v}
vlog -vlog01compat -work work +incdir+C:/Users/siyun/OneDrive/Desktop/ELEC374/elec374test {C:/Users/siyun/OneDrive/Desktop/ELEC374/elec374test/neg_gate.v}
vlog -vlog01compat -work work +incdir+C:/Users/siyun/OneDrive/Desktop/ELEC374/elec374test {C:/Users/siyun/OneDrive/Desktop/ELEC374/elec374test/booths.v}
vlog -vlog01compat -work work +incdir+C:/Users/siyun/OneDrive/Desktop/ELEC374/elec374test {C:/Users/siyun/OneDrive/Desktop/ELEC374/elec374test/sub_gate.v}

vlog -vlog01compat -work work +incdir+C:/Users/siyun/OneDrive/Desktop/ELEC374/elec374test {C:/Users/siyun/OneDrive/Desktop/ELEC374/elec374test/sra_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  sra_tb

add wave *
view structure
view signals
run 500 ns
