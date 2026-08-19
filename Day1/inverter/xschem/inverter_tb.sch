v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 1500 -1380 1550 -1380 { lab=in}
N 1440 -1320 1500 -1320 { lab=GND}
N 1500 -1320 1850 -1320 { lab=GND}
N 1850 -1340 1850 -1320 { lab=GND}
N 1440 -1420 1440 -1380 { lab=#net1}
N 1440 -1420 1850 -1420 { lab=#net1}
N 1850 -1420 1850 -1380 { lab=#net1}
N 1850 -1360 1880 -1360 { lab=out}
N 1500 -1400 1500 -1380 { lab=in}
C {inverter.sym} 1700 -1360 0 0 {name=x1}
C {devices/vsource.sym} 1500 -1350 0 0 {name=V1 value="PWL(0 0 20n 0 900n 1.8)"}
C {devices/vsource.sym} 1440 -1350 0 0 {name=V2 value=1.8}
C {devices/gnd.sym} 1620 -1320 0 0 {name=l1 lab=GND}
C {devices/opin.sym} 1880 -1360 0 0 {name=p2 lab=out}
C {devices/code_shown.sym} 1760 -1470 0 0 {name=s1 only_toplevel=false value=".lib /usr/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt"}
C {devices/code_shown.sym} 1760 -1280 0 0 {name=s2 only_toplevel=false value=".control
tran 1n 1u
plot V(in) V(out)
.endc"}
C {devices/ipin.sym} 1500 -1400 0 0 {name=p1 lab=in}
