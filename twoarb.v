module twoarb(
inp1,
inp2,
out1,
out2
);

input [10:0] inp1;
input [10:0] inp2;
output [10:0] out1;
output [10:0] out2;

wire [10:0] inp1;
wire [10:0] inp2;
reg [10:0] out1;
reg [10:0] out2;

reg R;


always @ (inp2) begin
	if ( (inp1[9] == 1'b1 || inp1[10] == 1'b1) && inp2[10] != 1'b1 ) begin
		if (inp1[8:6] == 3'b000 || inp1[8:6] == 3'b001) begin 
			out2[10:0] = inp1[10:0];
			out1[10:0] = inp2[10:0];
		end else begin  
		        out1[10:0] = inp1[10:0];
			out2[10:0] = inp2[10:0];
	        end      
	end else if ( (inp2[9] == 1'b1 || inp2[10] == 1'b1) && inp1[10] != 1'b1 ) begin 
	        if (inp2[8:6] == 3'b000 || inp2[8:6] == 3'b001) begin 
			out1[10:0] = inp1[10:0];
		        out2[10:0] = inp2[10:0];
	        end else begin 
	           	out1[10:0] = inp2[10:0];
	         	out2[10:0] = inp1[10:0];
	        end
	end else begin
		R = $random %1;
		if ( R == 0) begin
			out1 = inp1;
			out2 = inp2;
		end
		if ( R == 1) begin
			out1 = inp2;
			out2 = inp1;
		end
	end
 	/*end else if (inp1[8:6] == 3'b000 || inp1[8:6] == 3'b001 ) begin 
                  	  out1[9:0] = inp2[9:0];
	  	 	  out2[9:0] = inp1[9:0];
    	  end else begin 
	         	  out1[9:0] = inp1[9:0];
	         	  out2[9:0] = inp2[9:0];
	  end*/
end
endmodule
