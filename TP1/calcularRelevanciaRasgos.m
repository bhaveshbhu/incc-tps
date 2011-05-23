
% ### OBTENCION DE IMPORTANCIA RELATIVA DE RASGOS POR LETRA-TIPOGRAFIA-CASE ####
if ~(exist('planos','var'))
    load('./datos/planos.mat');
end

if ~(exist('rasgos','var'))
    load('rasgos.mat');
end

mascarasResultado = obtenerMascarasResultado(planos);
mascara      = mascarasResultado(1,1,1).mascaraResultante;
rasgosLetra  = rasgos(1,1,1);
rasgosLetras = calcularRelevanciaRasgosLetra(mascara, rasgosLetra);

for letra=1:27
    for tipo=1:3
        for may=1:2
            mascara     = mascarasResultado(letra,tipo,may).mascaraResultante; % Obtención de máscara con áreas relevantes por letra
            rasgosLetra = rasgos(letra,tipo,may);            % Obtención de rasgos por letra
            rasgosLetras(letra,tipo,may) = [calcularRelevanciaRasgosLetra(mascara, rasgosLetra)]; % Cálculo de relevancia por letra
        end
    end
end

save('relevanciaRasgos.mat','rasgosLetras');

