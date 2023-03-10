module latch_tb();
reg aset,gate,aclr;
wire [2:0]q;
reg [2:0] data;
parameter n=3;
latch #(n) m1 (aset,data,gate,aclr,q);
integer i=0,j=0;
initial begin
aset=0;
data=0;
gate=0;
aclr=1;
#10;
aset=1;
#10;
aclr=0;
#5 aset=0;
data=3'b110;
#5
gate=1;
for(i=0;i<1000;i=i+1)begin
	data=$random;
	#5;
end

$stop;
end
initial begin 
#100;
for(j=0;j<1000;j=j+1)begin 
aclr=$random;
aset=$random;
gate=$random;
#5;
end
end
initial begin 
$monitor("aset=%b,data=%d,gate=%b,aclr=%b,q=%d",aset,data,gate,aclr,q);
end
endmodule