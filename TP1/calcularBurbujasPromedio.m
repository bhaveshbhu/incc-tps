if ~exist('datos','var')
      load('./datos/datos.mat');
end

burbujasPromedio = ones(27,3,2) * 0.0001;

for letra=1:27
    for tipo=1:3
        for may=1:2
		burbujasPromedio(letra,tipo,may) = datos(letra,tipo,may).cantBurbujas;
        end
    end
end

% Se calcula la cantidad de burbujas total para todas las bandas
burbujasPromedioTotales = round(burbujasPromedio)+round(round(burbujasPromedio)/2)+round(round(burbujasPromedio)/4)+round(round(burbujasPromedio)/8)+round(round(burbujasPromedio)/16);

save('burbujasPromedio.mat','burbujasPromedio','burbujasPromedioTotales','-V7');