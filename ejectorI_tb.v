module ejectorI_tb();

reg [10:0] northad;  
reg [10:0] southad; 
reg [10:0] eastad; 
reg [10:0] westad;
wire [10:0] nad;
wire [10:0] sad;
wire [10:0] ead;
wire [10:0] wad;
wire [10:0] lad;


initial begin
    northad = 11'bz;
    southad = 11'b00000000101;
    eastad  = 11'b10000100100;//10'b1000100001;
    westad  = 11'b00000100100;

#2  northad = 11'b10000100100; //l
    southad = 11'b00000111111; //e
    eastad  = 11'b00000101100; //n
    westad  = 11'b00000011100; //w

#2  northad = 11'b00000100110; //e
    southad = 11'b00000000001; //w
    eastad  = 11'b10000101100; //l
    westad  = 11'b00000100100; //w

#2  northad = 11'b00000101101;//10'b0000111100; //n
    southad = 11'b00000000011; //w
    eastad  = 11'b00000100100; //s
    westad  = 11'b00000100100;//10'b0000010101; //e

#2  northad = 11'b00000111101; //w
    southad = 11'b00000110100; //n
    eastad  = 11'b10000100100; //10'bz; //e
    westad  = 11'b00000100111; //l

#2 $finish;
end


ejectorI U0 (
northad,
southad,
eastad,
westad,
nad,
sad,
ead,
wad,
lad
);


endmodule
