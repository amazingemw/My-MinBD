module buff_eject(
northad,
southad,
eastad,
westad,
nad,
sad,
ead,
wad,
sbuff
);

input [10:0] northad;
input [10:0] southad;
input [10:0] eastad;
input [10:0] westad;
output [10:0] nad;
output [10:0] sad;
output [10:0] ead;
output [10:0] wad;
output [10:0] sbuff;

wire [10:0] northad;
wire [10:0] southad;
wire [10:0] eastad;
wire [10:0] westad;
reg [10:0] nad;
reg [10:0] sad;
reg [10:0] ead;
reg [10:0] wad;
reg [10:0] sbuff;

reg [1:0] R;
reg flag;


always @ (northad,southad,eastad,westad) begin
	sad = {southad[10:9],3'bz,southad[5:0]};
	ead = {eastad[10:9],3'bz,eastad[5:0]};
	wad = {westad[10:9],3'bz,westad[5:0]};
	nad = {northad[10:9],3'bz,northad[5:0]};
	flag = 0;
	while (flag === 0) begin
		R = $random %2;
		if(R === 2'b00) begin	
			if(northad[8:6] === 3'b010)
				flag = 0;
			else begin
				sbuff = nad;
				nad = 11'bz; 
				flag = 1;
			end
		end
		if(R === 2'b01) begin
			if(southad[8:6] === 3'b011)
				flag = 0;
			else begin
				sbuff = sad;
				sad = 11'bz;
				flag = 1;
			end 
		end
		if(R === 2'b10) begin
			if(eastad[8:6] === 3'b000)
				flag = 0;
			else begin
				sbuff = ead;
				ead = 11'bz;
				flag = 1;
			end
		end
		if(R === 2'b11) begin
			if(westad[8:6] === 3'b001)
				flag = 0;
			else begin
				sbuff = wad;
				wad = 11'bz;
				flag = 1;
			end
		end
	end	
end

endmodule