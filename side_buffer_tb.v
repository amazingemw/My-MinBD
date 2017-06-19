module side_buffer_tb();

reg [10:0] sbin;
reg inject;
reg [2:0] cthulhu;
wire [10:0] sbout;

initial begin
    sbin = 11'b00000111111;
    inject = 0;
    cthulhu = 1;	

#2  sbin = 11'b00000110101; 
    inject = 1;
    cthulhu = 0;	 	

#2  sbin = 11'b00000101110; 
    inject = 0;
    cthulhu = 5;	

#2  sbin = 11'b00000101101; 
    inject = 0;
    cthulhu = 1;	

#2  sbin = 11'b00000111101; 
    inject = 1;
    cthulhu = 1;	

#2 $finish;
end


side_buffer U0(
sbin,
inject,			
cthulhu,
sbout
);


endmodule
