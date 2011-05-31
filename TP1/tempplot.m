if ~(exist('datos', 'var'))
    load 'datos.mat';
end

dist = [];
for l=1:27
    for t=1:3
        for m=1:2
            for v=1:length(datos(l,t,m).vector)
                vector = datos(l,t,m).vector{v};
                for i=1:length(vector)
                    dist = [dist,vector(i).tiemporespuesta];
                end
            end
        end
    end
end

bin = (1:90)/8;
[counts, bins] = hist(dist,bin);
bar(bin,counts)
xlabel('Tiempo (s)');
ylabel('#Estímulos');
    