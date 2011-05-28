function [comp, cantB, acc, text] = compplotaux(tipos, datos, complejidades, error)


    comp = [];
    cantB = [];
    acc = [];
    text = [];
    for l=1:27
        for t = tipos
            for m=1:2
              %if (datos(l,t,m).accuracy-0.5)>-error
              if abs(datos(l,t,m).accuracy-0.5)<error
                  comp = [comp,log(complejidades(l,t,m))];
                  temp = datos(l,t,m).cantBurbujas;
                  cantB = [cantB,temp];
                  acc = [acc,datos(l,t,m).accuracy];
                  if m==2
                      text = [text, upper(datos(l,t,m).letra)];
                  else
                      text = [text, datos(l,t,m).letra];
                  end
                  
              end
            end
        end
    end

end