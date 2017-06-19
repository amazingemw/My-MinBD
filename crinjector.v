module crinjector (
northad,
southad,
eastad,
westad,
crinject,
nad,
sad,
ead,
wad
);

input [10:0] northad;
input [10:0] southad;
input [10:0] eastad;
input [10:0] westad;
input [10:0] crinject;
output [10:0] nad;
output [10:0] sad;
output [10:0] ead;
output [10:0] wad;

wire [10:0] northad;
wire [10:0] southad;
wire [10:0] westad;
wire [10:0] eastad;           //0 is from east, 1 from west, 2 from north, 3 from south 
wire [10:0] crinject;
reg [10:0] nad;               //0 is to east, 1 to west, 2 to north, 3 to south 
reg [10:0] sad;
reg [10:0] ead;
reg [10:0] wad;

integer limiter_flag;        //flag to limit injection to one per channel data change
                                    
                                      
always @(northad or crinject or southad or westad or eastad)  
begin                            
 limiter_flag = 0;           //re-initializing limit_flag value as zero at every data change
 directandfill(northad, crinject, nad, nad[8:6]);     //function to fill a blank channel
 directandfill(southad, crinject, sad, sad[8:6]);     //with a local channel
 directandfill( eastad, crinject, ead, ead[8:6]);
 directandfill( westad, crinject, wad, wad[8:6]);
end


reg [2:0] col;                //global variables for task directandfill
reg [2:0] row;

task directandfill;
	input [10:0] addr;
	input [10:0] crinject;
	output [10:0] adr;
	output [2:0] dir;

	begin 
	
        	if (addr[5:0] === 6'bz && limiter_flag === 0) begin
			adr = crinject;
	 		row = crinject[5:3];  
			col = crinject[2:0]; 
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
					dir = 3'b100; 	        //LOCAL    
				end
	       		end
			limiter_flag = 1;
		end else begin
			adr = addr;
			dir = addr[8:6];
		end
	end  //begin's end
endtask


endmodule


