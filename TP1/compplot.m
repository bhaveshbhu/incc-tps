load 'complejidades.mat'
load 'datos.mat'

comp = [];
cantB = [];
for l=1:27
    for t=1:3
        for m=1:2
          if abs(datos(l,t,m).accuracy-0.52)<0.1
              comp = [comp,complejidades(l,t,m)];
              temp = datos(l,t,m).cantBurbujas;
              cantB = [cantB,temp];
          end
        end
    end
end
clear temp;
plot(comp,cantB,'x');
xlabel('Complejidad');
ylabel('Cantidad de Bubbles');