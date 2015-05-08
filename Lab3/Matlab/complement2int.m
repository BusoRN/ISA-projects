function [ c2 ] = complement2int( a )
%La funzione accetta in ingresso una stringa in complemento a 2 e fornisce
%in uscita il suo valore intero
%                   [ c2 ] = complement2int( a )
if a(1) == '1'
    c2 = -2^((length(a))-1) + bin2dec(a(2:length(a)));
else
    c2 = bin2dec(a);
end
end

