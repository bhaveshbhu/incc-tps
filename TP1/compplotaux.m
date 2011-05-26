function [comp, cantB] = compplotaux(datos, complejidades)


    comp = [];
    cantB = [];
    for l=1:27
        for t=1:2
            for m=1:2
              if abs(datos(l,t,m).accuracy-0.52)<0.1
                  comp = [comp,log(complejidades(l,t,m))];
                  temp = datos(l,t,m).cantBurbujas;
                  cantB = [cantB,temp];
              end
            end
        end
    end

end