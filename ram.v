module ram_flip(dout,parity_out,din,addr,wr_en,rd_en,blk_select,addr_en,dout_en,clk,rst);
parameter MEM_WIDTH=16;
parameter MEM_DEPTH=1024;
parameter ADDR_SIZE=10;
parameter ADDR_PIPELINE="FALSE";
parameter DOUT_PIPELINE="TRUE";
parameter PARITY_ENABLE=1;
input clk,rst,wr_en,rd_en,blk_select,addr_en,dout_en;
input [ADDR_SIZE-1:0]addr;
input [MEM_WIDTH-1:0]din;
output parity_out;
output reg [MEM_WIDTH-1:0]dout;
reg [MEM_WIDTH-1:0]memory_output;
reg [MEM_WIDTH-1:0]mem[MEM_DEPTH-1:0];
wire [ADDR_SIZE-1:0]pip_address;
reg [ADDR_SIZE-1:0]addr_input;
wire [MEM_WIDTH-1:0] pip_dout;
// firstmux
always@(*)begin
	if(ADDR_PIPELINE=="TRUE")
		addr_input=pip_address;
	else 
		addr_input=addr;
end
//secondmux
always@(*)begin
	if(DOUT_PIPELINE=="TRUE")
		dout=pip_dout;
	else 
		dout=memory_output;
end
always @(posedge clk or posedge rst) begin
	if (rst) begin
	dout<=0;
	end
	else if(blk_select) begin 
	if(wr_en)
		mem[addr_input]<=din;
	if(rd_en)
		memory_output<=mem[addr_input];
	end
end
D_flip #(10) d1(addr,addr_en,clk,pip_address);
D_flip d2(memory_output,dout_en,clk,pip_dout);
assign parity_out=~^dout;
endmodule

module D_flip(D,E,clk,Q);
parameter width=16;
input E,clk;
input [width-1:0]D; 
output reg[width-1:0] Q;
always @(posedge clk ) begin
	if (E) begin
		Q<=D;
		
	end
	
end

endmodule
