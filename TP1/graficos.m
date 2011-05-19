% ## GRAFICOS ###



% -- Boxplot de las complejidades de las letras
boxplot([complejidades(:,:,1);complejidades(:,:,2)], 'notch', 'on', 'labels', {'Arial', 'Kunstler', 'Famosas'});

% -- Tasa de aciertos con respecto a la complejidad de cada letra

