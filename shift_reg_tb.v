module shift_R_tb();
reg sclr,sset,shiftin,load,clk,enable,aclr,aset;
reg [7:0] data;
wire[7:0] q;
wire shift_out;
shift_R #(.LOAD_AVALUE(10),.SHIFT_DIRECTION("LEFT"),.LOAD_SVALUE(15),.SHIFT_WIDTH(8)) R1 (q,shift_out,sclr,sset,shiftin,load,data,clk,enable,aclr,aset);
integer i=0,j=0;

initial begin
	clk=0;
forever 
#1 clk=~clk;
end
initial
 begin
sclr=0;
sset=0;
shiftin=0;
load=1;
data=8'b11111011;
enable=0;
aclr=0;
aset=0;
#100;
aclr=0;
enable=1;
load=0;
#50;
for(i=0;i<1000;i=i+1)begin 
@(negedge clk)
shiftin=0;
end
$stop;
end

initial 
begin
$monitor("temp=%d",R1.temp); 
//#500;
/*for(j=0;j<1000;j=j+1)begin
@(negedge clk)
aclr=$random;
aset=$random;
sset=$random;
sclr=$random;
 end*/

end

endmodule 











/*module sle_tb ();
reg D,clk,En,Aln,Adn,sln,sd,lat;
wire Q;
integer i=0;
sle s2 (D,clk,En,Aln,Adn,sln,sd,lat,Q);
initial begin
	clk=0;
forever 
#1 clk=~clk;
end
initial begin 
D=0;
En=0;
Aln=0;
Adn=0;
sln=0;
sd=1;
lat=0;
#50;
Aln=1;
En=1;
#10;
for(i=0;i<1000;i=i+1)begin 
@(negedge clk)
D=$random;
sln=$random;
sd=$random;
end
$stop;
end
initial 
begin 
#200;
lat=1;
#100;

end
initial begin 

$monotor("D=%b,En=%b,Aln=%b,Adn=%b,sln=%b,sd=%b,lat=%b,Q=%b",D,En,Aln,Adn,sln,sd,lat,Q);

end
endmodule*/