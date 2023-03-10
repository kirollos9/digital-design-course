module seq_det(clk,rst,x,y,count);
parameter A=2'b00;
parameter B=2'b01;
parameter C=2'b10;
parameter D=2'b11;
input clk,rst,x;
output y;
output [9:0] count;
reg [9:0]temp_count=0;
reg [1:0]cs,ns;
//state memory
always @(posedge clk or posedge rst) begin
	if (rst) 
		cs<=A;
	else 
		cs<=ns;
end


always @(cs,x) begin
	case(cs)
	A:begin
		if(x)
			ns=A;
		else
			ns=B;
	end
	B:begin
		if(x)
			ns=C;
		else
			ns=B;
	end
	C:begin
		if(x)
			ns=A;
		else
			ns=D;
	end
	D:begin
		if(x)
			ns=C;
		else
			ns=B;
	end
	default: ns=A;
	endcase
end
always @(posedge y)begin
temp_count = temp_count+1;
end
assign y=(cs==D)? 1'b1 : 1'b0 ;
assign count = temp_count;

endmodule