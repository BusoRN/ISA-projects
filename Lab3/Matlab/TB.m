clc
clear 
close all

Nval = 23;

[A0,A1,A2,A3] = acs4(Nval);

file_id= fopen('uscita.txt','w') ;

for i=1:5
fprintf(file_id,'%d\n',0);
fprintf(file_id,'%d\n',0);
fprintf(file_id,'%d\n',0);
fprintf(file_id,'%d\n',0);
fprintf(file_id,'\n');
end

for i=1:Nval-3
fprintf(file_id,'%d\n',A0(i));
fprintf(file_id,'%d\n',A1(i));
fprintf(file_id,'%d\n',A2(i));
fprintf(file_id,'%d\n',A3(i));
fprintf(file_id,'\n');
end

fprintf(file_id,'\n');
fprintf(file_id,'\n');

fclose(file_id);