% ## CALCULAR IMPORTANCIA RELATIVA DE RASGOS POR TIPOGRAFÃ?A-MAY/MIN ## 

if ~(exist('aparicionesRasgos','var'))
    load('rasgos.mat');
end
if ~(exist('rasgosLetras','var'))
    load ('relevanciaRasgos.mat');
end

impRelativaRasgos = zeros(3,2,11);

for tipo=1:3
    for may=1:2
	for letra=1:27
    		impRelativaRasgos(tipo,may,1) = impRelativaRasgos(tipo,may,1) + rasgosLetras(letra,tipo,may).r1.importancia;
		impRelativaRasgos(tipo,may,2) = impRelativaRasgos(tipo,may,2) + rasgosLetras(letra,tipo,may).r2.importancia;
    		impRelativaRasgos(tipo,may,3) = impRelativaRasgos(tipo,may,3) + rasgosLetras(letra,tipo,may).r3.importancia;
		impRelativaRasgos(tipo,may,4) = impRelativaRasgos(tipo,may,4) + rasgosLetras(letra,tipo,may).r4.importancia;
    		impRelativaRasgos(tipo,may,5) = impRelativaRasgos(tipo,may,5) + rasgosLetras(letra,tipo,may).r5.importancia;
		impRelativaRasgos(tipo,may,6) = impRelativaRasgos(tipo,may,6) + rasgosLetras(letra,tipo,may).r6.importancia;
    		impRelativaRasgos(tipo,may,7) = impRelativaRasgos(tipo,may,7) + rasgosLetras(letra,tipo,may).r7.importancia;
		impRelativaRasgos(tipo,may,8) = impRelativaRasgos(tipo,may,8) + rasgosLetras(letra,tipo,may).r8.importancia;
		impRelativaRasgos(tipo,may,9) = impRelativaRasgos(tipo,may,9) + rasgosLetras(letra,tipo,may).r9.importancia;
		impRelativaRasgos(tipo,may,10) = impRelativaRasgos(tipo,may,10) + rasgosLetras(letra,tipo,may).r10.importancia;
		impRelativaRasgos(tipo,may,11) = impRelativaRasgos(tipo,may,11) + rasgosLetras(letra,tipo,may).r11.importancia;
        end
    end
end

impRelativaRasgos = impRelativaRasgos ./ aparicionesRasgos;

save('impRelativaRasgos.mat','impRelativaRasgos', '-V7');