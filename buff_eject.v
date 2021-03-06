module buff_eject (
northad,
southad,
eastad,
westad,
cthulhu,
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
input [2:0] cthulhu;
output [10:0] nad;
output [10:0] sad;
output [10:0] ead;
output [10:0] wad;
output [10:0] sbuff;

wire [10:0] northad;
wire [10:0] southad;
wire [10:0] eastad;
wire [10:0] westad;
wire [2:0] cthulhu;
reg [10:0] nad;
reg [10:0] sad;
reg [10:0] ead;
reg [10:0] wad;
reg [10:0] sbuff;

reg [1:0] R;
reg flag;
reg i;
reg j;
reg k;
reg l;
reg sig;

always @ (northad,southad,eastad,westad) begin
	sad = {southad[10:9],3'bz,southad[5:0]};
	ead = {eastad[10:9],3'bz,eastad[5:0]};
	wad = {westad[10:9],3'bz,westad[5:0]};
	nad = {northad[10:9],3'bz,northad[5:0]};
	flag = 0;
	i = 0;
	j = 0;
	k = 0;
	l = 0;
	sig = 0;
	sbuff = 11'bz;
	if(cthulhu !== 5) begin
		while (flag === 0) begin
			if(sig === 0) begin
				if((i === 0) && (j === 0) && (k === 0) && (l === 0))
					R = $unsigned($random) %2;
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
					if(northad[8:6] === 3'b010 || northad === 11'bz)
						i = 1;
					else begin
						sbuff = {northad[10:9],3'bz,northad[5:0]};
						nad = 11'bz; 
						flag = 1;
					end
				end else if(R === 2'b01) begin
					if(southad[8:6] === 3'b011 || southad === 11'bz)
						j = 1;
					else begin
						sbuff = {southad[10:9],3'bz,southad[5:0]};
						sad = 11'bz;
						flag = 1;
					end 
				end
				else if(R === 2'b10) begin
					if(eastad[8:6] === 3'b000 || eastad === 11'bz)
						k = 1;
					else begin
						sbuff = {eastad[10:9],3'bz,eastad[5:0]};
						ead = 11'bz;
						flag = 1;
					end
				end
				else if(R === 2'b11) begin
					if(westad[8:6] === 3'b001 || westad === 11'bz)
						l = 1;
					else begin
						sbuff = {westad[10:9],3'bz,westad[5:0]};
						wad = 11'bz;
						flag = 1;
					end
				end
				sig = 0;
			end 			// END OF if(sig)
		end 				// END OF while  
	end					// END OF if(cthulhu) 
end						// END OF always BLOCK

endmodule