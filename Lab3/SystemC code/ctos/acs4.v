`timescale 1ns/1ns

module acs4 (CLK, RST_n, CLEAR, C0, C1, A0, A1, A2, A3);

  input CLK;
  input RST_n;
  input CLEAR;
  input [4:0] C0;
  input [4:0] C1;

  output [7:0] A0;
  output [7:0] A1;
  output [7:0] A2;
  output [7:0] A3;

  reg [7:0] a0_reg;
  reg [7:0] a1_reg;
  reg [7:0] a2_reg;
  reg [7:0] a3_reg;

  wire [5:0] g1;
  wire [5:0] g2;
  wire [5:0] g3;

  wire [7:0] a0_a0_g0;
  wire [7:0] a0_a2_g3;

  wire [7:0] a1_a2_g0;
  wire [7:0] a1_a0_g3;

  wire [7:0] a2_a3_g2;
  wire [7:0] a2_a1_g1;
	
  wire [7:0] a3_a1_g2;
  wire [7:0] a3_a3_g1;

  assign #1 g1 = {C0[4], C0};
  assign #1 g2 = {C1[4], C1};
  assign #1 g3 = {C0[4], C0} + {C1[4], C1};

  assign #1 a0_a0_g0 = a0_reg;
  assign #1 a0_a2_g3 = a2_reg + {g3[5], g3[5], g3};

  assign #1 a1_a2_g0 = a2_reg;
  assign #1 a1_a0_g3 = a0_reg + {g3[5], g3[5], g3};

  assign #1 a2_a3_g2 = a3_reg + {g2[5], g2[5], g2};
  assign #1 a2_a1_g1 = a1_reg + {g1[5], g1[5], g1};

  assign #1 a3_a1_g2 = a1_reg + {g2[5], g2[5], g2};
  assign #1 a3_a3_g1 = a3_reg + {g1[5], g1[5], g1};

  acs A0i(.X0(a0_a0_g0),
	  .X1(a0_a2_g3),
   	  .Y(A0));

  acs A1i(.X0(a1_a2_g0),
	  .X1(a1_a0_g3),
   	  .Y(A1));

  acs A2i(.X0(a2_a3_g2),
	  .X1(a2_a1_g1),
   	  .Y(A2));

  acs A3i(.X0(a3_a1_g2),
	  .X1(a3_a3_g1),
   	  .Y(A3));

  always @(posedge CLK or negedge RST_n) 
  begin
    if (!RST_n) 
     begin
       a0_reg <= #1 8'b0;
       a1_reg <= #1 8'b0;
       a2_reg <= #1 8'b0;
       a3_reg <= #1 8'b0;
     end
     else 
     begin
       if (CLEAR) 
       begin
         a0_reg <= #1 8'b0;
         a1_reg <= #1 8'b0;
         a2_reg <= #1 8'b0;
         a3_reg <= #1 8'b0;
       end
       else 
       begin
         a0_reg <= #1 A0;
         a1_reg <= #1 A1;
         a2_reg <= #1 A2;
         a3_reg <= #1 A3;
       end
     end
  end

endmodule