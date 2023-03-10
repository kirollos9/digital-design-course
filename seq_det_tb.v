module seq_det_tb();
reg clk,rst,x;
wire y;
wire [9:0] count;
seq_det dut(clk,rst,x,y,count);
integer i;
initial begin
clk=0;
forever
#1 clk=~clk;
end
initial begin
	$monitor("x=%b,y=%b,count=%d",x,y,count);
end
initial begin
	rst=1;
	x=0;
	#50;
	rst=0;
	#50;
	for(i=0;i<1000;i=i+1)begin
		@(negedge clk)
		x=$random;
	end
	$stop;
end
endmodule