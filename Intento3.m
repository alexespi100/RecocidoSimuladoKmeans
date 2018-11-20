for R=1:20
    [XX,CC]=funprom(R);
    PE(R)= XX;
    if PE(R)==min(PE)
        CC1=CC;
    end
end

% Para que entiendas de donde sale el error, escribe [X1,Y1] = funprom(13)
% Te da el resultado de la evaluación, te da la matriz de coordenadas
% el problema es que sale que los argumentos de salida no fueron asignados. 
% No entiendo porque no funciona sí la llamo individualmente me sale pero
% en el ciclo no.

