module pdn_tb();

reg [10:0] north_in;
reg [10:0] south_in;
reg [10:0] west_in;
reg [10:0] east_in;         //0 is from east, 1 from west, 2 from north, 3 from south 
wire [10:0] north_out;           //0 is to east, 1 to west, 2 to north, 3 to south 
wire [10:0] south_out;
wire [10:0] east_out;
wire [10:0] west_out;


initial begin
   north_in = 11'b00011001100; //to south
   south_in = 11'b01010101100; //to north
   east_in  = 11'b10010101100; //to north
   west_in  = 11'b00000100111; //to east
 
#4  north_in = 11'b00011000100; //to south
    south_in = 11'b10010101100; //to north
    east_in  = 11'b01001101101; //to east
    west_in  = 11'b00000011001; //to west
   
#4  north_in = 11'b10011001100; //to south
    south_in = 11'b00010111100; //to north
    east_in  = 11'b01001101000; //to west
    west_in  = 11'b00000010101; //to east	
   
#4  north_in = 11'b00011010100; //to south
    south_in = 11'b01010110100; //to north
    east_in  = 11'b00011001100; //to south
    west_in  = 11'b00010110100; //to north	
 
#4  north_in = 11'b01011011100; //to south
    south_in = 11'b00010101100; //to north
    east_in =  11'b00000010101; //to east	
    west_in  = 11'b10001101101; //to east
#5 $finish;
end

pdn U0 (   //Connect DUT to test bench
 north_in,
 south_in,
 west_in,
 east_in,        //0 is from east, 1 from west, 2 from north, 3 from south 
 north_out,           //0 is to east, 1 to west, 2 to north, 3 to south 
 south_out,
 east_out,
 west_out
);

endmodule