module sle (D,clk,En,Aln,Adn,sln,sd,lat,Q);
input D,clk,En,Aln,Adn,sln,sd,lat;
output reg Q;
always @(posedge clk or negedge Aln) begin
	if (~Aln) begin
		Q<=!Adn;	
	end
	else if (En & ~lat) begin
	        if(~sln)
	          Q<=sd;
	        else 
	          Q<=D;


		
	end
end

always @(*) begin
	if (~Aln) begin
		Q<=!Adn;
		
	end
	else if (clk) begin
	     if(lat &En)begin 
	     if(~sln)
	          Q<=sd;
	        else 
	          Q<=D;



    	end


	
	end
end


endmodule