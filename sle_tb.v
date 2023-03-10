module sle_tb ();
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
endmodule