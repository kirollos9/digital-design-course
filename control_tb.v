module control_tb();
 reg clk,rst;
reg [7:0]speed_limit,car_speed;
reg  [6:0] leading_distance;
wire unlock_doors,accelerate_car;
conrol_unit dut (clk,rst,speed_limit,car_speed,leading_distance,unlock_doors,accelerate_car);
integer i;
initial begin
clk=0;
forever
#1 clk=~clk;
end
initial begin
	$monitor("speed_limit=%d,car_speed=%d,leading_distance=%d,unlock_doors=%d,accelerate_car=%d",speed_limit,car_speed,leading_distance,unlock_doors,accelerate_car);
end
initial begin
	rst=1;
	speed_limit=100;
	car_speed=0;
	leading_distance=0;
	#50;
	rst=0;
	#50;
	for(i=0;i<1000;i=i+1)begin
		@(negedge clk)
		car_speed=$random;
		leading_distance=$random;
	end
	$stop;
end
endmodule