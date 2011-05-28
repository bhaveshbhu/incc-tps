sujetos = 2;
datosNoConocidas = [];
datosConocidas = [];
datosConocidasVistas = [];
for sujetos = 1:6
    datosNoConocidas = [datosNoConocidas, [datosPorFamosas(sujetos).noConocidas(:).tiempoRespuesta]];
    datosConocidas = [datosConocidas, [datosPorFamosas(sujetos).conocidas(:).tiempoRespuesta]];
    datosConocidasVistas = [datosConocidasVistas, [datosPorFamosas(sujetos).conocidasVistas(:).tiempoRespuesta]];
end
[n1, noConocidas] = hist(datosNoConocidas,(1:30)/3); 
[n2, conocidas] = hist(datosConocidas,(1:30)/3); 
[n3, conocidasVistas] = hist(datosConocidasVistas,(1:30)/3); 
 
% [n1, noConocidas] = hist([datosPorFamosas(sujetos).noConocidas(:).burbujas]./log([datosPorFamosas(sujetos).noConocidas(:).complejidad]));
% [n2, conocidas] = hist([datosPorFamosas(sujetos).conocidas(:).burbujas]./log([datosPorFamosas(sujetos).conocidas(:).complejidad])); 
% [n3, conocidasVistas] = hist([datosPorFamosas(sujetos).conocidasVistas(:).burbujas]./log([datosPorFamosas(sujetos).conocidasVistas(:).complejidad])); 
subplot(1,2,1);
plot(noConocidas, n1, 'r'); % Plot in red 
hold on; 
plot(conocidas, n2, 'g'); % Plot in green 
hold on; 
plot(conocidasVistas, n3, 'b'); % Plot in blue 
axis([0 3 0 100]);
subplot(1,2,2);
misdatos = [[datosNoConocidas',ones(length(datosNoConocidas),1)*-1];[datosConocidas',zeros(length(datosConocidas),1)];[datosConocidasVistas',ones(length(datosConocidasVistas),1)]];
boxplot(misdatos(:,1),misdatos(:,2));
