function [ a_bin ] = int2complement( a, N )
% La funzione converte un intero con segno in una stringa binaria
% di lunghezza N che tiene conto dell'estensione del segno.
%           [ a_bin ] = int2complement( a, N )

if a < 0
    a_bin = dec2bin(a+2^N);
else
    a_bin = dec2bin(a,N);
end


end

