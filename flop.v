module D_flip(D,E,clk,Q);
input D,E,clk;
output reg Q;
always @(posedge clk ) begin
	if (E) begin
		Q<=D;
		
	end
	
end

endmodule