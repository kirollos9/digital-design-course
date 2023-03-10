module latch(aset,data,gate,aclr,q);
parameter n=4;
input aset,aclr,gate;
input [n-1:0]data;
output reg [n-1:0]q;
wire clk;
integer i=0;
always @(*) begin
	if (aclr) begin
	q<=0;
	end
	else begin

	 if (aset) begin
		for(i=0;i<n;i=i+1)begin
		q[i]<=1;

			end
		end
		else
		 begin
	   if(gate) 
	    q<=data;
	        
	      end
	end
	end 
	

endmodule