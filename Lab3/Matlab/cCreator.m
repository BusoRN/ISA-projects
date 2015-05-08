function [ C1, C2 ] = cCreator( Nval )
%This function creates the two vectors which contain
%the values of inputs C1 and C2
%    function [ C1, C2 ] = cCreator( Nval )
C1 = zeros(Nval-3,1);
C2 = zeros(Nval-3,1);
for i=1:Nval-3
    C1(i) = 12+i-1;
    C2(i) = -4+i-1;
end

end

