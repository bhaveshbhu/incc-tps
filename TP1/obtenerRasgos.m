
% ### OBTENCION DE RASGOS POR LETRA-TIPOGRAFIA-CASE ####

if IsWin()
	letras=['a';'b';'c';'d';'e';'f';'g';'h';'i';'j';'k';'l';'m';'n';'�';'o';'p';'q';'r';'s';'t';'u';'v';'w';'x';'y';'z'];
else
	letras=['a';'b';'c';'d';'e';'f';'g';'h';'i';'j';'k';'l';'m';'n';'ñ';'o';'p';'q';'r';'s';'t';'u';'v';'w';'x';'y';'z'];
end

rasgosLetra = struct('mr1', zeros(256,256),'mr2', zeros(256,256),'mr3', zeros(256,256),'mr4', zeros(256,256),'mr5', zeros(256,256),'mr6', zeros(256,256),...
                    'mr7', zeros(256,256),'mr8', zeros(256,256),'mr9', zeros(256,256),'mr10', zeros(256,256),'mr11', zeros(256,256));

rasgos = rasgosLetra;
aparicionesRasgos = zeros(3,2,11); % Contador de apariciones por tipografía-may/min-rasgo

for letra=1:27
    for tipo=1:3
        for may=1:2
          
            if may==2
                mayStr='may';
            else
                mayStr='min';
            end
            nombreArchivo=['rasgos/', deblank(letras(letra,:)),'_',int2str(tipo),'_',mayStr,'_0.ppm'];
            [mr1,mr2,mr3,mr4,mr5,mr6,mr7,mr8,mr9,mr10,mr11] = obtenerRasgosLetra(imread(nombreArchivo));
            
	    if sum(sum(mr1)) > 0 % Si el rasgo está definido para la letra
		  aparicionesRasgos(tipo,may,1) = aparicionesRasgos(tipo,may,1) + 1;
	    end

	    if sum(sum(mr2)) > 0 % Si el rasgo está definido para la letra
		  aparicionesRasgos(tipo,may,2) = aparicionesRasgos(tipo,may,2) + 1;
	    end

	    if sum(sum(mr3)) > 0 % Si el rasgo está definido para la letra
		  aparicionesRasgos(tipo,may,3) = aparicionesRasgos(tipo,may,3) + 1;
	    end

	    if sum(sum(mr4)) > 0 % Si el rasgo está definido para la letra
		  aparicionesRasgos(tipo,may,4) = aparicionesRasgos(tipo,may,4) + 1;
	    end

	    if sum(sum(mr5)) > 0 % Si el rasgo está definido para la letra
		  aparicionesRasgos(tipo,may,5) = aparicionesRasgos(tipo,may,5) + 1;
	    end

	    if sum(sum(mr6)) > 0 % Si el rasgo está definido para la letra
		  aparicionesRasgos(tipo,may,6) = aparicionesRasgos(tipo,may,6) + 1;
	    end

	    if sum(sum(mr7)) > 0 % Si el rasgo está definido para la letra
		  aparicionesRasgos(tipo,may,7) = aparicionesRasgos(tipo,may,7) + 1;
	    end

	    if sum(sum(mr8)) > 0 % Si el rasgo está definido para la letra
		  aparicionesRasgos(tipo,may,8) = aparicionesRasgos(tipo,may,8) + 1;
	    end

	    if sum(sum(mr9)) > 0 % Si el rasgo está definido para la letra
		  aparicionesRasgos(tipo,may,9) = aparicionesRasgos(tipo,may,9) + 1;
	    end

	    if sum(sum(mr10)) > 0 % Si el rasgo está definido para la letra
		  aparicionesRasgos(tipo,may,10) = aparicionesRasgos(tipo,may,10) + 1;
	    end

	    if sum(sum(mr11)) > 0 % Si el rasgo está definido para la letra
		  aparicionesRasgos(tipo,may,11) = aparicionesRasgos(tipo,may,11) + 1;
	    end

            rasgos(letra,tipo,may) = struct('mr1', mr1,'mr2', mr2,'mr3', mr3,'mr4', mr4,'mr5', mr5,'mr6', mr6,'mr7', mr7,'mr8', mr8,'mr9', mr9,'mr10', mr10,'mr11', mr11);
        end
    end
end

save('rasgos.mat','rasgos', 'aparicionesRasgos');



