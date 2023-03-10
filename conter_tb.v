module counter_tb();
wire [3:0]count,out;
reg clk,rst; 
counter_1 c1(clk,rst,count);
bit4_ripple b1(clk,rst,out);
integer i=0;
initial begin
	clk=0;
forever 
#1 clk=~clk;
end
initial begin 
rst=0;
#50;
rst=1;
#200;
rst=0;

end
endmodule