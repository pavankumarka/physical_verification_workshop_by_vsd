module inverter_tb (
  output wire out,
  input wire in
);

wire GND  ;
wire net1  ;
wire net2  ;

inverter
x1 ( 
 .vdd( net2 ),
 .in( net1 ),
 .out( out ),
 .vss( GND )
);


vsource
#(
.value ( "PWL(0 )
)
V1 ( 
 .p( net1 ),
 .m( GND )
);


vsource
#(
.value ( 1.8 )
)
V2 ( 
 .p( net2 ),
 .m( GND )
);

.lib /usr/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.control
tran 1n 1u
plot V(in) V(out)
.endc
endmodule

// expanding   symbol:  inverter.sym # of pins=4
// sym_path: /home/pshimoga/Day1_lab1/inverter/xschem/inverter.sym
// sch_path: /home/pshimoga/Day1_lab1/inverter/xschem/inverter.sch
module inverter (
  inout wire vdd,
  input wire in,
  output wire out,
  inout wire vss
);


nfet_01v8
#(
.L ( 0.18 ) ,
.W ( 4.5 ) ,
.nf ( 3 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_01v8 ) ,
.spiceprefix ( X )
)
M1 ( 
 .D( out ),
 .G( in ),
 .S( vss ),
 .B( vss )
);


pfet3_01v8
#(
.L ( 0.18 ) ,
.W ( 3 ) ,
.body ( vdd ) ,
.nf ( 3 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M2 ( 
 .D( out ),
 .G( in ),
 .S( vdd )
);

endmodule
