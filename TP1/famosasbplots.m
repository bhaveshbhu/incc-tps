sujetos = 2;
datosNoConocidas = [];
datosConocidas = [];
datosConocidasVistas = [];
for sujetos = 1:6
    datosNoConocidas = [datosNoConocidas, [datosPorFamosas(sujetos).noConocidas(:).burbujas]./log([datosPorFamosas(sujetos).noConocidas(:).complejidad])];
    datosConocidas = [datosConocidas, [datosPorFamosas(sujetos).conocidas(:).burbujas]./log([datosPorFamosas(sujetos).conocidas(:).complejidad])];
    datosConocidasVistas = [datosConocidasVistas, [datosPorFamosas(sujetos).conocidasVistas(:).burbujas]./log([datosPorFamosas(sujetos).conocidasVistas(:).complejidad])];
end
bin = (1:40)/8;

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
ylabel('%Letras'); xlabel('max(#Bubbles) / log(complejidad)');
subplot(2,2,2);
bar(conocidas, n2, 'g'); % Plot in green 
ylabel('%Letras'); xlabel('max(#Bubbles) / log(complejidad)');
subplot(2,2,3);
bar(conocidasVistas, n3, 'b'); % Plot in blue 
ylabel('%Letras'); xlabel('max(#Bubbles) / log(complejidad)');
subplot(2,2,4);
misdatos = [[datosNoConocidas',ones(length(datosNoConocidas),1)*-1];[datosConocidas',zeros(length(datosConocidas),1)];[datosConocidasVistas',ones(length(datosConocidasVistas),1)]];
boxplot(misdatos(:,1),misdatos(:,2),'labels',{'No Conocidas','No Vistas','Vistas'});
ylabel('Tiempo de respuesta (s)');
[mean(datosNoConocidas), std(datosNoConocidas)]
[mean(datosConocidas), std(datosConocidas)]
[mean(datosConocidasVistas), std(datosConocidasVistas)]

%bubblesFamosas = [ones(length(datosNoConocidas),1)*-1,datosNoConocidas';zeros(length(datosConocidas),1),datosConocidas';ones(length(datosConocidasVistas),1),datosConocidasVistas'];
%save4spss(bubblesFamosas, ['Grupo','bubbles'], 'bubblesfamosas.dat');   