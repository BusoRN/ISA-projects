N=7;

h=[121,-128,77,-79,51,-57,31];
for y = 0:15
    f1=fopen('Dati_in.txt');
    f=fscanf(f1,'%g',y);
    f=fscanf(f1,'%g',N);
    fclose(f1);


    data_in=zeros(1,7);
    
    for i=1:7
        data_in(i)=int2fix1(f(i));
    end
    %data_in

    h_in=zeros(1,7);

    for i=1:7
        h_in(i)=int2fix1(h(i));
    end
    %h_in

    data_in_inv= fliplr(data_in);

    result=sum(data_in_inv.*h_in)
end