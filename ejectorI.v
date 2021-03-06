module ejectorI (
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
 ejectout(northad, nad[5:0], nad[8:6],nad[10:9],lad);     //function to fill a blank channel
 ejectout(southad, sad[5:0], sad[8:6],sad[10:9],lad);     //with a local channel
 ejectout(eastad, ead[5:0], ead[8:6],ead[10:9],lad);
 ejectout(westad, wad[5:0], wad[8:6],wad[10:9],lad);
end


reg [2:0] col;                //global variables for task directandfill
reg [2:0] row;

task ejectout;
	
	input [10:0] addr;
	output [5:0] adr;
	output [2:0] dir;
        output [1:0] gs;
	output [10:0] local;

	begin   
		{gs,dir,adr} = addr;
		row = addr[5:3];  
		col = addr[2:0]; 
        	if ( col > 3'b100) begin
			dir = 3'b000;             	//EAST
       		end
       		if ( col < 3'b100) begin
			dir = 3'b001;             	//WEST
       		end 
		if ( col === 3'b100) begin
			if ( row > 3'b100) begin
				dir = 3'b010;           //NORTH
       			end
			if ( row < 3'b100) begin
				dir = 3'b011;           //SOUTH
      			end
			if ( row === 3'b100) begin
				if(flag === 0) begin		
					local = addr;
					{gs,dir,adr} = 11'bz;
					flag = 1;
				end
				else
					dir = 3'b100;
			end
       		end
	end  //begin's end
endtask
endmodule
