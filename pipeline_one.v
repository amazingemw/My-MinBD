
module pipeline_one(
inc,
nsig,
ssig,
esig,
wsig,
clksig,
clk,
noun,
soun,
eoun,
woun
);

input [6:0] inc;
input nsig;
input ssig;
input esig;
input wsig;
input clksig;
input clk;
output [10:0] noun;
output [10:0] soun;
output [10:0] eoun;
output [10:0] woun;

wire [6:0] inc;
wire nsig;
wire ssig;
wire esig;
wire wsig;
wire clksig;
wire clk;
reg [10:0] noun;
reg [10:0] soun;
reg [10:0] eoun;
reg [10:0] woun;

reg [6:0] pipeline [0:19];

integer i;
integer j;
integer k;
integer initclk;

initial begin
i = 0;
k = 1;
initclk = 0; 
end

always @ (posedge clksig)begin
	initclk = 1;
end

always @ (nsig or ssig or esig or wsig or clk) begin

	if ( i < 21 && (nsig === 1 || ssig === 1 || esig === 1 || wsig === 1)) begin
		if (nsig === 1) begin
			pipeline [i] = inc;
		end else if (ssig === 1) begin
			pipeline [i+1] = inc;
		end else if (esig === 1) begin
			pipeline [i+2] = inc;
		end else if (wsig === 1) begin
			pipeline [i+3] = inc;
		end
		k = k+1; 
		if (k === 5) begin 
		i = i+4;
		k = 1;
		end
	end
	if (initclk && clk) begin
		if(pipeline[0][6] === 1'bz)
			noun = 11'bz;
		else begin
			{noun[10],noun[5:0]} = pipeline [0];
			noun [9:6] = 4'b000;
		end
		if(pipeline[1][6] === 1'bz)
			soun = 11'bz;
		else begin
			{soun[10],soun[5:0]} = pipeline [1]; 
			soun [9:6] = 4'b000;
		end
		if(pipeline[2][6] === 1'bz)
			eoun = 11'bz;
		else begin
			{eoun[10],eoun[5:0]} = pipeline [2];
			eoun [9:6] = 4'b000;
		end
		if(pipeline[3][6] === 1'bz)
			woun = 11'bz;
		else begin
			{woun[10],woun[5:0]} = pipeline [3];
			woun [9:6] = 4'b000;
		end
		for(j = 0; j<16 ; j = j+1) begin          
   			pipeline [j] = pipeline [j+4];
			pipeline [j+4] = 7'bz;
		end
		if(i !== 0)
		i = i-4;
	end
end	
endmodule