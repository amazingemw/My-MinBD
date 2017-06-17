module random_no();

reg [1:0] R;
reg [2:0] cthulhu;
initial begin
R = $random %2;
#2 R = {$random} %2;           //CONCATENATION OF RANDOM PREVENTS -VE NOS
#2 R = $unsigned($random) %2;  //$unsigned CONVERTS SIGNED TO UNSIGNED NOS
#2 R = $random %2;
#2 R = $random %2;
#2 R = $random %2;
cthulhu = 5;
if(cthulhu === 5) begin
$display("Heloo Holaa whatsupp buddies?");
end
#2 $finish;

end
endmodule