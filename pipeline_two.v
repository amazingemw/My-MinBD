module pipeline_two(
nty,
sty,
ety,
wty,
clk,
nxt,
sxt,
ext,
wxt
);

input [10:0] nty;
input [10:0] sty;
input [10:0] ety;
input [10:0] wty;
input clk;
output [10:0] nxt;
output [10:0] sxt;
output [10:0] ext;
output [10:0] wxt;

wire [10:0] nty;
wire [10:0] sty;
wire [10:0] ety;
wire [10:0] wty;
wire clk;
reg [10:0] nxt;
reg [10:0] sxt;
reg [10:0] ext;
reg [10:0] wxt;

reg [10:0] pipeline2 [0:11];
integer i;
integer j;

//LOCAL CLOCK NOT REQUIRED

initial begin
i=0;
end

always @ (nty or sty or ety or wty or clk) begin
	if(i < 9 && (nty !== pipeline2 [i-4] || sty !== pipeline2 [i-3] || ety !== pipeline2 [i-2] || wty !== pipeline2 [i-1])) begin
		pipeline2 [i] = nty;
		pipeline2 [i+1] = sty;
        	pipeline2 [i+2] = ety;
		pipeline2 [i+3] = wty;
		i=i+4;
	end                      //No k variable needed as time of all inputs received //is obvious (due to automated assignment)
	if( clk === 1 ) begin
		nxt = pipeline2 [0];
		sxt = pipeline2 [1];
		ext = pipeline2 [2];	
		wxt = pipeline2 [3];
		for(j = 0; j<8 ; j = j+1) begin
        	    pipeline2 [j] = pipeline2 [j+4];
		    pipeline2 [j+4] = 11'bz;	
		end
		if(i !== 0)
		i = i-4;
	end
end     
                         
 
/*always @ (posedge clk) begin                   //MULTIPLE DRIVING
	nxt = pipeline2 [0];
	sxt = pipeline2 [1];
	ext = pipeline2 [2];
	wxt = pipeline2 [3];
	for(j = 0; j<8 ; j = j+1) begin
            pipeline2 [j] = pipeline2 [j+4];
	end
	if(i !== 0)
	i = i-4;
end*/

endmodule