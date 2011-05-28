sujetos = 2;
datosNoConocidas = [];
datosConocidas = [];
datosConocidasVistas = [];
for sujetos = 1:6
    datosNoConocidas = [datosNoConocidas, [datosPorFamosas(sujetos).noConocidas(:).burbujas]./log([datosPorFamosas(sujetos).noConocidas(:).complejidad])];
    datosConocidas = [datosConocidas, [datosPorFamosas(sujetos).conocidas(:).burbujas]./log([datosPorFamosas(sujetos).conocidas(:).complejidad])];
    datosConocidasVistas = [datosConocidasVistas, [datosPorFamosas(sujetos).conocidasVistas(:).burbujas]./log([datosPorFamosas(sujetos).conocidasVistas(:).complejidad])];
end
[n1, noConocidas] = hist(datosNoConocidas); 
[n2, conocidas] = hist(datosConocidas); 
[n3, conocidasVistas] = hist(datosConocidasVistas); 
 
% [n1, noConocidas] = hist([datosPorFamosas(sujetos).noConocidas(:).burbujas]./log([datosPorFamosas(sujetos).noConocidas(:).complejidad]));
% [n2, conocidas] = hist([datosPorFamosas(sujetos).conocidas(:).burbujas]./log([datosPorFamosas(sujetos).conocidas(:).complejidad])); 
% [n3, conocidasVistas] = hist([datosPorFamosas(sujetos).conocidasVistas(:).burbujas]./log([datosPorFamosas(sujetos).conocidasVistas(:).complejidad])); 
plot(noConocidas, n1, 'r'); % Plot in red 
hold on; 
plot(conocidas, n2, 'g'); % Plot in green 
hold on; 
plot(conocidasVistas, n3, 'b'); % Plot in blue 
mean(datosNoConocidas)
mean(datosConocidas)
mean(datosConocidasVistas)