if ~exist('encuestas','var')
    load('./encuestas.mat');
end

if ~exist('famosas','var')
    load('./letrasFamosas.mat');
end

reconocimientoLetras = ones(27,3,2)*2;

for enc=1:length(encuestas)
    reconocimientoSujeto = ones(27,3,2)*(-1);
    for letra=1:27
        for may=1:2
            respuesta = encuestas(enc).tipografias(famosas(letra,may));
            if (respuesta == 'X')
                reconocimientoSujeto(letra,3,may) = 1;
            else
                if (respuesta == 'F')
                    reconocimientoSujeto(letra,3,may) = 0;
                else
                    reconocimientoSujeto(letra,3,may) = -1;                        
                end
            end
        end
    end
    reconocimientoLetras(:,:,:,enc) = reconocimientoSujeto;
end


save('famosasPorSujeto.mat','reconocimientoLetras');