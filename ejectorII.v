module ejectorII (
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

input [10:0] northad;  
input [10:0] southad; 
input [10:0] eastad; 
input [10:0] westad;
output [10:0] nad;
output [10:0] sad;
output [10:0] ead;
output [10:0] wad;
output [10:0] lad;

wire [10:0] northad;  
wire [10:0] southad; 
wire [10:0] eastad; 
wire [10:0] westad;
reg [10:0] nad;
reg [10:0] sad;
reg [10:0] ead;
reg [10:0] wad;
reg [10:0] lad;

integer flag; //for limiting the ejection into local


always @(northad or southad or eastad or westad)
begin
 flag = 0;        //limiter flag initialised as 0 at every data change on channel
 kickout(northad, nad[5:0], nad[8:6],nad[10:9],lad);     //function to fill a blank channel
 kickout(southad, sad[5:0], sad[8:6],sad[10:9],lad);     //with a local channel
 kickout(eastad, ead[5:0], ead[8:6],ead[10:9],lad);
 kickout(westad, wad[5:0], wad[8:6],wad[10:9],lad);
end


//ALREADY DIRECTION IS ASSIGNED, SO NO DIR COMPUTATION REQD

task kickout;
	
	input [10:0] addr;
	output [5:0] adr;
	output [2:0] dir;
        output [1:0] gs;
	output [10:0] local;

	begin   
		dir = addr[8:6];
		if((dir === 3'b100) && (flag === 0)) begin	
			local = addr;
			{gs,dir,adr} = 11'bz;
			flag = 1;
		end else begin
			gs = addr[10:9];
			adr = addr[5:0];
		end
	end  
endtask
endmodule
