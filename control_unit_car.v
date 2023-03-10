module conrol_unit(clk,rst,speed_limit,car_speed,leading_distance,unlock_doors,accelerate_car);
input clk,rst;
input [7:0]speed_limit,car_speed;
input [6:0] leading_distance;
output reg unlock_doors,accelerate_car;
reg cs,ns;
parameter MIN_DISTANCE=7'd40;
parameter ACCELERATE=2'b00;
parameter DECLERATE=2'b01;
parameter STOP =2'b10;
always @(posedge clk or posedge rst) begin
	if (rst) 
		cs<=STOP;
	else 
		cs<=ns;
end
always@(cs)begin
	case(cs)
		STOP:begin 
			unlock_doors=1;
			accelerate_car=0;
		end
		DECLERATE:begin 
			unlock_doors=0;
			accelerate_car=0;
		end
		ACCELERATE:begin
			unlock_doors=0;
			accelerate_car=1; 
		end
		default:begin
			unlock_doors=1;
			accelerate_car=0;
		end
	endcase
end
always@(*)begin 
case(cs)
	STOP:begin
		if(leading_distance<MIN_DISTANCE)
			ns=STOP;
		else
			ns=ACCELERATE;
	end
	DECLERATE:begin
		if((leading_distance<MIN_DISTANCE)||(car_speed>speed_limit))
			ns=DECLERATE;
		else if(car_speed==0)
			ns=STOP;
		else 
			ns=ACCELERATE;
	end
	ACCELERATE:begin
		if((leading_distance<MIN_DISTANCE)||(car_speed>speed_limit))
			ns=DECLERATE;
		else
			ns=ACCELERATE;
	end
	
	default: ns=STOP;
endcase
end
endmodule