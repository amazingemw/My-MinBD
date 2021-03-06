module crinjector_tb();

reg [10:0] northad;
reg [10:0] southad;
reg [10:0] westad;
reg [10:0] eastad;         //0 is from east, 1 from west, 2 from north, 3 from south 
reg [10:0] crinject;
wire [10:0] nad;           //0 is to east, 1 to west, 2 to north, 3 to south 
wire [10:0] sad;
wire [10:0] ead;
wire [10:0] wad;


initial begin
   northad = 11'bz;
   southad = 11'b00000000101;
   eastad  = 11'b10000100001;
   westad  = 11'b00000100111;
   crinject = 11'b00000111111;
  
   //$display("Time\t address Direction");
   //$monitor("%g  \t %b      %b",$time, addr, direct);
#2  northad = 11'bz;//1000100101; //l
    southad = 11'bz;   	      //e
    eastad  = 11'b00000101100; //n
    westad  = 11'bz;//0000011100; //w
    crinject = 11'b00000100000;
   
#2  northad = 11'bz;//0000100110; //e
    southad = 11'b00000000001; //w
    eastad  = 11'bz;          //l
    westad  = 11'b00000010001; //w
    crinject = 11'b00000101100; 	
   
#2  northad = 11'b00000111100; //n
    southad = 11'b00000000011; //w
    eastad  = 11'b00000001100; //s
    westad  = 11'b00000010101; //e
    crinject = 11'b00000001100;
 
#2  northad = 11'b00000001000; //w
    southad = 11'b00000110100; //n
    eastad  = 11'bz;          //e
    westad  = 11'b00000100111; //l
    crinject = 11'b00000000000;	
#5 $finish;
end

sbinjector U0 (           //Connect DUT to test bench
.northad(northad),
.southad(southad),
.westad(westad),
.eastad(eastad),        //0 is from east, 1 from west, 2 from north, 3 from south 
.crinject(crinject),
.nad(nad),              //0 is to east, 1 to west, 2 to north, 3 to south 
.sad(sad),
.ead(ead),
.wad(wad)
);

endmodule