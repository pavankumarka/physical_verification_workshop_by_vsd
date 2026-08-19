v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 1600 -1370 1600 -1280 { lab=in}
N 1550 -1340 1600 -1340 { lab=in}
N 1640 -1250 1640 -1240 { lab=vss}
N 1640 -1240 1660 -1240 { lab=vss}
N 1640 -1280 1650 -1280 { lab=vss}
N 1650 -1280 1650 -1240 { lab=vss}
N 1640 -1340 1640 -1310 { lab=out}
N 1640 -1320 1730 -1320 { lab=out}
N 1640 -1430 1640 -1400 { lab=vdd}
N 1640 -1430 1670 -1430 { lab=vdd}
C {sky130_fd_pr/nfet_01v8.sym} 1620 -1280 0 0 {name=M1
L=0.18
W=4.5
nf=3 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet3_01v8.sym} 1620 -1370 0 0 {name=M2
L=0.18
W=3  
body=vdd  
nf=3
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {devices/ipin.sym} 1560 -1340 0 0 {name=p1 lab=in}
C {devices/opin.sym} 1730 -1320 0 0 {name=p2 lab=out}
C {devices/iopin.sym} 1660 -1240 0 0 {name=p3 lab=vss}
C {devices/iopin.sym} 1660 -1430 0 0 {name=p4 lab=vdd}
