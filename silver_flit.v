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

always @ (northad,southad,eastad,westad) begin
	sad = southad;
	ead = eastad;
	wad = westad;
	nad = northad;
	flag = 0;
	while (flag === 0) begin
		R = $random %2;
		if(R === 2'b00) begin	
			if(northad[10] !== 1'b1 || northad[5:0] === 6'bz)
				flag = 0;
			else begin
				nad[9] = 1'b1; 
				flag = 1;
			end
		end
		if(R === 2'b01) begin
			if(southad[10] === 1'b1 || southad[5:0] === 6'bz)
				flag = 0;
			else begin
				sad[9] = 1'b1;
				flag = 1;
			end 
		end
		if(R === 2'b10) begin
			if(eastad[10] === 1'b1 || eastad[5:0] === 6'bz)
				flag = 0;
			else begin
				ead[9] = 1'b1;
				flag = 1;
			end
		end
		if(R === 2'b11) begin
			if(westad[10] === 1'b1 || westad[5:0] === 6'bz)
				flag = 0;
			else begin
				wad[9] = 1'b1;
				flag = 1;
			end
		end
	end	
end

endmodule