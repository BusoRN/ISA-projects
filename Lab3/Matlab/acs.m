function [ o ] = acs( x,y )
%implements the comparation block of acs algorithm
%            [ o ] = acs( x,y )
if x - y > 0
    o = x;
else
    o = y;
end

end

