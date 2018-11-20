%Este es un c�digo para "comprobar" qu� tan mal est� la implementaci�n, en
%si se debe de pode solamente con funprom, funvec2 y Ejercicio2 para el
%programa, esto s�lamente gr�fica los pozos y hace una b�squeda exhaustiva
%del espacio de b�squeda.

function MejorEncontrado
PE=zeros(1,20);
p= [1 1; 2 1 ; 3 1 ; 2 2 ; 3 2 ; 3 3 ; 4 3 ; 4 4 ; 6 4 ; 4 5 ; 6 6 ; 9 5 ; 4 7; 8 7; 5 8; 6 8 ; 10 8 ; 6 9 ; 8 9 ; 10 9];
px= p(:,1);
py= p(:,2);
for R=1:20
    [XX,CC]=funprom(R); % La modificaci�n fue que ahora funprom tiene dos 
    PE(R)= XX;          % outputs, uno es el valor del promedio que usamos
    if PE(R)==min(PE)   % para evaluar y optimizar y el otro es la matriz
        CC1=CC;         % del mejor encontrado con las coordenadas.
    end
end
xcc= 1:20;
    
for R= 1:20
    if PE(R)== min(PE)  % el vector PE representa el promedio de las 
        M=R;            % iteraciones para cada n�mero de plataformas
    end                 % cuando el valor del n�mero de plataformas sea el
end                     % m�nimo, sabemos que ese es el n�mero �ptimo
sprintf('El n�mero de plataformas con menor costo es de %d plataformas',M)
figure
hold on
plot(xcc,PE)
plot(M,PE(M),'*')
title('El valor m�nimo se encuentra resaltado')
hold off
figure
hold on
% [~,qew,~,~]= kmeans(p,M);
plot(px,py,'o')
axis([0 10 0 10])
grid on
plot(CC1(:,1),CC1(:,2),'g*');           % Aqu� trat� de graficar la matriz de coordenadas
title('Coordenadas �ptimas de los pozos')%pero no s� porque no funciona
end