
% ### OBTENCION DE RASGOS POR LETRA-TIPOGRAFIA-CASE ####

if IsWin()
	letras=['a';'b';'c';'d';'e';'f';'g';'h';'i';'j';'k';'l';'m';'n';'�';'o';'p';'q';'r';'s';'t';'u';'v';'w';'x';'y';'z'];
else
	letras=['a';'b';'c';'d';'e';'f';'g';'h';'i';'j';'k';'l';'m';'n';'ñ';'o';'p';'q';'r';'s';'t';'u';'v';'w';'x';'y';'z'];
end

rasgosLetra = struct('mr1', zeros(256,256),'mr2', zeros(256,256),'mr3', zeros(256,256),'mr4', zeros(256,256),'mr5', zeros(256,256),'mr6', zeros(256,256),...
                    'mr7', zeros(256,256),'mr8', zeros(256,256),'mr9', zeros(256,256),'mr10', zeros(256,256),'mr11', zeros(256,256));

rasgos = rasgosLetra;

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
            
            rasgos(letra,tipo,may) = struct('mr1', mr1,'mr2', mr2,'mr3', mr3,'mr4', mr4,'mr5', mr5,'mr6', mr6,'mr7', mr7,'mr8', mr8,'mr9', mr9,'mr10', mr10,'mr11', mr11);
        end
    end
end

save('rasgos.mat','rasgos');



