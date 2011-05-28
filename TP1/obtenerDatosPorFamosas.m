if ~exist('datos','var')
    load('./datosf.mat');
end

if ~exist('reconocimientoLetras','var')
    load('./famosasPorSujeto.mat');
end

if ~exist('complejidades','var')
    load('./complejidades.mat');
end

noConocidas      = struct('letra',0,'tipografia',0, 'mayuscula',0, 'burbujas', 0, 'complejidad', 0.000, 'accuracy', 0.000, 'tiempoRespuesta', 0.0000);
conocidas        = struct('letra',0,'tipografia',0, 'mayuscula',0, 'burbujas', 0, 'complejidad', 0.000, 'accuracy', 0.000, 'tiempoRespuesta', 0.0000);
conocidasVistas  = struct('letra',0,'tipografia',0, 'mayuscula',0, 'burbujas', 0, 'complejidad', 0.000, 'accuracy', 0.000, 'tiempoRespuesta', 0.0000);

datosPorFamosas.noConocidas     = noConocidas;
datosPorFamosas.conocidas       = conocidas;
datosPorFamosas.conocidasVistas = conocidasVistas;

cantNoConocidas     = 0;
cantConocidas       = 0;
cantConocidasVistas = 0;

for sujeto=1:length(reconocimientoLetras(1,1,1,:))
    cantNoConocidas     = 0;
    cantConocidas       = 0;
    cantConocidasVistas = 0;
    for letra=1:27
        for tipo=2:2
            for may=1:2
                if length(datos(letra,tipo,may).vector{sujeto})<1
                    continue;
                end
                burbujas        = max([datos(letra,tipo,may).vector{sujeto}.cantBurbujas]);
                respCorrectas   = ([datos(letra,tipo,may).vector{sujeto}.respuesta] == datos(letra,tipo,may).letra);
                accuracy        = sum(respCorrectas)/length(respCorrectas);
                tiempoRespuesta = mean([datos(letra,tipo,may).vector{sujeto}.tiemporespuesta]);
                elemento = struct('letra',letra,'tipografia',tipo, 'mayuscula', may, 'burbujas', burbujas, 'complejidad', complejidades(letra,tipo,may), 'accuracy', accuracy, 'tiempoRespuesta', tiempoRespuesta );
                switch reconocimientoLetras(letra,tipo,may,sujeto)
                    case -1
                        cantNoConocidas = cantNoConocidas+1; noConocidas(cantNoConocidas)=elemento;
                    case 0
                        cantConocidas   = cantConocidas+1; conocidas(cantConocidas)=elemento;
                    case 1
                        cantConocidasVistas = cantConocidasVistas+1; conocidasVistas(cantConocidasVistas)=elemento;
                end
            end
        end
    end
    datosPorFamosas(sujeto)=struct('noConocidas', noConocidas, 'conocidas', conocidas, 'conocidasVistas', conocidasVistas);
end

save ('datosPorFamosas.mat','datosPorFamosas');
