function [ w ] = int2fix5( a )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
b=int2complement(a,8);
c=zeros(8,1);
h=[-2^4;2^3;2^2;2^1;2^0;2^-1;2^-2;2^-3];
for i = 1:8
    c(i) = str2num(b(i));
end
w=sum(c.*h);

end

