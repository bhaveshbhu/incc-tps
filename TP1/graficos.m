% ## GRAFICOS ###



% -- Boxplot de las complejidades de las letras
boxplot([complejidades(:,1,1),complejidades(:,1,2),complejidades(:,2,1),complejidades(:,2,2),complejidades(:,3,1),complejidades(:,3,2)], 'notch', 'on', 'labels', {'Arial Min', 'Arial May', 'Kunstler Min','Kunstler May', 'Famosas Min', 'Famosas May'});

% -- Tasa de aciertos con respecto a la complejidad de cada letra

