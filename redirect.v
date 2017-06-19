//THIS MODULE ONLY REDIRECTS FLITS TO SIDE BUFFER IF ALL CHANNELS ARE OCCUPIED
//AND THE CLOCK THRESHOLD HAS BEEN EXCEEDED
module redirect (
cthulhu,
northad,
southad,
eastad,
westad,
nad,
sad,
ead,
wad,
buffit,
inject
);

input [2:0] cthulhu;
input [10:0] northad;  
input [10:0] southad; 
input [10:0] eastad; 
input [10:0] westad;
output [10:0] nad;
output [10:0] sad;
output [10:0] ead;
output [10:0] wad;
output [10:0] buffit;
output inject;


wire [2:0] cthulhu;
wire [10:0] northad;  
wire [10:0] southad; 
wire [10:0] eastad; 
wire [10:0] westad;
reg [10:0] nad;
reg [10:0] sad;
reg [10:0] ead;
reg [10:0] wad;
reg [10:0] buffit;
reg inject;

reg [1:0] R;

always @ (cthulhu) begin
	buffit = 11'bz;
	nad = northad;
	sad = southad;
	ead = eastad;
	wad = westad;
	inject = 0;
	R = {$random} %2;
	if((northad === 11'bz) || (southad === 11'bz) || (eastad === 11'bz) || (westad === 11'bz))
		inject = 1;
	else if((cthulhu === 5) && (northad !== 11'bz)  && (southad !== 11'bz) && (eastad !== 11'bz) && (westad !== 11'bz)) begin
		if(R === 2'b00) begin
			buffit = northad;
			nad = 11'bz;
		end
		if(R === 2'b01) begin
			buffit = southad;
			sad = 11'bz;
		end
		if(R === 2'b10) begin
			buffit = eastad;
			ead = 11'bz;
		end
		if(R === 2'b11) begin
			buffit = westad;
			wad = 11'bz;
		end
	end
end

endmodule