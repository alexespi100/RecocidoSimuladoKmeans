% El código hace 3 iteraciones usando kmeans y saca el promedio del número
% de clusters que fue usado como input. Esta función es la equivalente a la
% función objetivo.
function [CTT2, CC] = funprom(K1)
B=0;
SDK = zeros(1, 3);
CN=zeros(1,3);
p= [1 1; 2 1 ; 3 1 ; 2 2 ; 3 2 ; 3 3 ; 4 3 ; 4 4 ; 6 4 ; 4 5 ; 6 6 ; 9 5 ; 4 7; 8 7; 5 8; 6 8 ; 10 8 ; 6 9 ; 8 9 ; 10 9];
px= p(:,1);
py= p(:,2);
for w= 1:3
    [SD,C1]= Ejercicio2(K1); % La modificación de este es que saca como output la matriz de coordenadas de la evaluación con
    B= B+ SDK(w);                % menor valor.
    SDK(w) = SD;
end
for w = 1:3
    if min(CN)==SD
        CC=C1(w);
    end
CTT2 = B/3;
end
end
