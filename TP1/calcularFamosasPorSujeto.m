if ~exist('encuestas','var')
    load('./encuestas.mat');
end

if ~exist('relevanciaRasgos','var')
    load('./relevanciaRasgos.mat');
end

if ~exist('famosas','var')
    load('./letrasFamosas.mat');
end



for letra=1:27
    for tipo=1:3
        for may=1:2
            
            mascara     = mascarasResultado(letra,tipo,may).mascaraResultante; % Obtención de máscara con áreas relevantes por letra
            rasgosLetra = rasgos(letra,tipo,may);            % Obtención de rasgos por letra
            rasgosLetras(letra,tipo,may) = [calcularRelevanciaRasgosLetra(mascara, rasgosLetra)]; % Cálculo de relevancia por letra
        end
    end
end