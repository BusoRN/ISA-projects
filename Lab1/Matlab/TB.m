clc;

x=load('Dati_in.txt'); % carico i dati in igresso nel vettore colonna x
H = [ 121 ; 128 ; 77 ; 177 ; 51 ; 199 ; 31];
%converto i taps in binario e li stampo fuori
H_bin_1 = dec2bin(H(1),8);
H_bin_2 = dec2bin(H(2),8);
H_bin_3 = dec2bin(H(3),8);
H_bin_4 = dec2bin(H(4),8);
H_bin_5 = dec2bin(H(5),8);
H_bin_6 = dec2bin(H(6),8);
H_bin_7 = dec2bin(H(7),8);

fprintf('H1 = '); fprintf(H_bin_1); fprintf('\n');
fprintf('H2 = '); fprintf(H_bin_2); fprintf('\n');
fprintf('H3 = '); fprintf(H_bin_3); fprintf('\n');
fprintf('H4 = '); fprintf(H_bin_4); fprintf('\n');
fprintf('H5 = '); fprintf(H_bin_5); fprintf('\n');
fprintf('H6 = '); fprintf(H_bin_6); fprintf('\n');
fprintf('H7 = '); fprintf(H_bin_7); fprintf('\n');

% converto in intero con segno il vettore H
H(1) = complement2int(H_bin_1);
H(2) = complement2int(H_bin_2);
H(3) = complement2int(H_bin_3);
H(4) = complement2int(H_bin_4);
H(5) = complement2int(H_bin_5);
H(6) = complement2int(H_bin_6);
H(7) = complement2int(H_bin_7);


c=1;% a cazzo
indice = 1;
i= length(x); %lunghezza dei dati in ingresso SAREBBE:8 BIT??
dato_elaborato=zeros(7,1);%vettore colonna contenente gli 8 dati in ingresso
f = zeros(7,1);
vettore_uscita=zeros(fix(length(x)-7)); %%%???
while i >= 7
    i = i -1;
    dato_elaborato = x(indice:indice+6);
    indice = indice +1;
    dato_elaborato = flipud(dato_elaborato); %inverto l'ordine degli elementi nel vettore colonna
    f = dato_elaborato .* H;
    
    y = sum(f);
    %%%%%%%%%%%% ocio al parallelismo
    y_bin = int2complement(y,18); %%% 7+7=14 + 1 DI OVERFLOW + 3 DI GUARDIA??
    y = complement2int(y_bin(1:8)); %troncamento
    fprintf('Il valore dell''uscita è %d \n',y);
    
    vettore_uscita(c) = y;
    c = c+1;
end

%save uscita.txt -ascii vettore_uscita;
file_id= fopen('uscita.txt','w') ;
for i=1:c-1
fprintf(file_id,'%d\n',vettore_uscita(i));
end
fclose(file_id);

    