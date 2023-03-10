module shift_R(q,shift_out,sclr,sset,shiftin,load,data,clk,enable,aclr,aset);
parameter LOAD_AVALUE=20;
parameter SHIFT_DIRECTION="LEFT";
parameter LOAD_SVALUE=30;
parameter SHIFT_WIDTH=8;
input sclr,sset,shiftin,load,clk,enable,aclr,aset;
input [SHIFT_WIDTH-1:0] data;
output reg [SHIFT_WIDTH-1:0] q;
output reg shift_out;
reg [SHIFT_WIDTH-1:0] temp;


always @(posedge clk or posedge aset or posedge aclr) begin
    if(load)begin
    temp<=data;
  
    end
	if (aclr) begin
		temp<=0;
		end
	else if (aset) begin
	if (enable)
		 temp<=LOAD_AVALUE;
	end
	else if (sclr)begin 
        temp<=0;
	end
	else if (sset)begin
	if(enable) 
        temp<=LOAD_SVALUE;
	end
	else begin
	if(enable)begin
	if(~load)begin 
	if(SHIFT_DIRECTION=="LEFT")
	temp<={temp[SHIFT_WIDTH-2:0],shiftin};
	else if(SHIFT_DIRECTION=="RIGHT")
	temp<={shiftin,temp[SHIFT_WIDTH-1:1]};
	end

	end


	end
	q<=temp;

	if(SHIFT_DIRECTION=="LEFT")
	shift_out<=temp[7];
	else if(SHIFT_DIRECTION=="RIGHT")
	shift_out<=temp[0];

end


endmodule
