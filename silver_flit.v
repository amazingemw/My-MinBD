module silver_flit(
northad,
southad,
eastad,
westad,
nad,
sad,
ead,
wad
);

input [10:0] northad;
input [10:0] southad;
input [10:0] eastad;
input [10:0] westad;
output [10:0] nad;
output [10:0] sad;
output [10:0] ead;
output [10:0] wad;

wire [10:0] northad;
wire [10:0] southad;
wire [10:0] eastad;
wire [10:0] westad;
reg [10:0] nad;
reg [10:0] sad;
reg [10:0] ead;
reg [10:0] wad;

reg [1:0] R;
reg flag;
reg i;
reg j;
reg k;
reg l;
reg sig;

always @ (northad,southad,eastad,westad) begin
	sad = southad;
	ead = eastad;
	wad = westad;
	nad = northad;
	flag = 0;
	i = 0;
	j = 0;
	k = 0;
	l = 0;
	sig = 0;
	while (flag === 0) begin
		if(sig === 0) begin
			if((i === 0) && (j === 0) && (k === 0) && (l === 0))
				R = {$random} %2;
			else begin
				if(i === 0)
					R = 2'b00;
				else if(j === 0)
					R = 2'b01;	
				else if(k === 0)
					R = 2'b10;
				else if(l === 0)
					R = 2'b11;
				else
					flag = 1;
			end 
			sig = 1; 
		end
		if(sig === 1) begin
			if(R === 2'b00) begin	
				if(northad[10] === 1'b1 || northad[5:0] === 6'bz)
					i = 1;
				else begin
					nad[9] = 1'b1; 
					flag = 1;
				end
			end
			if(R === 2'b01) begin
				if(southad[10] === 1'b1 || southad[5:0] === 6'bz)
					j = 1;
				else begin
					sad[9] = 1'b1;
					flag = 1;
				end 
			end
			if(R === 2'b10) begin
				if(eastad[10] === 1'b1 || eastad[5:0] === 6'bz)
					k = 1;
				else begin
					ead[9] = 1'b1;
					flag = 1;
				end
			end
			if(R === 2'b11) begin
				if(westad[10] === 1'b1 || westad[5:0] === 6'bz)
					l = 1;
				else begin
					wad[9] = 1'b1;
					flag = 1;
				end
			end
			sig = 0;
		end
	end		
end

endmodule