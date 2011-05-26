function [comp, cantB] = compplotaux(tipos, datos, complejidades, error)


    comp = [];
    cantB = [];
    for l=1:27
        for t = tipos
            for m=1:2
              if abs(datos(l,t,m).accuracy-0.5)<error
                  comp = [comp,log(complejidades(l,t,m))];
                  temp = datos(l,t,m).cantBurbujas;
                  cantB = [cantB,temp];
              end
            end
        end
    end

end