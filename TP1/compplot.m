load 'complejidades.mat'
load 'datos.mat'

[comp1, cantB1] = compplotaux([1:2],datos,complejidades,0.1);
% [comp2, cantB2] = compplotaux(2,datos,complejidades,0.1);
% [comp3, cantB3] = compplotaux(3,datos,complejidades,0.1);
clear temp;
%plot(comp1,cantB1,'x',comp2,cantB2,'o',comp3,cantB3,'s');
plot(comp1,cantB1,'x');
xlabel('Complejidad');
ylabel('Cantidad de Bubbles');