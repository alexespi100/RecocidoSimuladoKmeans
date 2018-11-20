%**** Este código se queda igual, solamente modifiqué el output de la función
function [CT, C] = Ejercicio2(KS)
% Como inputs solamente son necesarios el número de clusters
% KS representa el número de clusters
close all
p= [1 1; 2 1 ; 3 1 ; 2 2 ; 3 2 ; 3 3 ; 4 3 ; 4 4 ; 6 4 ; 4 5 ; 6 6 ; 9 5 ; 4 7; 8 7; 5 8; 6 8 ; 10 8 ; 6 9 ; 8 9 ; 10 9];
px= p(:,1);
py= p(:,2);
figure
hold on
plot(px,py,'o')
axis([0 10 0 10])
grid on
[idx,C,sd,d]= kmeans(p,KS);
%plot(C(:,1),C(:,2),'r*');
CK= zeros(1,KS);
VCK= CK;
% Evaluaremos las distancias y la profundidad para sacar el costo de cada
% pozo y sumarlo al costo por plataforma que depende del pozo.
px=p(:,1);
py=p(:,2);
vd=zeros(1,20);
vdis=zeros(1,20);
A=0;
for q=1:20
    dis = d(q,:);
    vd= .5+(.05*px(q))^2+.1*py(q);
    vdis= min(dis); % este vector representa las distancias hacía todas las
    A=A+(vd+vdis)^2;% plataformas, si encontramos el mínimo, encontramos la
end                 % distancia hacía la plataforma que le pertenece y calcular el costo
% Calcular los Ck's
for q1= 1:KS
    for q2= 1:20
        if idx(q2)==q1
            CK(q1)= CK(q1)+1;
        end
    end
end
for q3= 1:KS
    VCK(q3)= 12.1497*(CK(q3))^(.6770); % se hace un vector con todos los valores
end                                    % de Ck dependiendo de cuantos pozos le toquen
                                       % a cada plataforma

CT=A+ sum(VCK);
end

%  Como son aleatorios las iteraciones, con un mismo número de clusters se pueden
%  obtener resultados diferentes, para combatir esto sacaremos un promedio
%  de 3 evaluaciones y este será el dato con el que compararemos el número
%  de clusters con otros.

