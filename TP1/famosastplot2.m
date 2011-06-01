datosNoConocidas= tiemposFamosas(tiemposFamosas(:,1)==-1,2);
datosConocidas = tiemposFamosas(tiemposFamosas(:,1)==0,2);
datosConocidasVistas = tiemposFamosas(tiemposFamosas(:,1)==1,2);

datosNoConocidas = datosNoConocidas(datosNoConocidas<1.95);
datosConocidas = datosConocidas(datosConocidas<1.95);
datosConocidasVistas = datosConocidasVistas(datosConocidasVistas<1.95);

bin = (1:20)/8;

[n1, noConocidas] = hist(datosNoConocidas,bin); 
[n2, conocidas] = hist(datosConocidas, bin); 
[n3, conocidasVistas] = hist(datosConocidasVistas,bin); 

n1 = n1/length(datosNoConocidas);
n2 = n2/length(datosConocidas);
n3 = n3/length(datosConocidasVistas);
 
% [n1, noConocidas] = hist([datosPorFamosas(sujetos).noConocidas(:).burbujas]./log([datosPorFamosas(sujetos).noConocidas(:).complejidad]));
% [n2, conocidas] = hist([datosPorFamosas(sujetos).conocidas(:).burbujas]./log([datosPorFamosas(sujetos).conocidas(:).complejidad])); 
% [n3, conocidasVistas] = hist([datosPorFamosas(sujetos).conocidasVistas(:).burbujas]./log([datosPorFamosas(sujetos).conocidasVistas(:).complejidad])); 
subplot(2,2,1);
bar(noConocidas, n1, 'r'); % Plot in red 
axis([0 2.5 0 0.3]);xlabel('Tiempo de respuesta (s)');ylabel('%estímulos');
title('No Conocidas','FontWeight','bold');
subplot(2,2,2);
bar(conocidas, n2, 'g'); % Plot in green 
axis([0 2.5 0 0.3]);xlabel('Tiempo de respuesta (s)');ylabel('%estímulos');
title('Conocidas no vistas en el experimento','FontWeight','bold');
subplot(2,2,3);
bar(conocidasVistas, n3, 'b'); % Plot in blue 
axis([0 2.5 0 0.3]);xlabel('Tiempo de respuesta (s)');ylabel('%estímulos');
title('Conocidas vistas en el experimento','FontWeight','bold');
subplot(2,2,4);
misdatos = [[datosNoConocidas,ones(length(datosNoConocidas),1)*-1];[datosConocidas,zeros(length(datosConocidas),1)];[datosConocidasVistas,ones(length(datosConocidasVistas),1)]];
boxplot(misdatos(:,1),misdatos(:,2),'labels',{'No Conocidas','No Vistas','Vistas'});
ylabel('Tiempo de respuesta (s)');
[mean(datosNoConocidas), std(datosNoConocidas)]
[mean(datosConocidas), std(datosConocidas)]
[mean(datosConocidasVistas), std(datosConocidasVistas)]
