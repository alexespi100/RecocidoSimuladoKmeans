%Este es un código para "comprobar" qué tan mal está la implementación, en
%si se debe de pode solamente con funprom, funvec2 y Ejercicio2 para el
%programa, esto sólamente gráfica los pozos y hace una búsqueda exhaustiva
%del espacio de búsqueda.

function MejorEncontrado
PE=zeros(1,20);
p= [1 1; 2 1 ; 3 1 ; 2 2 ; 3 2 ; 3 3 ; 4 3 ; 4 4 ; 6 4 ; 4 5 ; 6 6 ; 9 5 ; 4 7; 8 7; 5 8; 6 8 ; 10 8 ; 6 9 ; 8 9 ; 10 9];
px= p(:,1);
py= p(:,2);
for R=1:20
    [XX,CC]=funprom(R); % La modificación fue que ahora funprom tiene dos 
    PE(R)= XX;          % outputs, uno es el valor del promedio que usamos
    if PE(R)==min(PE)   % para evaluar y optimizar y el otro es la matriz
        CC1=CC;         % del mejor encontrado con las coordenadas.
    end
end
xcc= 1:20;
    
for R= 1:20
    if PE(R)== min(PE)  % el vector PE representa el promedio de las 
        M=R;            % iteraciones para cada número de plataformas
    end                 % cuando el valor del número de plataformas sea el
end                     % mínimo, sabemos que ese es el número óptimo
sprintf('El número de plataformas con menor costo es de %d plataformas',M)
figure
hold on
plot(xcc,PE)
plot(M,PE(M),'*')
title('El valor mínimo se encuentra resaltado')
hold off
figure
hold on
% [~,qew,~,~]= kmeans(p,M);
plot(px,py,'o')
axis([0 10 0 10])
grid on
plot(CC1(:,1),CC1(:,2),'g*');           % Aquí traté de graficar la matriz de coordenadas
title('Coordenadas óptimas de los pozos')%pero no sé porque no funciona
end