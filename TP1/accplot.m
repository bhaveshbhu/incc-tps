load 'complejidades.mat'
if ~(exist('datos', 'var'))
    load 'datos.mat'
end
error = 0.5;
% [comp1, cantB1] = compplotaux([1:2],datos,complejidades,error);
[comp1, cantB1, acc1, text1] = compplotaux(1,datos,complejidades,error);
[comp2, cantB2, acc2, text2] = compplotaux(2,datos,complejidades,error);
[comp3, cantB3, acc3, text3] = compplotaux(3,datos,complejidades,error);
clear temp;
clear error;
%plot(comp1,cantB1,'.r',comp2,cantB2,'.m',comp3,cantB3,'.b');
plot(acc1,cantB1,'.r',acc2,cantB2,'.m',acc3,cantB3,'.b');
for i = 1:length(comp1)
    text(acc1(i),cantB1(i)+0.25,text1(i), 'Color', 'Red');
end
for i = 1:length(comp2)
    text(acc2(i),cantB2(i)+0.25,text2(i), 'Color', 'Magenta');
end
for i = 1:length(comp3)
    text(acc3(i),cantB3(i)+0.25,text3(i), 'Color', 'Blue');
end
%plot3(comp1,cantB1, acc1,'or',comp2,cantB2, acc2,'og',comp3,cantB3, acc3,'ob');
% plot(comp1,cantB1,'x');
xlabel('Accuracy');
ylabel('Cantidad de Bubbles');
zlabel('Accuracy');
grid on;