function [ A0,A1,A2,A3 ] = acs4( Nval )
% This function is used to simulate the behavioural of ACS4
% realized in third laboratory of Integrated Systems Architecture
%                   [ A0,A1,A2,A3 ] = acs4( Nval )

%creating the input vector
[C1, C2] = cCreator(Nval);


%prealocation of output value
A0 = zeros(Nval-3,1);
A1 = zeros(Nval-3,1);
A2 = zeros(Nval-3,1);
A3 = zeros(Nval-3,1);

for i=1:Nval-3
   
   C1_bin = int2complement(C1(i),5);
   C2_bin = int2complement(C2(i),5);
   
   C1(i) = complement2int(C1_bin);
   C2(i) = complement2int(C2_bin);

   G3 = C1(i)+C2(i);
   G2 = C2(i);
   G1 = C1(i);

   if i == 1
      a0_a0_g0 = 0;
      a0_a2_g3 = G3;
      a1_a2_g0 = 0;
      a1_a0_g3 = G3;
      a2_a3_g2 = G2;
      a2_a1_g1 = G1;
      a3_a1_g2 = G2;
      a3_a3_g1 = G1;
   else
      a0_a0_g0 = A0(i-1);
      a0_a2_g3 = A2(i-1) + G3;
      a1_a2_g0 = A2(i-1);
      a1_a0_g3 = G3 + A0(i-1);
      a2_a3_g2 = A3(i-1) + G2;
      a2_a1_g1 = A1(i-1) + G1;
      a3_a1_g2 = A1(i-1) + G2;
      a3_a3_g1 = A3(i-1) + G1;
   end
      
   A0(i) = max(a0_a0_g0, a0_a2_g3);
   A1(i) = max(a1_a2_g0, a1_a0_g3);
   A2(i) = max(a2_a3_g2, a2_a1_g1);
   A3(i) = max(a3_a1_g2, a3_a3_g1);

   A0_bin = int2complement(A0(i),8);
   A1_bin = int2complement(A1(i),8);
   A2_bin = int2complement(A2(i),8);
   A3_bin = int2complement(A3(i),8);
   A0(i) = complement2int(A0_bin);
   A1(i) = complement2int(A1_bin);
   A2(i) = complement2int(A2_bin);
   A3(i) = complement2int(A3_bin);
    
end

end

