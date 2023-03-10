module counter_1(clk,rst,count);

input clk,rst;
output reg [3:0] count;
always @(posedge clk or negedge rst) begin
	if (~rst) begin
		count<=0;
		
	end
	else 
	count<=count+1;
	
end

endmodule

module D_flip(D,rst,clk,Q,Qbar);
input D,rst,clk;
output reg Q;
output Qbar;
assign Qbar=~Q;
always @(posedge clk or negedge rst) begin
	if (~rst) begin
		Q<=0;
		
	end
	else begin
		Q<=D;
	end
	
end

endmodule

module bit4_ripple(clk,rst,out);
input clk,rst;
output [3:0]out;
wire [3:0]q; 
D_flip a1 (out[0],rst,clk,q[0],out[0]);
D_flip a2(out[1],rst,q[0],q[1],out[1]);
D_flip a3(out[2],rst,q[1],q[2],out[2]);
D_flip a4(out[3],rst,q[2],q[3],out[3]);

endmodule
