`timescale 1ns/1ns

module acs (X0, X1, Y);

  input [7:0] X0;
  input [7:0] X1;
  output reg [7:0] Y;

  wire [7:0] x01;

  assign #1 x01 = X0 - X1;	

  always @ (x01, X0, X1) 
  begin
    if (!x01[7]) 
    begin
	Y <= #1 X0;
    end
    else 
    begin
	Y <= #1 X1;
    end
  end

endmodule